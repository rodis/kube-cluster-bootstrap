resource "openstack_networking_secgroup_v2" "knative_sec_group" {
  name = "knative-controller"
  description = "Security group to allow incoming traffic on port 80 and 443 for knative applications"
  delete_default_rules = false
}

# Allow tcp on port 80 for IPv4 within knative ingress group (knative-controller)
resource "openstack_networking_secgroup_rule_v2" "rule_k8s_knative_controller_tcp_80_ipv4" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol  = "tcp"
  port_range_min = 80
  port_range_max = 80
  security_group_id = openstack_networking_secgroup_v2.knative_sec_group.id
}

# Allow tcp on port 443 for IPv4 within knative group (knative-controller)
resource "openstack_networking_secgroup_rule_v2" "rule_k8s_knative_controller_tcp_443_ipv4" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol  = "tcp"
  port_range_min = 443
  port_range_max = 443
  security_group_id = openstack_networking_secgroup_v2.knative_sec_group.id
}