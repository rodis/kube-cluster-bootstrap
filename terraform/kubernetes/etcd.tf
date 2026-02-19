resource "openstack_compute_instance_v2" "etcd" {
  count = var.ETCD
  name = "k8s-${var.INTERNAL_AZ}-etcd-${count.index+1}"
  image_id = var.IMAGE_UUID
  flavor_name = var.master_flavor_name
  key_pair = var.key_pair
  security_groups = [
    "default",
    openstack_networking_secgroup_v2.etcd_sec_group.name
  ]

  network {
    name = var.network
  }

  metadata = {
    groups = "etcd"
  }
}