{
  allUsers,
  git,
  lib,
  system,
  ...
}: {
  config = lib.mkIf system.security.sshd {
    services.openssh = {
      enable = true;
      openFirewall = false;
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        PubkeyAuthentication = true;
        PermitRootLogin = "no";
        AllowUsers = allUsers;
        X11Forwarding = false;
        MaxAuthTries = 3;
        LoginGraceTime = "30s";
      };
    };

    users.users = lib.genAttrs allUsers (_: {
      openssh.authorizedKeys.keys = lib.optional (git.key != "") git.key;
    });
  };
}
