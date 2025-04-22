import fs from "fs";
import { KarabinerRules } from "./types";
import { createHyperSubLayers } from "./utils/createHyperSublayer";
import { rearrangeWindows } from "./workflows/rearrangeWindows";
import { focusWindows } from "./workflows/focusWindows";
import { yeetWindows } from "./workflows/yeetWindows";
import { hyperSingleLetters } from "./workflows/hyperSingleLetters";
import { openApps } from "./workflows/openApps";
import { shellCommands } from "./workflows/shellCommands";

const mergedWorkflows = Object.assign(
  yeetWindows,
  focusWindows,
  rearrangeWindows,
  openApps,
  shellCommands,
  hyperSingleLetters
);
//Example
/* { */
/*        "type": "basic", */
/*        "from": {...}, */
/*        "to": [...], */
/*        "to_if_alone": [...], */
/*        "to_if_held_down": [...], */
/*        "to_after_key_up": [...], */
/*        "to_delayed_action": { */
/*            "to_if_invoked": [...], */
/*            "to_if_canceled": [...], */
/*        }, */
/*        "conditions": [...], */
/*        "parameters": {...}, */
/*        "description": "Optional description for human" */
/*    }, */

const rules: KarabinerRules[] = [
  // Define the Hyper key itself
  {
    description: "Hyper Key (⌃⌥⇧⌘)",
    manipulators: [
      {
        description: "Left cmd is ctrl",
        from: {
          key_code: "left_command",
        },
        to: [
          {
            key_code: "left_control",
          },
        ],
        type: "basic",
      },
      {
        description: "Left ctr is cmd",
        from: {
          key_code: "left_control",
        },
        to: [
          {
            key_code: "left_command",
          },
        ],
        type: "basic",
      },
      /* { */
      /*   description: "Toggle yeet browser", */
      /*   from: { */
      /*     key_code: "fn", */
      /*   }, */
      /*   to_if_alone: [ */
      /*     { */
      /*       key_code: "3", */
      /*       modifiers: ["left_option"], */
      /*     }, */
      /*     { */
      /*       key_code: "3", */
      /*       modifiers: ["left_option", "left_shift"], */
      /*     }, */
      /*     //Switch to the yeeting space */
      /*     { */
      /*       key_code: "h", */
      /*       modifiers: ["left_command", "left_shift"], */
      /*     }, */
      /*   ], */
      /*   type: "basic", */
      /* }, */
      // {
      //   description: "Toggle yeet browser",
      //   from: {
      //     key_code: "escape",
      //   },
      //   to: [
      //     {
      //       key_code: "2",
      //       modifiers: ["left_option"],
      //     },
      //     {
      //       key_code: "2",
      //       modifiers: ["left_option", "left_shift"],
      //     },
      //   ],
      //   type: "basic",
      // },
      {
        description: "Caps Lock -> Hyper Key",
        from: {
          key_code: "caps_lock",
        },
        to: [
          {
            key_code: "left_shift",
            modifiers: ["left_command", "left_control", "left_option"],
          },
        ],
        to_if_alone: [
          {
            key_code: "escape",
          },
        ],
        type: "basic",
      },
    ],
  },
  // ORDER MATTERS, hyper mappings with no modifiers should be at the end
  ...createHyperSubLayers(mergedWorkflows),
];

fs.writeFileSync(
  "karabiner.json",
  JSON.stringify(
    {
      global: {
        show_in_menu_bar: false,
      },
      profiles: [
        {
          name: "Default",
          complex_modifications: {
            rules: [
              ...rules,

              {
                description: "Disable Cmd+H Hide (rev 2)",
                manipulators: [
                  {
                    description: "",
                    from: {
                      key_code: "h",
                      modifiers: {
                        mandatory: ["command"],
                      },
                    },
                    type: "basic",
                  },
                ],
              },
            ],
          },
        },
      ],
      /* devices, */
      /* fn_function_keys, */
    },
    null,
    2
  )
);
