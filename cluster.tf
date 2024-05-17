terraform {
  required_version = ">= 0.13"
    required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
  }
}

provider "openstack" {}

resource "openstack_networking_secgroup_v2" "kubelet_sec_group" {
  name = "Kubelet API"
  description = "Security group for allowing Kubelet to communicate with the API server"
  delete_default_rules = false
}

resource "openstack_networking_secgroup_v2" "kube_api_server_sec_group" {
  name = "Kubernetes API server"
  description = "Security group for allowing Kube API server to talk with Kubelet"
  delete_default_rules = false
}

# Allow tcp on port 6443 for IPv4 within security group (Kubelet API)
resource "openstack_networking_secgroup_rule_v2" "rule_k8s_tcp_6443_ipv4" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol  = "tcp"
  port_range_min = 6443
  port_range_max = 6443
  security_group_id = openstack_networking_secgroup_v2.kube_api_server_sec_group.id
}

# Allow tcp on port 10250 for IPv4 within security group (Kubelet API)
resource "openstack_networking_secgroup_rule_v2" "rule_k8s_tcp_10250_ipv4" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol  = "tcp"
  port_range_min = 10250
  port_range_max = 10250
  security_group_id = openstack_networking_secgroup_v2.kube_api_server_sec_group.id
}

# Allow tcp on port 10257 for IPv4 within security group (Kubelet API)
resource "openstack_networking_secgroup_rule_v2" "rule_k8s_tcp_10257_ipv4" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol  = "tcp"
  port_range_min = 10257
  port_range_max = 10257
  security_group_id = openstack_networking_secgroup_v2.kube_api_server_sec_group.id
}

# Allow tcp on port 10259 for IPv4 within security group (Kubelet API)
resource "openstack_networking_secgroup_rule_v2" "rule_k8s_tcp_10259_ipv4" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol  = "tcp"
  port_range_min = 10259
  port_range_max = 10259
  security_group_id = openstack_networking_secgroup_v2.kube_api_server_sec_group.id
}

# Allow udp on port 8472 for IPv4 within security group (Kubelet API)
resource "openstack_networking_secgroup_rule_v2" "rule_k8s_udp_8472_ipv4" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol  = "udp"
  port_range_min = 8472
  port_range_max = 8472
  security_group_id = openstack_networking_secgroup_v2.kube_api_server_sec_group.id
}



resource "openstack_compute_instance_v2" "master" {
  name = "k8s-west-master"
  image_name = "Ubuntu-22.04"
  flavor_name = "gp1.warpspeed"

  key_pair = "dh_machines"
  security_groups = [ "default", openstack_networking_secgroup_v2.kube_api_server_sec_group.name ]

  network {
    name = "public"
  }
}