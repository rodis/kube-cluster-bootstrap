resource "openstack_compute_instance_v2" "node" {
  name = "k8s-${var.INTERNAL_AZ}-node-${var.NODES.index+1}"
  image_id = var.IMAGE_UUID
  flavor_name = var.flavor_name
  key_pair = var.key_pair
  security_groups = [
    "default",
    openstack_networking_secgroup_v2.kubelet_sec_group.name
  ]

  network {
    name = var.network
  }

  metadata = {
    groups = "kube_node"
  }
}