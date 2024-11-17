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
}
