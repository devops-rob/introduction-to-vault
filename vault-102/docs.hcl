docs "docs" {
  path  = "./docs"
  port  = 18080
  open_in_browser = true

  index_title = "Vault"
  index_pages = [
    "index",
    "transit_secrets_engine",
    "encrypting_data",
    "rotating_keys",
    "decrypting_data",
    "rewrapping_data",
    "identity",
    "create_secret_and_acl",
    "enable_auth_methods",
    "create_entity",
    "create_identity_group",
  ]

  network {
    name = "network.local"
  }
}
