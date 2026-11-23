{
  system = {
    users = ["gfd"];
    admin = ["gfd"];

    locale = "en_US.UTF-8";
    timezone = "Europe/Vienna";
    dotfiles = "/home/gfd/nixos-config";

    bluetooth = true;
    gaming = false;
    printing = false;
    roblox = false;

    security.sshd = true;
    security.gpg = true;
  };

  git = {
    branch = "main";
    email = "161503241+glockfatherdraco@users.noreply.github.com";
    key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBcpyUZp7xVBVdMAF7CR71vaxpNSuQ9Xusgc8LXGFjIk";
    username = "glockfatherdraco";
    hosts = [
      "codeberg.org"
      "github.com"
      "gitlab.com"
    ];
  };

  packages = pkgs:
    with pkgs; [
      adwaita-fonts
      nerd-fonts.jetbrains-mono

      steamguard-cli
      yt-dlp

      audacity
      libreoffice
      papers
    ];
}
