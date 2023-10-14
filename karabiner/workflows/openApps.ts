import { SubLayerRules } from "../types";
import { app } from "../utils/utils";

/** o = "Open" applications*/
export const openApps: SubLayerRules = {
  o: {
    a: app("Arc"),
    c: app("Google Chrome"),
    d: app("Discord"),
    n: app("Obsidian"), // n of notes
    k: app("Kitty"), // n of notes
    r: app("Telegram"),
    s: app("Spotify"),
    v: app("Visual Studio Code"),
    w: app("WhatsApp"),
  },
};
