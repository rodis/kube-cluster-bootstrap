resource "openstack_compute_instance_v2" "master" {
  name = "k8s-${var.PROJECT_NAME}-master"
  flavor_name = "gp1.warpspeed"
  key_pair = "dh_machines"
  security_groups = [ "default", openstack_networking_secgroup_v2.kube_api_server_sec_group.name, openstack_networking_secgroup_v2.etcd_sec_group ]

  block_device {
    uuid                  = "2b2c61c6-324c-47f4-88c1-9ae8a978ddfd"
    source_type           = "image"
    volume_size           = 150
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = false
  }

  network {
    name = "public"
  }
}