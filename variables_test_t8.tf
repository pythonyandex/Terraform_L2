variable "vpc_name" {
  type    = string
  default = "develop"
}

variable "default_zone" {
  type    = string
  default = "ru-central1-a"
}

variable "default_cidr" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}

variable "vm_web_image_family" {
  type    = string
  default = "ubuntu-2004-lts"
}

variable "vm_web_name" {
  type    = string
  default = "netology-develop-platform-web"
}

variable "vm_db_name" {
  type    = string
  default = "netology-develop-platform-db"
}

variable "vm_web_platform_id" {
  type    = string
  default = "standard-v3"
}

variable "vm_db_platform_id" {
  type    = string
  default = "standard-v3"
}

 
# variable "vm_web_cores" {
#   type    = number
#   default = 2
# }
# 
# variable "vm_db_cores" {
#   type    = number
#   default = 2
# }
# 
# variable "vm_web_memory" {
#   type    = number
#   default = 1
# }
# 
# variable "vm_db_memory" {
#   type    = number
#   default = 2
# }
# 
# variable "vm_web_core_fraction" {
#   type    = number
#   default = 20
# }
# 
# variable "vm_db_core_fraction" {
#   type    = number
#   default = 20
# }

variable "vm_web_preemptible" {
  type    = bool
  default = true
}

variable "vm_db_preemptible" {
  type    = bool
  default = true
}

# variable "vm_web_serial_port_enable" {
#   type    = number
#   default = 0
# }
# 
# variable "vm_db_serial_port_enable" {
#   type    = number
#   default = 0
# }

variable "vms_ssh_root_key" {
  type    = string
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKKf5atxOK6r+bIZI7i6TCGCIbz6X/9ordmeJGzqLvQg yandex-cloud-vm"
}

variable "vm_db_zone" {
  type    = string
  default = "ru-central1-b"
}

variable "environment" {
  description = "Environment name (dev, stage, prod)"
  type        = string
  default     = "develop"
}

variable "project" {
  description = "Project name"
  type        = string
  default     = "netology"
}


variable "vms_resources" {
  description = "Resources configuration for all VMs"
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
    hdd_size      = optional(number, 5)
    hdd_type      = optional(string, "network-hdd")
  }))
  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 20
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}

variable "metadata" {
  description = "Common metadata for all VMs"
  type = map(string)
  default = {
    serial-port-enable = "1"
    ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKKf5atxOK6r+bIZI7i6TCGCIbz6X/9ordmeJGzqLvQg yandex-cloud-vm"
  }
}

# Provider variables
variable "cloud_id" {
  description = "Yandex Cloud ID"
  type        = string
  sensitive   = true
}

variable "folder_id" {
  description = "Yandex Cloud Folder ID"
  type        = string
  sensitive   = true
}

variable "service_account_key_file" {
  description = "Path to service account key file"
  type        = string
  default     = null
}

variable "zone" {
  description = "Default zone for resources"
  type        = string
  default     = "ru-central1-a"
}

variable "token" {
  description = "Yandex Cloud OAuth token"
  type        = string
  sensitive   = true
  default     = null
}
variable "test" {
  description = "Test variable with complex structure for console exercises"
  type = list(object({
    dev1 = optional(list(string))
    dev2 = optional(list(string))
    prod1 = optional(list(string))
  }))
  default = []
}
