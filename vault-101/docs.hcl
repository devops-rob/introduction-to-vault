docs "docs" {
  path  = "./docs"
  port  = 18080
  open_in_browser = true

  index_title = "Vault"
  index_pages = [
    "index",
    "storage_backend",
    "unsealing",
    "secrets_engines",
    "policies",
    "auth_methods",
    "tokens",
  ]

  network {
    name = "network.local"
  }
}
