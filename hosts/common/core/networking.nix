{config,...}:{
  networking = {
    networkmanager.enable = true;
    hostName = config.hostSpec.hostName;
    enableIPv6 = false;
  };
  system.name = config.hostSpec.hostName;
}
