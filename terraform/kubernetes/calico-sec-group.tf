resource "openstack_networking_secgroup_v2" "calico_node_sec_group" {
  name = "Calico Node"
  description = "Security group to allow in/out traffic for calico"
  delete_default_rules = false
}

# Allow udp on port 4789 for vxlan traffic
resource "openstack_networking_secgroup_rule_v2" "rule_calico_vxlan_udp_4789_ipv4" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol  = "udp"
  port_range_min = 4789
  port_range_max = 4789
  security_group_id = openstack_networking_secgroup_v2.kube_api_server_sec_group.id
}
