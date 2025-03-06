resource "proxmox_virtual_environment_download_file" "ubuntu_cloud_image" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = var.proxmox_node

  url = "https://cloud-images.ubuntu.com/releases/24.04/release/ubuntu-24.04-server-cloudimg-amd64.img"
}

module "control" {
  source = "./modules/cloud_init_vm"

  vm_id         = 101
  name          = "control"
  ipv4_address  = "192.168.1.1/24"
  node_name     = var.proxmox_node
  image_file_id = proxmox_virtual_environment_download_file.ubuntu_cloud_image.id
  ssh_keys      = var.ssh_public_keys
  rules         = var.firewall_rules
}

module "worker1" {
  source = "./modules/cloud_init_vm"

  vm_id         = 102
  name          = "worker1"
  ipv4_address  = "192.168.1.2/24"
  node_name     = var.proxmox_node
  image_file_id = proxmox_virtual_environment_download_file.ubuntu_cloud_image.id
  ssh_keys      = var.ssh_public_keys
  rules         = var.firewall_rules
}

module "worker2" {
  source = "./modules/cloud_init_vm"

  vm_id         = 103
  name          = "worker2"
  ipv4_address  = "192.168.1.3/24"
  node_name     = var.proxmox_node
  image_file_id = proxmox_virtual_environment_download_file.ubuntu_cloud_image.id
  ssh_keys      = var.ssh_public_keys
  rules         = var.firewall_rules
}
