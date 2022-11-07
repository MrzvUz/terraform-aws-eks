# Kubernetes Deployment Manifest
resource "kubernetes_deployment_v1" "myapp1" {
  metadata {
    name = "app1-nginx-deployment"
    labels = {
      app = "app1-nginx"
    }
    namespace = kubernetes_namespace_v1.ns_app1.metadata[0].name
  } 
 
  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "app1-nginx"
      }
    }

    template {
      metadata {
        labels = {
          app = "app1-nginx"
        }
      }

      spec {
        container {
          image = "stacksimplify/kube-nginxapp1:1.0.0"
          name  = "app1-nginx"
          port {
            container_port = 80
          }
          }
        }
      }
    }
}

