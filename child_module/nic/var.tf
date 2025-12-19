variable "child_nic" {
  type = map(object({
    nic_name = string
    location = string
    rg_name  = string
    subnet_name = string
    virtual_network_name = string
    pip_name = string
    ip_conf = map(object({
      ip_conf_name                  = string
      private_ip_address_allocation = string
    }))
  }))
}
