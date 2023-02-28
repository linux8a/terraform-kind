  resource "kind_cluster" "default" {
    name  = var.name
    node_image = var.kind_image
    wait_for_ready = true
    
    kind_config {
      ## Declaramos el registry mirrors que deseamos usar
          containerd_config_patches = [
            <<-TOML
             [plugins."io.containerd.grpc.v1.cri".registry.mirrors."${var.registry_mirrors}"]
                endpoint = ["http://${var.registry_mirrors}"]
             [plugins."io.containerd.grpc.v1.cri".registry.configs."${var.registry_mirrors}".tls]
                insecure_skip_verify = ${var.insecure_skip_verify}
            TOML
        ]
        
      kind = "Cluster"
      api_version = "kind.x-k8s.io/v1alpha4"

      node  {
        role = "control-plane"
      }

      node  {
        role = "worker"
      }
#Si deseamos agregar otro nodo worker solo duplicamos el bloque worker

    }

  }