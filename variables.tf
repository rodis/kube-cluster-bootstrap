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
  default = "de58244a-7670-4e80-b6fe-5290f099b53e"
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