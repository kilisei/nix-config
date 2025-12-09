{pkgs,...}:{
  services.ollama = {
    enable = true;
    package = pkgs.ollama-rocm;

    loadModels = [
      "gpt-oss:20b"
      "gemma3:12b"
    ];
  };
  services.open-webui = {
    enable = true;
  };
}
