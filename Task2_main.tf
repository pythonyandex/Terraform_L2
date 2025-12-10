resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image_family  # Исправлено: переменная вместо "ubuntu-2004-lts"
}

resource "yandex_compute_instance" "platform" {
  name        = var.vm_web_name  # Исправлено: переменная вместо "netology-develop-platform-web"
  platform_id = var.vm_web_platform_id  # Исправлено: переменная вместо "standard-v3"
  
  resources {
    cores         = var.vm_web_cores  # Исправлено: переменная вместо 2
    memory        = var.vm_web_memory  # Исправлено: переменная вместо 1
    core_fraction = var.vm_web_core_fraction  # Исправлено: переменная вместо 20
  }
  
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  
  scheduling_policy {
    preemptible = var.vm_web_preemptible  # Исправлено: переменная вместо true
  }
  
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.vm_web_serial_port_enable  # Исправлено: переменная вместо 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}
