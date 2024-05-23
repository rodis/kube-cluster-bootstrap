resource "openstack_compute_instance_v2" "master" {
  name = "k8s-${var.INTERNAL_AZ}-master"
  flavor_name = var.flavor_name
  key_pair = var.key_pair
  security_groups = [
    "default",
    openstack_networking_secgroup_v2.kube_api_server_sec_group.name,
    openstack_networking_secgroup_v2.kubelet_sec_group.name,
    openstack_networking_secgroup_v2.etcd_sec_group.name
  ]

  block_device {
    uuid                  = var.IMAGE_UUID
    source_type           = "image"
    volume_size           = var.VOLUME_SIZE
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = false
  }

  network {
    name = var.network
  }

  metadata = {
    groups = "kube_control_plane,kube_node,etcd"
  }
}