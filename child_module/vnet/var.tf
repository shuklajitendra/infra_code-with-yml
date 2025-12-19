variable "child_vnet" {
  type=map(object({
    vnet_name = string
    address_space = list(string)
    location = string
    rg_name =string
  }))
}