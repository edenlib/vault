storage "raft" {
  path    = "./vault/data"
  node_id = "node1"
}

listener "tcp" {
  address     = "192.168.0.20:8200"
  tls_disable = "true"
}

disable_mlock = true

api_addr = "http://192.168.0.20:8200"
cluster_addr = "https://192.168.0.20:8201"
ui = true
