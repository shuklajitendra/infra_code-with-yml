resource "azurerm_network_interface" "nic" {
  for_each            = var.child_nic
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  dynamic "ip_configuration" {
    for_each = each.value.ip_conf
    content {
      name                          = ip_configuration.value.ip_conf_name
      subnet_id                     = data.azurerm_subnet.subnetdata[each.key].id
      public_ip_address_id = data.azurerm_public_ip.pipdata[each.key].id
      private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
    }
  }
}

data "azurerm_subnet" "subnetdata" {
  for_each             = var.child_nic
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_public_ip" "pipdata" {
  for_each = var.child_nic
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}
