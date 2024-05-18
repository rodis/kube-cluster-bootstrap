variable "INTERNAL_AZ" {
  type = string
}

variable "flavor_name" {
  default = "gp1.warpspeed"
}

variable "key_pair" {
  default = "dh_machines"
}

variable "image_uuid" {
  default = "2b2c61c6-324c-47f4-88c1-9ae8a978ddfd"
}

variable "volume_size" {
  default = 150
}

variable "network" {
  default = "public"
}