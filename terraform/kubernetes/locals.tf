locals {
 is_control_tenant = var.INTERNAL_AZ == "west" || var.INTERNAL_AZ == "north" ? true : false
}