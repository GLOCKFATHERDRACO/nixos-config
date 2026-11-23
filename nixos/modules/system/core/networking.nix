{
  networking = {
    # -- kill dhcp daemon (systemd-resolved handles DNS)
    useDHCP = false;
    dhcpcd.enable = false;

    # -- firewall
    nftables.enable = true;

    # -- network manager
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
      wifi = {
        backend = "wpa_supplicant"; # change to "iwd" if you feel like it
        macAddress = "random";
      };
    };

    # -- wifi (iwd backend)
    # wireless.iwd.enable = true;
  };

  # -- dns
  services.resolved = {
    enable = true;
    settings.Resolve = {
      DNS = [
        # -- IPv4
        "1.1.1.1#cloudflare-dns.com"
        "1.0.0.1#cloudflare-dns.com"

        # -- IPv6
        "2606:4700:4700::1111#cloudflare-dns.com"
        "2606:4700:4700::1001#cloudflare-dns.com"
      ];
      DNSOverTLS = "true";
      DNSSEC = "allow-downgrade";
      Domains = ["~."];
      FallbackDNS = [];
      LLMNR = "false";
    };
  };
}
