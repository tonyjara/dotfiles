import { SubLayerRules } from "../types";

export const shellCommands: SubLayerRules = {
  // Shell commands

  1: {
    s: {
      description: "yabai stop",
      to: [
        {
          shell_command: "/bin/zsh ~/.config/scripts/stop-yabai.sh",
        },
      ],
    },
    r: {
      description: "yabai restart",
      to: [
        {
          shell_command: "/bin/zsh ~/.config/scripts/restart-yabai.sh",
        },
      ],
    },

    g: {
      description: "yabai run",
      to: [
        {
          shell_command: "/bin/zsh ~/.config/scripts/start-yabai.sh",
        },
      ],
    },
  },
};
