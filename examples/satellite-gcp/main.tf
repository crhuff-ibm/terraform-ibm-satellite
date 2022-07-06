data "ibm_resource_group" "resource_group" {
  name = var.ibm_resource_group
}
module "satellite-location" {
  source = "../../modules/location"

  is_location_exist = var.is_location_exist
  location          = var.location
  managed_from      = var.managed_from
  location_zones    = var.location_zones
  host_labels       = var.host_labels
  resource_group_id = data.ibm_resource_group.resource_group.id
  host_provider     = "google"
}
