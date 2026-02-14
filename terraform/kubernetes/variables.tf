variable "INTERNAL_AZ" {
  type = string
}

variable "master_flavor_name" {
  default = "gp1.supersonic"
}

variable "node_flavor_name" {
  default = "gp1.warpspeed"
}

variable "key_pair" {
  default = "dh_machines"
}

variable "IMAGE_UUID" {
  type = string
}

variable "network" {
  default = "public"
}

variable "MASTERS" {
  description = "Number of kubernetes masters"
  type        = number
}
variable "NODES" {
  description = "Number of kubernetes nodes"
  type = number
}