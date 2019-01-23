#include <ultra64.h>
extern OSMgrArgs piMgrArgs;
s32 osPiStartDma(OSIoMesg *mb, s32 priority, s32 direction,
                 u32 devAddr, void *vAddr, u32 nbytes, OSMesgQueue *mq)
{
    register s32 result;
    register OSMesgQueue *cmdQueue;
    if (!piMgrArgs.initialized)
        return -1;
    //TODO: name magic constants
    if (direction == 0)
    {
        mb->hdr.type = 11;
    }
    else
    {
        mb->hdr.type = 12;
    }
    mb->hdr.pri = priority;
    mb->hdr.retQueue = mq;
    mb->dramAddr = vAddr;
    mb->devAddr = devAddr;
    mb->size = nbytes;
    if (priority == 1)
    {
        cmdQueue = osPiGetCmdQueue();
        result = osJamMesg(cmdQueue, mb, 0);
    }
    else
    {
        cmdQueue = osPiGetCmdQueue();
        result = osSendMesg(cmdQueue, mb, OS_MESG_NOBLOCK);
    }
    return result;
}
