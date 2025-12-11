resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image_family
}

resource "yandex_vpc_gateway" "nat_gateway" {
  name = "nat-gateway-${var.environment}"
  shared_egress_gateway {}
}

# Создание таблицы маршрутизации
resource "yandex_vpc_route_table" "nat_route_table" {
  name       = "nat-route-table-${var.environment}"
  network_id = yandex_vpc_network.develop.id
  folder_id  = var.folder_id

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id        = yandex_vpc_gateway.nat_gateway.id
  }
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
  route_table_id = yandex_vpc_route_table.nat_route_table.id  # Добавьте эту строку
}

resource "yandex_vpc_subnet" "develop_b" {
  name           = "develop-subnet-b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = ["10.0.2.0/24"]
  route_table_id = yandex_vpc_route_table.nat_route_table.id  # Добавьте эту строку
}


# First VM - Web Server
resource "yandex_compute_instance" "platform_web" {
  platform_id = var.vm_web_platform_id
  zone        = "ru-central1-b"

  resources {
    cores         = var.vms_resources["web"].cores
    memory        = var.vms_resources["web"].memory
    core_fraction = var.vms_resources["web"].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = var.vms_resources["web"].hdd_size
      type     = var.vms_resources["web"].hdd_type
    }
  }

  scheduling_policy {
    preemptible = var.vm_web_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop_b.id
    nat       = false
  }

  metadata = var.metadata

  labels = local.common_tags
}

# Second VM - Database Server
resource "yandex_compute_instance" "platform_db" {
  name        = var.vm_db_name  
  platform_id = var.vm_db_platform_id
  zone        = var.vm_db_zone

  resources {
    cores         = var.vms_resources["db"].cores
    memory        = var.vms_resources["db"].memory
    core_fraction = var.vms_resources["db"].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = var.vms_resources["db"].hdd_size
      type     = var.vms_resources["db"].hdd_type
    }
  }

  scheduling_policy {
    preemptible = var.vm_db_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop_b.id
    nat       = false
  }

  metadata = local.vm_metadata_with_password

  labels = local.common_tags
}



