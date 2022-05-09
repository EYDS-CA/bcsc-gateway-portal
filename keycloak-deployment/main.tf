provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
    config_context = "minikube"
  }
}

resource "helm_release" "keycloak" {
  name       = "keycloak"
  repository = "https://codecentric.github.io/helm-charts"
  chart      = "keycloakx"

  values = [
    file("${path.module}/values.yaml")
  ]
}