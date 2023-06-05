import { SubLayerRules } from "../types";
import { app } from "../utils/utils";

/** o = "Open" applications*/
export const openApps: SubLayerRules = {
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
};
