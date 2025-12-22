resource "openstack_networking_secgroup_v2" "kubelet_sec_group" {
  name = "Kubelet API"
  description = "Security group for allowing Kubelet to communicate with the API server"
  delete_default_rules = false
}

# Allow tcp on port 10250 for IPv4 within security group (Kubelet)
resource "openstack_networking_secgroup_rule_v2" "rule_kubelet_tcp_10250_ipv4" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol  = "tcp"
  port_range_min = 10250
  port_range_max = 10250
  security_group_id = openstack_networking_secgroup_v2.kubelet_sec_group.id
}

# Allow tcp on port 10256 for IPv4 within security group (Kubelet)
resource "openstack_networking_secgroup_rule_v2" "rule_kubelet_tcp_10256_ipv4" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol  = "tcp"
  port_range_min = 10256
  port_range_max = 10256
  security_group_id = openstack_networking_secgroup_v2.kubelet_sec_group.id
}

# Allow udp on port 8472 for IPv4 within security group (Kubelet)
resource "openstack_networking_secgroup_rule_v2" "rule_kubelet_udp_8472_ipv4" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol  = "udp"
  port_range_min = 8472
  port_range_max = 8472
  security_group_id = openstack_networking_secgroup_v2.kubelet_sec_group.id
}