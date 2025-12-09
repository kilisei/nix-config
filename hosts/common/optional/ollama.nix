{
  services.ollama = {
    enable = true;
    acceleration = "rocm";

    loadModels = [
      "gpt-oss:20b"
      "gemma3:12b"
    ];
  };
  services.open-webui = {
    enable = true;
  };
}
