resource "openstack_networking_secgroup_v2" "kubelet_sec_group" {
  name = "Kubelet API"
  description = "Security group for allowing Kubelet to communicate with the API server"
  delete_default_rules = false
}