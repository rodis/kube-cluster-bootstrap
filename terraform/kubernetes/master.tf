resource "openstack_compute_instance_v2" "master" {
  count = var.MASTERS
  name = "k8s-${var.INTERNAL_AZ}-master-${count.index+1}"
  image_id = var.IMAGE_UUID
  flavor_name = var.master_flavor_name
  key_pair = var.key_pair
  security_groups = [
    "default",
    openstack_networking_secgroup_v2.kube_api_server_sec_group.name,
    openstack_networking_secgroup_v2.kubelet_sec_group.name,
    openstack_networking_secgroup_v2.nginx_controller_sec_group.name,
  ]

  network {
    name = var.network
  }

  metadata = {
    groups = "kube_control_plane,nginx_ingress_controller"
  }
}