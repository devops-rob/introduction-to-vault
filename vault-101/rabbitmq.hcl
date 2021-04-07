container "rabbitmq" {
  image {
    name = "rabbitmq:3-management"
  }

  port {
    local = 15672
    remote = 15672
    host = 15672
    open_in_browser = "/"
  }

  port {
    local = 5672
    remote = 5672
    host = 5672
  }

  port {
    local = 4369
    remote = 4369
    host = 4369
  }

  port {
    local = 25672
    remote = 25672
    host = 25672
  }

  privileged = true

  network {
    name = "network.local"
    ip_address = "10.15.0.205"
  }
}
