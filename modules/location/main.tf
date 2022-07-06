resource "ibm_satellite_location" "create_location" {
  count = var.is_location_exist == false ? 1 : 0

  location          = var.location
  managed_from      = var.managed_from
  zones             = (var.location_zones != null ? var.location_zones : null)
  resource_group_id = var.resource_group_id

  cos_config {
    bucket = (var.location_bucket != null ? var.location_bucket : null)
    region = (var.ibm_region != null ? var.ibm_region : null)
  }
}

data "ibm_satellite_location" "location" {
  location   = var.location
  depends_on = [ibm_satellite_location.create_location]
}

data "ibm_satellite_attach_host_script" "script" {
  location      = data.ibm_satellite_location.location.id
  labels        = (var.host_labels != null ? var.host_labels : null)
  host_provider = var.host_provider
}
