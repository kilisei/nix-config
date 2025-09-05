{
  networking.hostName = "water";
  networking.networkmanager.enable = true;
  networking.firewall = rec {
    enable = true;
    allowedTCPPorts = [
      22
      80
      443
    ];
    allowedUDPPorts = allowedTCPPorts;
  };
}
