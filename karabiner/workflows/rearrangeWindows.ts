import { KeyCode } from "../types";
import { HyperKeySublayer, LayerCommand } from "../utils/createHyperSublayer";

/* Re-arrange windows using skhd */
export const rearrangeWindows: {
  [key_code in KeyCode]?: HyperKeySublayer | LayerCommand;
} = {
  r: {
    h: {
      description: "Focus west",
      to: [
        {
          key_code: "h",
          modifiers: ["left_shift", "left_command"],
        },
      ],
    },
    j: {
      description: "Focus south",
      to: [
        {
          key_code: "j",
          modifiers: ["left_shift", "left_command"],
        },
      ],
    },
    k: {
      description: "Focus north",
      to: [
        {
          key_code: "k",
          modifiers: ["left_shift", "left_command"],
        },
      ],
    },
    l: {
      description: "Focus east",
      to: [
        {
          key_code: "l",
          modifiers: ["left_shift", "left_command"],
        },
      ],
    },
    n: {
      description: "Rotate 270",
      to: [
        {
          key_code: "n",
          modifiers: ["left_shift", "left_command"],
        },
      ],
    },
  },
};
