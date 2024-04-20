{pkgs, ...}: {
  services.pipewire.wireplumber.configPackages = [
    (pkgs.writeTextDir "share/wireplumber/main.lua.d/99-audio-rename.lua" ''
      alsa_monitor.rules = {
        {
          matches = {{{ "node.name", "matches", "alsa_output.pci-0000_00_1f.3.analog-stereo" }}};
          apply_properties = {
            ["node.description"] = "Headphones",
            ["node.nick"] = "Headphones",
          },
        },
        {
          matches = {{{ "device.name", "matches", "alsa_card.pci-0000_01_00.1" }}};
          apply_properties = {
            ["device.disabled"] = true,
          },
        },
      }
    '')
  ];
}
