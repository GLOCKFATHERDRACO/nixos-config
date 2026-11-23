{pkgs, ...}: {
  security = {
    tpm2.enable = true;
  };

  services.gnome.gcr-ssh-agent.enable = false;

  environment.systemPackages = [pkgs.sbctl];
}
