import { SubLayerRules } from "../types";

export const singlekeys: SubLayerRules = {
  // Easy left hand navigation[
  /*   { */
  /*     "type": "down", */
  /*     "name": {"apple_vendor_top_case_key_code":"keyboard_fn"}, */
  /*     "usagePage": "255 (0x00ff)", */
  /*     "usage": "3 (0x0003)", */
  /*     "misc": "flags fn" */
  /*   }, */
  /*   { */
  /*     "type": "up", */
  /*     "name": {"apple_vendor_top_case_key_code":"keyboard_fn"}, */
  /*     "usagePage": "255 (0x00ff)", */
  /*     "usage": "3 (0x0003)", */
  /*     "misc": "" */
  /*   } */
  /* ] */
  a: {
    description: "Focus on left window",
    to: [
      {
        key_code: "a",
        modifiers: ["left_option"],
      },
    ],
  },
};
