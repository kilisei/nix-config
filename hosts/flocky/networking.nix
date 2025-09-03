{
  networking = {
    hostName = "flocky";
    networkmanager.enable = true;
    firewall = rec {
      allowedTCPPortRanges = [
        # gsconnect/kdeconnect
        {
          from = 1714;
          to = 1764;
        }
      ];
      allowedUDPPortRanges = allowedTCPPortRanges;
    };
  };
}
