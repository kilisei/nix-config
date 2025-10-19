{
  programs.nixvim.plugins = {
    gitsigns.enable = true;
    gitblame = {
      enable = true;
      settings = {
        date_format = "%r";
        delay = 100;
        message_template = "        <author>, <date> (<sha>)";
        message_when_not_committed = "        Please, commit this!";
      };
    };
  };
}
