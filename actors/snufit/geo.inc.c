// 0x0D0001A0
const uintptr_t snufit_geo[] = {
   GEO_SHADOW(SHADOW_CIRCLE_4_VERTS, 0x96, 100),
   GEO_OPEN_NODE(),
      GEO_SCALE(0x00, 16384),
      GEO_OPEN_NODE(),
         GEO_ASM(0, Geo18_8030D93C),
         GEO_TRANSLATE_NODE(0x00, 0, 0, 0),
         GEO_OPEN_NODE(),
            GEO_DISPLAY_LIST(LAYER_OPAQUE, snufit_seg6_dl_06009748),
         GEO_CLOSE_NODE(),
         GEO_DISPLAY_LIST(LAYER_OPAQUE, snufit_seg6_dl_06009498),
         GEO_DISPLAY_LIST(LAYER_OPAQUE, snufit_seg6_dl_06009938),
         GEO_DISPLAY_LIST(LAYER_OPAQUE, snufit_seg6_dl_06009B68),
         GEO_BILLBOARD(),
         GEO_OPEN_NODE(),
            GEO_ASM(0, Geo18_8030D9AC),
            GEO_SCALE(0x00, 0),
            GEO_OPEN_NODE(),
               GEO_DISPLAY_LIST(LAYER_ALPHA, snufit_seg6_dl_06009A10),
            GEO_CLOSE_NODE(),
         GEO_CLOSE_NODE(),
      GEO_CLOSE_NODE(),
   GEO_CLOSE_NODE(),
GEO_CLOSE_NODE(), //! more close than open nodes
GEO_END(),
};

