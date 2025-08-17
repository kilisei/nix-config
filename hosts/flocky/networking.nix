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
        {
          from = 6600;
          to = 6600;
        }
        {
          from = 3000;
          to = 3000;
        }
      ];
      allowedUDPPortRanges = allowedTCPPortRanges;
    };
  };
}
