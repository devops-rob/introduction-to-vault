
listener "tcp" {
  address         = "0.0.0.0:8200"
  tls_disable     = 1
}
storage "raft" {
  path = "/raft"
  node_id = "raft_node_1"
}
disable_mlock = true
cluster_addr = "http://127.0.0.1:8201"
api_addr = "http://127.0.0.1:8200"
ui = true