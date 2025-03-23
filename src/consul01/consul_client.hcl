datacenter = "dc1"
bind_addr = "0.0.0.0"  # Listen on all interfaces
advertise_addr = "{{ ansible_facts['all_ipv4_addresses'] | select('search', '^192\.168\.56') | first }}"
client_addr = "0.0.0.0"  # Allow connections from any address
server = false
retry_join = ["192.168.56.54:8301"]
data_dir = "/opt/consul/data"
encrypt = "YgyFpy596Y2j7Qjhq5y8wg=="
ca_file = "/etc/consul.d/certs/consul-agent-ca.pem"
cert_file = "/etc/consul.d/certs/dc1-server-consul-0.pem"
key_file = "/etc/consul.d/certs/dc1-server-consul-0-key.pem"
verify_incoming = true
verify_outgoing = true
verify_server_hostname = true
ports {
	grpc_tls = 8502
}
connect {
	enabled = true
}
auto_encrypt {
  tls = true
}



