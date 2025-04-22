import { SubLayerRules } from "../types";

/** Focus through tiles with skhd*/
export const focusWindows: SubLayerRules = {
  f: {
    h: {
      description: "Focus west",
      to: [
        {
          key_code: "h",
          modifiers: ["left_shift", "left_option"],
        },
      ],
    },
    j: {
      description: "Focus south",
      to: [
        {
          key_code: "j",
          modifiers: ["left_shift", "left_option"],
        },
      ],
    },
    k: {
      description: "Focus north",
      to: [
        {
          key_code: "k",
          modifiers: ["left_shift", "left_option"],
        },
      ],
    },
    l: {
      description: "Focus east",
      to: [
        {
          key_code: "l",
          modifiers: ["left_shift", "left_option"],
        },
      ],
    },
  },
};
