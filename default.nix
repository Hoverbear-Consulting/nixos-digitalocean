# Based off the amazing article by
# https://nixos.mayflower.consulting/blog/2018/09/11/custom-images/

{
  nixpkgs ? <nixpkgs>,
  configMixin ? null
}:

let

  # The default configurations of this image.
  # Want to make your own? You should **definitely** start from the minimal.
  configurations = {
    minimal = passedPkgs: 
      {
        imports = [
          "${nixpkgs}/nixos/modules/virtualisation/digital-ocean-image.nix"
        ];

        networking.hostName = "nixos";
        services = {
          sshd.enable = true;
          cloud-init.enable = true;
        };
        environment.systemPackages = with nixpkgs; [
        ];
      };
  };

  mkConfiguredNixOsForDigitalOceanImage = configuration:
    builtins.trace "Got config:"
    builtins.trace configuration
    (
      let 
        instantiatedNixOs = import "${nixpkgs}/nixos" {
          inherit configuration;
          system = "x86_64-linux";
        };

      in
        instantiatedNixOs.config.system.build.digitalOceanImage
    );

in
  {
    minimal =
      builtins.trace "Building minimal image..."
      mkConfiguredNixOsForDigitalOceanImage (configurations.minimal nixpkgs);
  }
