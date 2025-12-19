variable "child_nsg" {
  type = map(object({
    nsg_name = string
    location = string
    rg_name  = string
    tags     = map(string)
    sec_rule = map(object({
      sec_name                   = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}
