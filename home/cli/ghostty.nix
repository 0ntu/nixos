{ ... }:
{
  programs.ghostty = {
    enable = true;
    settings = {
      font-size = 13;
      theme = "Afterglow";
      cursor-style = "block";
      cursor-style-blink = false;
      shell-integration-features = "no-cursor";
      keybind = [
        "alt+h=goto_split:left"
        "alt+l=goto_split:right"
        "alt+j=goto_split:down"
        "alt+k=goto_split:up"
        "alt+shift+h=resize_split:left,25"
        "alt+shift+l=resize_split:right,25"
        "alt+shift+j=resize_split:down,25"
        "alt+shift+k=resize_split:up,25"
        "alt+e=equalize_splits"
        "alt+v=new_split:auto"
        "alt+n=next_tab"
        "alt+p=previous_tab"
        "alt+x=close_surface"
        "alt+c=new_tab"
        "alt+b=close_tab"
        "alt+enter=toggle_fullscreen"
      ];
    };
  };
}
