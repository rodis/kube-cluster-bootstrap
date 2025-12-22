resource "openstack_compute_instance_v2" "master" {
  name = "k8s-${var.INTERNAL_AZ}-postgresql"
  flavor_name = var.flavor_name
  key_pair = var.key_pair
  security_groups = [
    "default"
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
    groups = "postgresql"
  }
}