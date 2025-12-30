resource "openstack_networking_secgroup_v2" "postgres_sec_group" {
  name = "Postgres"
  description = "Security group to allow outside connection to the server"
  delete_default_rules = false
}

# Allow tcp connection on port 5432 for IPv4
resource "openstack_networking_secgroup_rule_v2" "rule_postgres_tcp_5432_ipv4" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol  = "tcp"
  port_range_min = 5432
  port_range_max = 5432
  security_group_id = openstack_networking_secgroup_v2.postgres_sec_group.id
}