###cloud vars


variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "<your_ssh_ed25519_key>"
  description = "ssh-keygen -t ed25519"
}

### VM variables with vm_web_ prefix

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
