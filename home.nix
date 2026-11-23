{
  config,
  pkgs,
  lib,
  fornax,
  ...
}: {
  imports = [
    fornax.homeManagerModules.default
  ];

  programs.fornax.enable = true;

  home.username = "adriano";
  home.homeDirectory = "/home/adriano";
  home.stateVersion = "26.05";

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
}

