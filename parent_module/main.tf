module "rg" {
  source     = "../child_module/rg"
  child_rg   = var.parent_rg
}
module "vnet" {
  depends_on = [module.rg]
  source     = "../child_module/vnet"
  child_vnet = var.parent_vnet
}
module "subnet" {
  depends_on   = [module.vnet]
  source       = "../child_module/subnet"
  child_subnet = var.parent_subnet

}
module "nic" {
  depends_on = [module.subnet, module.pip, module.nsg, module.rg]
  source     = "../child_module/nic"
  child_nic  = var.parent_nic
}
module "nsg" {
  depends_on = [module.rg]

  source    = "../child_module/nsg"
  child_nsg = var.parent_nsg
}
module "pip" {
  depends_on = [module.rg]
  source     = "../child_module/pip"
  child_pip  = var.parent_pip
}

module "vm" {
  depends_on = [module.nic, module.rg]
  source     = "../child_module/vm"
  child_vm   = var.parent_vm
  
}
