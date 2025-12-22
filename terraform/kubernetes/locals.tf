locals {
 is_control_tenant = var.INTERNAL_AZ == "west" || var.INTERNAL_AZ == "north" || var.INTERNAL_AZ == "south" ? true : false
}