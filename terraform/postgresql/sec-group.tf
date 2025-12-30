resource "openstack_networking_secgroup_v2" "postgres_sec_group" {
  name = "Postgres security group"
  description = "Security group to allow outside connection to the server"
  delete_default_rules = false
}

# Allow tcp on port 6443 for IPv4 within security group (Kube API server)
resource "openstack_networking_secgroup_rule_v2" "rule_kube_api_tcp_6443_ipv4" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol  = "tcp"
  port_range_min = 5432
  port_range_max = 5432
  security_group_id = openstack_networking_secgroup_v2.postgres_sec_group.id
}