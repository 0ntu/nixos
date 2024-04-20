{pkgs, ...}: {
  services.pipewire.wireplumber.configPackages = [
    (pkgs.writeTextDir "share/wireplumber/main.lua.d/99-audio-rename.lua" ''
      monitor.alsa.rules = [
        {
          matches = [
            {
              node.name = "alsa_output.pci-0000_00_1f.3.analog-stereo"
            }
          ]
          actions = {
            update-props = {
              node.name = "Headphones"
              node.description = "Headphones"
            }
          }
        }
      ]
    '')
  ];
}
