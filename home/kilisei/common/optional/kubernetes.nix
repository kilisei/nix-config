{ pkgs, ... }:
{
  home.packages = with pkgs; [
    docker-compose
    k0sctl
    helm-ls
    kubernetes-helm
    helmfile
    kubectl
    kustomize
    aptakube
  ];
}
