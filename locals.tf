locals {
  vm_web_custom_name = "${var.project}-${var.environment}-${var.vm_web_name}"
  vm_db_custom_name  = "${var.project}-${var.environment}-${var.vm_db_name}"
  
  vm_web_name_with_zone = "${var.vm_web_name}-${var.default_zone == "ru-central1-a" ? "zone-a" : "other-zone"}"
  vm_db_name_with_zone  = "${var.vm_db_name}-${var.vm_db_zone == "ru-central1-b" ? "zone-b" : "other-zone"}"
  
  # vm_web_unique_name = "${var.vm_web_name}-${formatdate("YYYYMMDD", timestamp())}"
  # vm_db_unique_name  = "${var.vm_db_name}-${formatdate("YYYYMMDD", timestamp())}"
  
  vm_web_lower_name = lower("${var.project}-${var.vm_web_name}")
  vm_db_lower_name  = lower("${var.project}-${var.vm_db_name}")
  
  vm_web_final_name = local.vm_web_custom_name
  vm_db_final_name  = local.vm_db_custom_name
  
  common_tags = {
    Project     = var.project
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = "Netology"
  }
}
