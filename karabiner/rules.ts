import fs from "fs";
import { KarabinerRules } from "./types";
import { createHyperSubLayers } from "./utils/createHyperSublayer";
import { app } from "./utils/utils";
import { moveThroughSpaces } from "./workflows/moveThroughSpaces";

const spaces = Object.keys(moveThroughSpaces).map((key) => {
  return {
    [key]: moveThroughSpaces[key],
  };
});

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
  ...createHyperSubLayers({
    // Rearrange windows with skhd

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
    },

    // Focus through tiles with skhd
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

    //Hacer VOLAR a otra ventana
    v: {
      h: {
        description: "Go to space 1",
        to: [
          {
            key_code: "1",
            modifiers: ["left_option", "left_shift"],
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
        ],
      },
      k: {
        description: "Go to space 3",
        to: [
          {
            key_code: "3",
            modifiers: ["left_option", "left_shift"],
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
        ],
      },
      n: {
        description: "Go to space 5",
        to: [
          {
            key_code: "5",
            modifiers: ["left_option", "left_shift"],
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
        ],
      },
      comma: {
        description: "Go to space 7",
        to: [
          {
            key_code: "7",
            modifiers: ["left_option", "left_shift"],
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
        ],
      },
    },

    // Easy left hand navigation
    a: {
      description: "Focus on left window",
      to: [
        {
          key_code: "a",
          modifiers: ["left_option"],
        },
      ],
    },
    s: {
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
        },
      ],
    },
    x: {
      description: "Move to space on the right",
      to: [
        {
          key_code: "l",
          modifiers: ["left_control", "left_shift"],
        },
      ],
    },
    z: {
      description: "Move to space on the left",
      to: [
        {
          key_code: "h",
          modifiers: ["left_control", "left_shift"],
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
    //Navigate through numbered spaces

    h: {
      description: "Go to space 1",
      to: [
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
          modifiers: ["left_option"],
        },
      ],
    },
    k: {
      description: "Go to space 3",
      to: [
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
          modifiers: ["left_option"],
        },
      ],
    },
    n: {
      description: "Go to space 5",
      to: [
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
          modifiers: ["left_option"],
        },
      ],
    },
    comma: {
      description: "Go to space 7",
      to: [
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
          modifiers: ["left_option"],
        },
      ],
    },

    // o = "Open" applications
    o: {
      c: app("Google Chrome"),
      v: app("Visual Studio Code"),
      d: app("Discord"),
      t: app("Alacritty"),
      /* // Open todo list managed via *H*ypersonic */
      /* h: open( */
      /*   "notion://notion.so/stellatehq/Max-Stoiber-CEO-90ea5326add5408f967278461f37c39b#29b31b030a5a4192b05f3883f7d47fe3" */
      /* ), */
      r: app("Telegram"),
      w: app("WhatsApp"),
      /* // "i"Message */
      /* i: app("Messages"), */
      s: app("Spotify"),
      /* w: open("https://web.whatsapp.com"), */
    },

    // Shell commands

    1: {
      y: {
        description: "Restart yabai",
        to: [
          {
            shell_command: "/bin/sh ~/.config/scripts/reset-yabai.sh",
          },
        ],
      },
    },
  }),
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
    },
    null,
    2
  )
);
