### VM variables for first VM with vm_web_ prefix

variable "vm_web_image_family" {
  type        = string
  description = "Family of the OS image for VM"
  default     = "ubuntu-2004-lts"
}

variable "vm_web_name" {
  type        = string
  description = "Name of the virtual machine"
  default     = "netology-develop-platform-web"
}

variable "vm_web_platform_id" {
  type        = string
  description = "Platform ID for the virtual machine"
  default     = "standard-v3"
}

variable "vm_web_cores" {
  type        = number
  description = "Number of CPU cores"
  default     = 2
}

variable "vm_web_memory" {
  type        = number
  description = "Amount of memory in GB"
  default     = 1
}

variable "vm_web_core_fraction" {
  type        = number
  description = "CPU core fraction percentage"
  default     = 20
}

variable "vm_web_preemptible" {
  type        = bool
  description = "Whether the VM is preemptible"
  default     = true
}

variable "vm_web_serial_port_enable" {
  type        = number
  description = "Enable serial port (1 for yes, 0 for no)"
  default     = 0
}

### VM variables for second VM (database) with vm_db_ prefix

variable "vm_db_image_family" {
  type        = string
  description = "Family of the OS image for DB VM"
  default     = "ubuntu-2004-lts"
}

variable "vm_db_name" {
  type        = string
  description = "Name of the database virtual machine"
  default     = "netology-develop-platform-db"
}

variable "vm_db_platform_id" {
  type        = string
  description = "Platform ID for the database virtual machine"
  default     = "standard-v3"
}

variable "vm_db_cores" {
  type        = number
  description = "Number of CPU cores for DB VM"
  default     = 2
}

variable "vm_db_memory" {
  type        = number
  description = "Amount of memory in GB for DB VM"
  default     = 2
}

variable "vm_db_core_fraction" {
  type        = number
  description = "CPU core fraction percentage for DB VM"
  default     = 20
}

variable "vm_db_preemptible" {
  type        = bool
  description = "Whether the DB VM is preemptible"
  default     = true
}

variable "vm_db_serial_port_enable" {
  type        = number
  description = "Enable serial port for DB VM (1 for yes, 0 for no)"
  default     = 0
}

variable "vm_db_zone" {
  type        = string
  description = "Zone for the database virtual machine"
  default     = "ru-central1-b"
}
