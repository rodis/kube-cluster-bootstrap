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

# Allow tcp on port 6443 for IPv4 within security group (API server)
resource "openstack_networking_secgroup_rule_v2" "rule_k8s_tcp_6443_ipv4" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol  = "tcp"
  port_range_min = 6443
  port_range_max = 6443
  remote_group_id = openstack_networking_secgroup_v2.kube_api_server_sec_group.id
  security_group_id = openstack_networking_secgroup_v2.kube_api_server_sec_group.id
}