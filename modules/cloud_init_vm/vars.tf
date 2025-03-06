variable "vm_id" {
  type = number
}

variable "name" {
  type = string
}

variable "node_name" {
  type = string
}

variable "cpu_sockets" {
  type    = number
  default = 2
}

variable "cpu_cores" {
  type    = number
  default = 2
}

variable "memory" {
  type    = number
  default = 16384
}

variable "disk_size" {
  type    = number
  default = 720
}

variable "image_file_id" {
  type = string
}

variable "ssh_keys" {
  type = list(string)
}

variable "ipv4_address" {
  type = string
}

variable "ipv4_gateway" {
  type    = string
  default = "192.168.178.1"
}

variable "rules" {
  type = list(object({
    type    = string
    action  = string
    dport   = string
    proto   = string
    log     = string
    comment = string
  }))
}
