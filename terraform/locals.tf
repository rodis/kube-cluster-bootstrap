locals {
 create_master = var.INTERNAL_AZ == "west" || var.INTERNAL_AZ == "north" ? true : false
}