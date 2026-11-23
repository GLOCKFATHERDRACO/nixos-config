{
  system = {
    users = ["username"];
    admin = ["username"];

    locale = "en_US.UTF-8";
    timezone = "Etc/UTC";
    dotfiles = "/home/USER/nixos-config";

    bluetooth = false;
    gaming = false;
    printing = false;
    roblox = false;

    security.sshd = true;
    security.gpg = true;
  };

  git = {
    branch = "main";
    username = "your-git-username";
    email = "you@example.invalid";
    key = "";
    hosts = [
      "codeberg.org"
      "github.com"
      "gitlab.com"
    ];
  };

  packages = pkgs: [];
}
