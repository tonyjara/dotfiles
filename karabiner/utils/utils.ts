import { KeyCode } from "../types";
import { LayerCommand } from "./createHyperSublayer";

/**
 * Shortcut for "Open an app" command (of which there are a bunch)
 */
export function app(name: string): LayerCommand {
  return open(`-a '${name}.app'`);
}

/**
 * Shortcut for "open" shell command
 */
export function open(what: string): LayerCommand {
  return {
    to: [
      {
        shell_command: `open ${what}`,
      },
    ],
    description: `Open ${what}`,
  };
}

export function generateSubLayerVariableName(key: KeyCode) {
  return `hyper_sublayer_${key}`;
}
