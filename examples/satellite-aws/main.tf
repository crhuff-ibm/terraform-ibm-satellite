#####################################################
# IBM Cloud Satellite -  AWS Example
# Copyright 2021 IBM
#####################################################

data "ibm_resource_group" "resource_group" {
  name = var.resource_group
}
module "satellite-location" {
  //Uncomment following line to point the source to registry level module
  //source = "terraform-ibm-modules/satellite/ibm//modules/location"

  source            = "../../modules/location"
  is_location_exist = var.is_location_exist
  location          = var.location
  managed_from      = var.managed_from
  location_zones    = local.azs
  location_bucket   = var.location_bucket
  host_labels       = var.host_labels
  resource_group_id = data.ibm_resource_group.resource_group.id
  host_provider     = "aws"
}