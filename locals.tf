locals {
  # Пример 1: Интерполяция нескольких переменных для формирования имени ВМ
  vm_web_custom_name = "${var.project}-${var.environment}-${var.vm_web_name}"
  vm_db_custom_name  = "${var.project}-${var.environment}-${var.vm_db_name}"
  
  # Пример 2: Более сложная интерполяция с условиями (как в лекции)
  vm_web_name_with_zone = "${var.vm_web_name}-${var.default_zone == "ru-central1-a" ? "zone-a" : "other-zone"}"
  vm_db_name_with_zone  = "${var.vm_db_name}-${var.vm_db_zone == "ru-central1-b" ? "zone-b" : "other-zone"}"
  
  # Пример 3: Формирование полного имени с timestamp (для уникальности)
  # vm_web_unique_name = "${var.vm_web_name}-${formatdate("YYYYMMDD", timestamp())}"
  # vm_db_unique_name  = "${var.vm_db_name}-${formatdate("YYYYMMDD", timestamp())}"
  
  # Пример 4: Использование функций в интерполяции
  vm_web_lower_name = lower("${var.project}-${var.vm_web_name}")
  vm_db_lower_name  = lower("${var.project}-${var.vm_db_name}")
  
  # Пример 5: Алиасы для использования в ресурсах (выберите один из вариантов выше)
  vm_web_final_name = local.vm_web_custom_name
  vm_db_final_name  = local.vm_db_custom_name
  
  # Общие теги для всех ресурсов
  common_tags = {
    Project     = var.project
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = "Netology"
  }
}
