resource "openstack_compute_instance_v2" "master" {
  name = "k8s-${var.INTERNAL_AZ}-master"
  flavor_name = "gp1.warpspeed"
  key_pair = var.key_pair
  security_groups = [
    "default",
    openstack_networking_secgroup_v2.kube_api_server_sec_group.name,
    openstack_networking_secgroup_v2.etcd_sec_group.name
  ]

  block_device {
    uuid                  = var.image_uuid
    source_type           = "image"
    volume_size           = var.volume_size
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = false
  }

  network {
    name = var.network
  }
}