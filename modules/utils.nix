{
  config,
  pkgs,
  inputs, 
  ...
}: {
  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    spicetifyPackage = inputs.nixpkgs.legacyPackages."${pkgs.system}".spicetify-cli;
  in {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
      shuffle
      trashbin
      popupLyrics
    ];

    theme = spicePkgs.themes.defaultDynamic;
  };

  environment.systemPackages = with pkgs; [
    btrfs-progs
    curl
    wget
    btop
    htop
    git
    cpufrequtils
    glib #for gsettings to work
    gsettings-qt
    killall
    libappindicator
    pciutils
    xdg-user-dirs
    xdg-utils
    networkmanagerapplet
    librsvg
    
    #zen browser
    inputs.zen-browser.packages."${system}".default
    inputs.zen-browser.packages."${system}".specific
    inputs.zen-browser.packages."${system}".generic


    #for ags new 
    cloudflare-warp
    cloudflared
    pinokio #installs ai tools locally

  ];
}
