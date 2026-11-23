{
  git,
  lib,
  ...
}: {
  programs.git = {
    enable = true;

    signing =
      {
        format = "ssh";
        signByDefault = git.key != "";
      }
      // lib.optionalAttrs (git.key != "") {
        key = git.key;
      };

    settings = {
      user.name = git.username;
      user.email = git.email;

      init.defaultBranch = git.branch;

      url =
        lib.genAttrs
        (map (host: "ssh://git@${host}") git.hosts)
        (name: {
          insteadOf = "https://${lib.removePrefix "ssh://git@" name}";
        });
    };
  };
}
