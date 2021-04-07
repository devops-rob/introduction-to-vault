container "vault" {
  image {
    name = "hashicorp/vault"
  }

  command = [
    "vault",
    "server",
    "-config=/files/config.hcl"
  ]

  port {
    local = 8200
    remote = 8200
    host = 8200
    open_in_browser = "/"
  }

  privileged = true

  volume {
    source = "./config/vault/files"
    destination = "/files"
  }

  volume {
    source      = data("./raft")
    destination = "/raft"
  }

  env {
    key = "VAULT_ADDR"
    value = "http://localhost:8200"
  }

  network {
    name = "network.local"
    ip_address = "10.15.0.203"
  }
}
