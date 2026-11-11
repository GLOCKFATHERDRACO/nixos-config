{ system, ... }:

{
  networking = {
    hostName = system.hostname;

    # -- resolved handles it
    useDHCP = false;
    dhcpcd.enable = false;

    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
      wifi.macAddress = "random";
    };

    # -- firewall (nftables)
    nftables = {
      enable = true;
    };
  };

  # -- dns
  services.resolved = {
    enable = true;
    settings.Resolve = {
      DNS = system.dns;
      DNSOverTLS = "true";
      DNSSEC = "allow-downgrade";
      Domains = [ "~." ];
      FallbackDNS = [ ];
      LLMNR = "false";
    };
  };
}
