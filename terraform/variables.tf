variable "INTERNAL_AZ" {
  type = string
}

variable "flavor_name" {
  default = "gp1.warpspeed"
}

variable "key_pair" {
  default = "dh_machines"
}

variable "IMAGE_UUID" {
  type = string
}

variable "volume_size" {
  default = 100
}

variable "network" {
  default = "public"
}

variable "nodes" {
  default = 4
}