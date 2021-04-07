container "vault" {
    network {
        name = "network.local"
    }

    image {
        name = "vault:1.6.3"
    }

    env_var = {
      VAULT_DEV_ROOT_TOKEN_ID = "root"
    }

    port {
      local = "8200"
      remote = "8200"
      host = "8200"
    }

  volume {
    source = "./scripts"
    destination = "/scripts"
  }
}