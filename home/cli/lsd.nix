{...}: {
  programs.lsd = {
    enable = true;
    settings = {
      layout = "grid";
      sorting.dir-grouping = "first";
    };
  };

  programs.dircolors = {
    enable = true;
    settings = {
      DIR = "01;93";
    };
  };
}
