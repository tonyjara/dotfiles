import { SubLayerRules } from "../types";

/** Hacer VOLAR a otra ventana*/
export const yeetWindows: SubLayerRules = {
  v: {
    h: {
      description: "Go to space 1",
      to: [
        {
          key_code: "1",
          modifiers: ["left_option", "left_shift"],
        },

        //Switch to the yeeting space
        {
          key_code: "1",
          modifiers: ["left_option"],
        },
      ],
    },
    j: {
      description: "Go to space 2",
      to: [
        {
          key_code: "2",
          modifiers: ["left_option", "left_shift"],
        },

        //Switch to the yeeting space
        {
          key_code: "2",
          modifiers: ["left_option"],
        },
      ],
    },
    k: {
      description: "Go to space 3",
      to: [
        {
          key_code: "3",
          modifiers: ["left_option", "left_shift"],
        },
        //Switch to the yeeting space
        {
          key_code: "3",
          modifiers: ["left_option"],
        },
      ],
    },
    l: {
      description: "Go to space 4",
      to: [
        {
          key_code: "4",
          modifiers: ["left_option", "left_shift"],
        },

        //Switch to the yeeting space
        {
          key_code: "4",
          modifiers: ["left_option"],
        },
      ],
    },
    n: {
      description: "Go to space 5",
      to: [
        {
          key_code: "5",
          modifiers: ["left_option", "left_shift"],
        },

        //Switch to the yeeting space
        {
          key_code: "5",
          modifiers: ["left_option"],
        },
      ],
    },
    m: {
      description: "Go to space 6",
      to: [
        {
          key_code: "6",
          modifiers: ["left_option", "left_shift"],
        },

        //Switch to the yeeting space
        {
          key_code: "6",
          modifiers: ["left_option"],
        },
      ],
    },
    comma: {
      description: "Go to space 7",
      to: [
        {
          key_code: "7",
          modifiers: ["left_option", "left_shift"],
        },

        //Switch to the yeeting space
        {
          key_code: "7",
          modifiers: ["left_option"],
        },
      ],
    },
    period: {
      description: "Go to space 8",
      to: [
        {
          key_code: "8",
          modifiers: ["left_option", "left_shift"],
        },

        //Switch to the yeeting space
        {
          key_code: "8",
          modifiers: ["left_option"],
        },
      ],
    },
  },
};
