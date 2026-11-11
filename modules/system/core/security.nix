{ pkgs, ... }:

{
  security = {
    tpm2.enable = true;
    sudo.execWheelOnly = true;
    rtkit.enable = true;
  };

  services.gnome.gcr-ssh-agent.enable = false;

  environment.systemPackages = [ pkgs.sbctl ];
}
