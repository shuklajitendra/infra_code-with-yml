variable "parent_rg" {
  type = map(object({
    rg_name = string
    location = string
  }))
}

variable "parent_vnet" {
  type=map(object({
    vnet_name = string
    address_space = list(string)
    location = string
    rg_name =string
  }))
}
variable "parent_subnet" {
  type=map(object({
    subnet_name = string
    rg_name = string
    vnet_name = string
    address_prefixes = list(string) 
  }))
}
variable "parent_nic" {
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

variable "parent_nsg" {
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
variable "parent_pip" {
  type = map(object({
    pip_name = string
     rg_name =string
     location = string
     allocation_method = string
     tags =map(string)
       }))
  
}

variable "parent_vm" {
  type = map(object({
    vm_name = string
    rg_name = string
    location = string
    size = string
    admin_username = string
    admin_password = string
    nic_name = string
    caching = string
    storage_account_type = string
    publisher = string
    offer = string
    sku = string
    version = string
    
  }))
}