{ pkgs, config, lib, ... }:
{
  boot.enableContainers = true;

  networking.nat = {
    enable = true;
    internalInterfaces = [ "ve-unifiedllm" ];
    externalInterface = "eno1";
  };

  containers.unifiedllm = {
    autoStart = true;
    enableTun = true;
    privateNetwork = true;
    hostAddress = "192.168.100.10";
    localAddress = "192.168.100.11";

    allowedDevices =[
      { node = "/dev/nvidia0"; modifier = "rw"; }
      { node = "/dev/nvidiactl"; modifier = "rw"; }
      { node = "/dev/nvidia-uvm"; modifier = "rw"; }
      { node = "/dev/nvidia-uvm-tools"; modifier = "rw"; }
      { node = "/dev/nvidia-modeset"; modifier = "rw"; }
    ];

    bindMounts = {
      "/dev/nvidia0" = { hostPath = "/dev/nvidia0"; isReadOnly = false; };
      "/dev/nvidiactl" = { hostPath = "/dev/nvidiactl"; isReadOnly = false; };
      "/dev/nvidia-uvm" = { hostPath = "/dev/nvidia-uvm"; isReadOnly = false; };
      "/dev/nvidia-uvm-tools" = { hostPath = "/dev/nvidia-uvm-tools"; isReadOnly = false; };
      "/dev/nvidia-modeset" = { hostPath = "/dev/nvidia-modeset"; isReadOnly = false; };
      
      # 2. BIND MOUNT THE HOST'S OPENGL DRIVER
      # This guarantees the container's CUDA libraries match the host's kernel module exactly.
      "/run/opengl-driver" = { hostPath = "/run/opengl-driver"; isReadOnly = true; };
    };

    forwardPorts =[
      { containerPort = 11434; hostPort = 11434; protocol = "tcp"; }
      { containerPort = 8080; hostPort = 8080; protocol = "tcp"; }
    ];

    config =
      { config, pkgs, ... }:
      {
        system.stateVersion = "25.11";

        nixpkgs.config.allowUnfree = true;
        hardware.graphics.enable = true; 

        services.ollama = {
          enable = true;
          acceleration = "cuda";
          host = "0.0.0.0";
          port = 11434;
        };

        services.open-webui = {
          enable = true;
          host = "0.0.0.0";
          port = 8080;
          environment = {
            OLLAMA_API_BASE_URL = "http://127.0.0.1:11434";
            WEBUI_AUTH = "False";
          };
        };

        networking.useHostResolvConf = lib.mkForce false;
        networking.nameservers =[ "8.8.8.8" "1.1.1.1" ];
        networking.firewall.enable = false;

        environment.systemPackages = with pkgs; [
          curl wget htop ffmpeg
        ];
      };
  };
}
