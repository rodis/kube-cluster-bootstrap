resource "openstack_networking_secgroup_v2" "etcd_sec_group" {
  name = "etcd"
  description = "Security group for allowing Kube API server to communicate with the etcd server"
  delete_default_rules = false
}

# Allow tcp on port 2379-2380 for IPv4 within security group (etcd)
resource "openstack_networking_secgroup_rule_v2" "rule_k8s_tcp_etcd_ipv4" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol  = "tcp"
  port_range_min = 2379
  port_range_max = 2380
  security_group_id = openstack_networking_secgroup_v2.etcd_sec_group.id
}