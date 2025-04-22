import { SubLayerRules } from "../types";
import { app } from "../utils/utils";

/** o = "Open" applications*/
export const openApps: SubLayerRules = {
  q: {
    a: app("Arc"),
    d: app("Discord"),
    c: app("Final Cut Pro"),
    f: app("Finder"),
    n: app("Obsidian"), // n of notes
    k: app("Kitty"), // n of notes
    m: app("Microsoft Outlook"), // m of Microsoft
    r: app("Telegram"),
    s: app("Spotify"),
    v: app("Visual Studio Code"),
    w: app("WhatsApp"),
  },
};
