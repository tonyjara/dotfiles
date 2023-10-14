import { SubLayerRules } from "../types";

/* Move through spaces using jkl; andm,.\/ */
export const moveThroughSpaces: SubLayerRules = {
  j: {
    description: "Go to space 1",
    to: [
      {
        key_code: "1",
        modifiers: ["left_option"],
      },
    ],
  },

  k: {
    description: "Go to space 1",
    to: [
      {
        key_code: "2",
        modifiers: ["left_option"],
      },
    ],
  },
};
