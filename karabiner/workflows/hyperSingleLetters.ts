import { SubLayerRules } from "../types";

export const hyperSingleLetters: SubLayerRules = {
  // Easy left hand navigation
  q: {
    description: "Focus on left window",
    to: [
      {
        key_code: "a",
        modifiers: ["left_option"],
      },
    ],
  },
  w: {
    description: "Focus on right window",
    to: [
      {
        key_code: "s",
        modifiers: ["left_option"],
      },
    ],
  },
  d: {
    description: "Show desktop",
    to: [
      {
        key_code: "f11",
        modifiers: ["fn"],
      },
    ],
  },
  l: {
    description: "Move to space on the right",
    to: [
      {
        key_code: "p",
        modifiers: ["left_option"],
      },
    ],
  },
  h: {
    description: "Move to space on the left",
    to: [
      {
        key_code: "n",
        modifiers: ["left_option"],
      },
    ],
  },
  c: {
    description: "Mission control (exposé)",
    to: [
      {
        key_code: "k",
        modifiers: ["left_control", "left_shift"],
      },
    ],
  },
  spacebar: {
    description: "Homerow",
    to: [
      {
        key_code: "spacebar",
        modifiers: ["command", "left_shift"],
      },
    ],
  },
  s: {
    description: "Homerow search",
    to: [
      {
        key_code: "s",
        modifiers: ["command", "left_shift"],
      },
    ],
  },
  //Navigate through numbered spaces

  // h: {
  //   description: "Go to space 1",
  //   to: [
  //     {
  //       key_code: "1",
  //       modifiers: ["left_option"],
  //     },
  //   ],
  // },
  // j: {
  //   description: "Go to space 2",
  //   to: [
  //     {
  //       key_code: "2",
  //       modifiers: ["left_option"],
  //     },
  //   ],
  // },
  // k: {
  //   description: "Go to space 3",
  //   to: [
  //     {
  //       key_code: "3",
  //       modifiers: ["left_option"],
  //     },
  //   ],
  // },
  // l: {
  //   description: "Go to space 4",
  //   to: [
  //     {
  //       key_code: "4",
  //       modifiers: ["left_option"],
  //     },
  //   ],
  // },
  // n: {
  //   description: "Go to space 5",
  //   to: [
  //     {
  //       key_code: "5",
  //       modifiers: ["left_option"],
  //     },
  //   ],
  // },
  // m: {
  //   description: "Go to space 6",
  //   to: [
  //     {
  //       key_code: "6",
  //       modifiers: ["left_option"],
  //     },
  //   ],
  // },
  // comma: {
  //   description: "Go to space 7",
  //   to: [
  //     {
  //       key_code: "7",
  //       modifiers: ["left_option"],
  //     },
  //   ],
  // },
  // period: {
  //   description: "Go to space 8",
  //   to: [
  //     {
  //       key_code: "8",
  //       modifiers: ["left_option"],
  //     },
  //   ],
  // },
};
