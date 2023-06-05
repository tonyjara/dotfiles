import fs from "fs";
import { KarabinerRules } from "./types";
import { createHyperSubLayers } from "./utils/createHyperSublayer";
import { rearrangeWindows } from "./workflows/rearrangeWindows";
import { focusWindows } from "./workflows/focusWindows";
import { yeetWindows } from "./workflows/yeetWindows";
import { hyperSingleLetters } from "./workflows/hyperSingleLetters";
import { openApps } from "./workflows/openApps";
import { shellCommands } from "./workflows/shellCommands";
import { devices } from "./devices/devices";
import { fn_function_keys } from "./devices/functionKeys";

const mergedWorkflows = Object.assign(
  yeetWindows,
  focusWindows,
  rearrangeWindows,
  openApps,
  shellCommands,
  hyperSingleLetters
);

const rules: KarabinerRules[] = [
  // Define the Hyper key itself
  {
    description: "Hyper Key (⌃⌥⇧⌘)",
    manipulators: [
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
        show_in_menu_bar: true,
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
