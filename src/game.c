#include <ultra64.h>

#include "sm64.h"
#include "game.h"
#include "main.h"
#include "memory.h"
#include "save_file.h"

// FIXME: I'm not sure all of these variables belong in this file, but I don't
// know of a good way to split them
struct Controller gControllers[3];
OSContStatus gControllerStatuses[4];
OSContPad gControllerPads[4];
OSMesgQueue D_80339CA0;
OSMesgQueue D_80339CB8;
OSMesg D_80339CD0;
OSMesg D_80339CD4;
struct Struct8032C620 D_80339CD8;
u32 gFrameBuffers[3];
u32 D_80339CEC;
void *D_80339CF0;
void *D_80339CF4;
struct Struct8032C630 *D_80339CF8;
Gfx *gDisplayListHead;
u8 *gGfxPoolEnd;
Gfx *D_80339D04;
u8 gControllerBits;
s8 gEepromProbe;

void (*D_8032C6A0)(void) = NULL;
struct Controller *gPlayer1Controller = &gControllers[0];
struct Controller *D_8032C6A8 = &gControllers[1];
struct Controller *gPlayer2Controller = &gControllers[2];
struct DemoInput *gCurrDemoInput = NULL; // demo input sequence
u16 gDemoInputListID = 0;
struct DemoInput gRecordedDemoInput = {0};

// this function records distinct inputs over a 255-frame interval to RAM locations and was likely
// used to record the demo sequences seen in the final game. This function is unused.
void record_demo(void)
{
    // record the player's button mask and current rawStickX and rawStickY.
    u8 buttonMask = ((gPlayer1Controller->buttonDown & (A_BUTTON   | B_BUTTON   | Z_TRIG     | START_BUTTON)) >> 8) 
                  |  (gPlayer1Controller->buttonDown & (U_CBUTTONS | D_CBUTTONS | L_CBUTTONS | R_CBUTTONS));
    s8 rawStickX     =   gPlayer1Controller->rawStickX;
    s8 rawStickY     =   gPlayer1Controller->rawStickY;

    // if the stick is in deadzone, set its value to 0 to
    // nullify the effects. We do not record deadzone inputs.
    if(rawStickX > -8 && rawStickX < 8)
        rawStickX = 0;

    if(rawStickY > -8 && rawStickY < 8)
        rawStickY = 0;

    // record the distinct input and timer so long as they
    // are unique. If the timer hits 0xFF, reset the timer
    // for the next demo input.
    if(gRecordedDemoInput.timer == 0xFF 
    || buttonMask != gRecordedDemoInput.button 
    || rawStickX  != gRecordedDemoInput.rawStickX 
    || rawStickY  != gRecordedDemoInput.rawStickY)
    {
        gRecordedDemoInput.timer = 0;
        gRecordedDemoInput.button = buttonMask;
        gRecordedDemoInput.rawStickX = rawStickX;
        gRecordedDemoInput.rawStickY = rawStickY;
    }
    gRecordedDemoInput.timer++;
}

// take the updated controller struct and calculate
// the new x, y, and distance floats.
void adjust_analog_stick(struct Controller *controller)
{
    UNUSED u8 pad[8];

    // reset the controller's x and y floats.
    controller->stickX = 0;
    controller->stickY = 0;

    // modulate the rawStickX and rawStickY to be the new float values by adding/subtracting 6.
    if(controller->rawStickX <= -8)
        controller->stickX = controller->rawStickX + 6;

    if(controller->rawStickX >=  8)
        controller->stickX = controller->rawStickX - 6;

    if(controller->rawStickY <= -8)
        controller->stickY = controller->rawStickY + 6;

    if(controller->rawStickY >=  8)
        controller->stickY = controller->rawStickY - 6;

    // calculate float magnitude from the center by vector length.
    controller->stickMag = sqrtf(controller->stickX * controller->stickX 
                               + controller->stickY * controller->stickY);

    // magnitude cannot exceed 64.0f: if it does, modify the values appropriately to
    // flatten the values down to the allowed maximum value.
    if(controller->stickMag > 64)
    {
        controller->stickX  *= 64 / controller->stickMag;
        controller->stickY  *= 64 / controller->stickMag;
        controller->stickMag = 64;
    }
}

// if a demo sequence exists, this will run the demo 
// input list until it is complete. called every frame.
void run_demo_inputs(void)
{
    // eliminate the unused bits.
    gControllers[0].controllerData->button &= VALID_BUTTONS;

    /*
        Check if a demo inputs list
        exists and if so, run the
        active demo input list.
    */
    if(gCurrDemoInput != NULL)
    {
        /*
            clear player 2's inputs if they exist. Player 2's controller 
            cannot be used to influence a demo. At some point, Nintendo 
            may have planned for there to be a demo where 2 players moved 
            around instead of just one, so clearing player 2's influence from
            the demo had to have been necessary to perform this. Co-op mode, perhaps?
        */
        if(gControllers[1].controllerData != NULL)
        {
            gControllers[1].controllerData->rawStickX = 0;
            gControllers[1].controllerData->rawStickY = 0;
            gControllers[1].controllerData->button = 0;
        }

        // the timer variable being 0 at the current input means the demo is over.
        // set the button to the END_DEMO mask to end the demo.
        if(gCurrDemoInput->timer == 0)
        {
            gControllers[0].controllerData->rawStickX = 0;
            gControllers[0].controllerData->rawStickY = 0;
            gControllers[0].controllerData->button = END_DEMO;
        }
        else
        {
            // backup the start button if it is pressed, since we don't want the
            // demo input to override the mask where start may have been pressed.
            u16 startPushed = gControllers[0].controllerData->button & START_BUTTON;

            // perform the demo inputs by assigning the current button mask and the stick inputs.
            gControllers[0].controllerData->rawStickX = gCurrDemoInput->rawStickX;
            gControllers[0].controllerData->rawStickY = gCurrDemoInput->rawStickY;

            /*
                to assign the demo input, the button information is stored in 
                an 8-bit mask rather than a 16-bit mask. this is because only 
                A, B, Z, Start, and the C-Buttons are used in a demo, as bits 
                in that order. In order to assign the mask, we need to take the 
                upper 4 bits (A, B, Z, and Start) and shift then left by 8 to 
                match the correct input mask. We then add this to the masked 
                lower 4 bits to get the correct button mask.
            */
            gControllers[0].controllerData->button = ((gCurrDemoInput->button & 0xF0) << 8) 
                                                   + ((gCurrDemoInput->button & 0xF));

            // if start was pushed, put it into the demo sequence being input to
            // end the demo.
            gControllers[0].controllerData->button |= startPushed;
            
            // run the current demo input's timer down. if it hits 0, advance the
            // demo input list.
            if(--gCurrDemoInput->timer == 0)
                gCurrDemoInput++;
        }
    }
}

// update the controller struct with available inputs if present.
void read_controller_inputs(void)
{
    int i;

    // if any controllers are plugged in, update the
    // controller information.
    if(gControllerBits)
    {
        osRecvMesg(&gSIEventMesgQueue, &D_80339BEC, 1);
        osContGetReadData(&gControllerPads[0]);
    }
    run_demo_inputs();

    for(i = 0; i < 2; i++)
    {
        struct Controller *controller = &gControllers[i];

        // if we're receiving inputs, update the controller struct
        // with the new button info.
        if(controller->controllerData != NULL)
        {
            controller->rawStickX     =  controller->controllerData->rawStickX;
            controller->rawStickY     =  controller->controllerData->rawStickY;
            controller->buttonPressed =  controller->controllerData->button 
                                      & (controller->controllerData->button 
                                      ^  controller->buttonDown);
            // 0.5x A presses are a good meme
            controller->buttonDown = controller->controllerData->button; 
            adjust_analog_stick(controller);
        }
        else // otherwise, if the controllerData is NULL, 0 out all of the inputs.
        {
            controller->rawStickX = 0;
            controller->rawStickY = 0;
            controller->buttonPressed = 0;
            controller->buttonDown = 0;
            controller->stickX = 0;
            controller->stickY = 0;
            controller->stickMag = 0;
        }
    }

    // since player 2 support was removed from super mario 64, the developers opted to
    // be sure of 0 influence from player 2 by overriding player 2's inputs with player 1's.
    gPlayer2Controller->rawStickX = gPlayer1Controller->rawStickX;
    gPlayer2Controller->rawStickY = gPlayer1Controller->rawStickY;
    gPlayer2Controller->stickX = gPlayer1Controller->stickX;
    gPlayer2Controller->stickY = gPlayer1Controller->stickY;
    gPlayer2Controller->stickMag = gPlayer1Controller->stickMag;
    gPlayer2Controller->buttonPressed = gPlayer1Controller->buttonPressed;
    gPlayer2Controller->buttonDown = gPlayer1Controller->buttonDown;
}

// initialize the controller structs to point at the OSCont information.
void init_controllers(void)
{
    s16 port, cont;

    // set controller 1 to point to the set of status/pads for input 1 and
    // init the controllers.
    gControllers[0].statusData = &gControllerStatuses[0];
    gControllers[0].controllerData = &gControllerPads[0];
    osContInit(&gSIEventMesgQueue, &gControllerBits, &gControllerStatuses[0]);

    // strangely enough, the EEPROM probe for save data is done in this function.
    // save pak detection?
    gEepromProbe = osEepromProbe(&gSIEventMesgQueue);

    // loop over the 4 ports and link the controller structs to the appropriate
    // status and pad.
    for (cont = 0, port = 0; port < 4 && cont < 2; port++)
    {
        // is controller plugged in?
        if (gControllerBits & (1 << port))
        {
            // the game allows you to have just 1 controller plugged
            // into any port in order to play the game. this was probably
            // so if any of the ports didnt work, you can have controllers
            // plugged into any of them and it will work.
            gControllers[cont  ].statusData = &gControllerStatuses[port];
            gControllers[cont++].controllerData = &gControllerPads[port];
        }
    }
}

void func_80248934(void)
{
    UNUSED u8 pad[8];

    set_segment_base_addr(0, (void *)0x80000000);
    osCreateMesgQueue(&D_80339CB8, &D_80339CD4, 1);
    osCreateMesgQueue(&D_80339CA0, &D_80339CD0, 1);
    D_80339CEC    = VIRTUAL_TO_PHYSICAL(D_80000400);
    gFrameBuffers[0] = VIRTUAL_TO_PHYSICAL(gFrameBuffer0);
    gFrameBuffers[1] = VIRTUAL_TO_PHYSICAL(gFrameBuffer1);
    gFrameBuffers[2] = VIRTUAL_TO_PHYSICAL(gFrameBuffer2);
    D_80339CF0 = _pool_alloc(0x4000, 0);
    set_segment_base_addr(17, (void *)D_80339CF0);
    DynamicObjectCopy(&D_80339D10, D_004E9FA0, D_80339CF0);
    D_80339CF4 = _pool_alloc(2048, 0);
    set_segment_base_addr(24, (void *)D_80339CF4);
    DynamicObjectCopy(&gDemo, D_00577BC0, D_80339CF4);
    load_from_rom(16, main_entry, main_entry_end, 0);
    load_from_rom_decompress(2, font_graphics, font_graphics_end);
}

// main game loop thread. runs forever as long as the game
// continues.
void thread5_game_loop(UNUSED void *arg)
{
    u32 addr;

    func_80248934();
    init_controllers();
    save_file_load_all();

    func_80246B14(2, &D_80339CD8, &D_80339CA0, (OSMesg)1);
    addr = (u32)segmented_to_virtual(D_10000000);
    func_80320AE8(2, 0, 0);
    func_80248DD8(save_file_get_sound_mode());
    func_80247ED8();

    while(1)
    {
        // if the reset timer is active, run the process to reset the game.
        if(gResetTimer)
        {
            func_80247D84();
            continue;
        }
        func_8027DE30(0);

        // if any controllers are plugged in, start read the data for when
        // read_controller_inputs is called later.
        if(gControllerBits)
            osContStartReadData(&gSIEventMesgQueue);
        
        func_802494A8();
        func_80247FAC();
        read_controller_inputs();
        addr = LevelScriptLoad(addr);
        func_80248060();

        // when debug info is enabled, print the "BUF %d" information.
        if(gShowDebugText)
            // subtract the end of the gfx pool with the display list to obtain the
            // amount of free space remaining.
            PrintInt(180, 20, "BUF %d", (int)gGfxPoolEnd - (int)gDisplayListHead);
    }
}