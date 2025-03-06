resource "proxmox_virtual_environment_firewall_options" "firewall_options" {
  vm_id     = var.vm_id
  node_name = var.node_name

  enabled = true

  depends_on = [
    proxmox_virtual_environment_vm.cloud_init_vm
  ]
}

resource "proxmox_virtual_environment_firewall_rules" "firewall_rules" {
  vm_id     = var.vm_id
  node_name = var.node_name

  dynamic "rule" {
    for_each = var.rules
    content {
      type    = rule.value.type
      action  = rule.value.action
      dport   = rule.value.dport
      proto   = rule.value.proto
      log     = rule.value.log
      comment = rule.value.comment
    }
  }

  depends_on = [
    proxmox_virtual_environment_vm.cloud_init_vm
  ]
}
