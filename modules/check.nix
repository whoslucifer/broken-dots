{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    ferdium
  ];
}
