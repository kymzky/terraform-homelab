resource "proxmox_virtual_environment_vm" "cloud_init_vm" {
  vm_id           = var.vm_id
  name            = var.name
  node_name       = var.node_name
  keyboard_layout = "de"

  operating_system {
    type = "l26"
  }

  cpu {
    sockets = var.cpu_sockets
    cores   = var.cpu_cores
    type    = "host"
  }

  memory {
    dedicated = var.memory
  }

  network_device {
    bridge   = "vmbr0"
    firewall = true
  }

  disk {
    datastore_id = "local-lvm"
    file_id      = var.image_file_id
    interface    = "scsi0"
    size         = var.disk_size
  }

  initialization {
    user_account {
      username = data.keepass_entry.credentials.username
      password = data.keepass_entry.credentials.password
      keys     = var.ssh_keys
    }
    ip_config {
      ipv4 {
        address = var.ipv4_address
        gateway = var.ipv4_gateway
      }
    }
  }
}

data "keepass_entry" "credentials" {
  path = "Database/Homelab/${var.name}"
}
