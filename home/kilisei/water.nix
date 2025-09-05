{
  imports = [
    common/core
  ];

  home = rec {
    stateVersion = "24.11";
    username = "kilisei";
    homeDirectory = "/home/${username}";
  };
}
