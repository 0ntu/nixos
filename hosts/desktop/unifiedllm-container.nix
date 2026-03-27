{
  pkgs,
  config,
  lib,
  ...
}:
{
  boot.enableContainers = true;
  networking.nat = {
    enable = true;
    internalInterfaces = [ "ve-unifiedllm" ];
    externalInterface = "eno1";
  };

  imports = [
    ./litellm-compose.nix
  ];

  containers.unifiedllm = {
    autoStart = true;
    enableTun = true;
    privateNetwork = true;
    hostAddress = "192.168.100.10";
    localAddress = "192.168.100.11";

    allowedDevices = [
      {
        node = "/dev/nvidia0";
        modifier = "rw";
      }
      {
        node = "/dev/nvidiactl";
        modifier = "rw";
      }
      {
        node = "/dev/nvidia-uvm";
        modifier = "rw";
      }
      {
        node = "/dev/nvidia-uvm-tools";
        modifier = "rw";
      }
      {
        node = "/dev/nvidia-modeset";
        modifier = "rw";
      }
    ];

    bindMounts = {
      "/dev/nvidia0" = {
        hostPath = "/dev/nvidia0";
        isReadOnly = false;
      };
      "/dev/nvidiactl" = {
        hostPath = "/dev/nvidiactl";
        isReadOnly = false;
      };
      "/dev/nvidia-uvm" = {
        hostPath = "/dev/nvidia-uvm";
        isReadOnly = false;
      };
      "/dev/nvidia-uvm-tools" = {
        hostPath = "/dev/nvidia-uvm-tools";
        isReadOnly = false;
      };
      "/dev/nvidia-modeset" = {
        hostPath = "/dev/nvidia-modeset";
        isReadOnly = false;
      };
      "/run/opengl-driver" = {
        hostPath = "/run/opengl-driver";
        isReadOnly = true;
      };
    };

    forwardPorts = [
      {
        containerPort = 11434;
        hostPort = 11434;
        protocol = "tcp";
      }
      {
        containerPort = 8080;
        hostPort = 8080;
        protocol = "tcp";
      }
      {
        containerPort = 4000;
        hostPort = 4000;
        protocol = "tcp";
      }
      {
        containerPort = 5432;
        hostPort = 5432;
        protocol = "tcp";
      }
    ];

    # Allow unpacking image layers
    additionalCapabilities = [
      "all"
    ];

    # Allow nesting — this is the key fix
    extraFlags = [
      "--system-call-filter=@mount"
      "--capability=all"
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
          loadModels = [
            "qwen2.5-coder:7b"
          ];
        };

        # services.open-webui = {
        #   enable = true;
        #   host = "0.0.0.0";
        #   port = 8080;
        #   environment = {
        #     OLLAMA_API_BASE_URL = "http://127.0.0.1:11434";
        #     WEBUI_AUTH = "False";
        #   };
        # };

        # --- Networking ---
        networking.useHostResolvConf = lib.mkForce false;
        networking.nameservers = [
          "8.8.8.8"
          "1.1.1.1"
        ];
        networking.firewall.enable = false;

        environment.systemPackages = with pkgs; [
          vim
          curl
          wget
          htop
          ffmpeg
          litellm
          dnsutils
        ];
      };
  };
}
