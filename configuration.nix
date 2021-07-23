{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    (final: prev: {
      google-chrome = pkgs.callPackage ./google-chrome.nix { };
    })
  ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [
      pkgs.nixpkgs-fmt
      pkgs.google-chrome
      pkgs.gitAndTools.gh
    ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nixUnstable;
}
