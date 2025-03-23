datacenter = "dc1"
node_name = "consul_server"
bind_addr = "0.0.0.0"
client_addr = "0.0.0.0"
advertise_addr = "192.168.56.54" 
server = true
data_dir = "/opt/consul/data"
bootstrap_expect = 1
ui = true
encrypt = "YgyFpy596Y2j7Qjhq5y8wg=="
log_level = "INFO"
connect {
	enabled = true
}

ca_file = "/etc/consul.d/certs/consul-agent-ca.pem"
cert_file = "/etc/consul.d/certs/dc1-server-consul-0.pem"
key_file = "/etc/consul.d/certs/dc1-server-consul-0-key.pem"
verify_incoming = true
verify_outgoing = true
verify_server_hostname = true

auto_encrypt {
  allow_tls = true
}
addresses {
  grpc = "127.0.0.1"
}

ports {
  grpc_tls  = 8502
}

