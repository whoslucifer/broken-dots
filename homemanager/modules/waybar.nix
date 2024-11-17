{ pkgs, ...}: let
  waybar_config = ./../../.config/waybar;
in {
  # Install waybar via home-manager module
  programs.waybar.enable = true;

  # Source waybar config from the home-manager store
  xdg.configFile = {
    "waybar" = {
      recursive = true;
      source = "${waybar_config}";
    };
  };
  
  home.packages = with pkgs; [
    pipewire
  ];

}
