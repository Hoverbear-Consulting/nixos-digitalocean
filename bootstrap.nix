# Based off the amazing article by
# https://nixos.mayflower.consulting/blog/2018/09/11/custom-images/

{ nixpkgs ? <nixpkgs>, system ? "x86_64-linux" }:

let
  state = { pkgs, ... }: {
    imports = [
      "${nixpkgs}/nixos/modules/virtualisation/digital-ocean-image.nix"
    ];

    networking.hostName = "bootstrap";
    services.sshd.enable = true;
    environment.systemPackages = with pkgs; [];
  };

  evalNixos = configuration: import "${nixpkgs}/nixos" {
    inherit system configuration;
};
in { image = (evalNixos state).config.system.build.digitalOceanImage; }
