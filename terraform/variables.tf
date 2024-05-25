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

variable "VOLUME_SIZE" {
  default = 150
}

variable "network" {
  default = "public"
}

variable "NODES" {
  default = 4
}

variable "create_master" {
  type: boolean
  default = var.INTERNAL_AZ == "west" ? true : false
}