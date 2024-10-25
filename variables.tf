variable "name" {
  type    = string
  default = "HanaResourceGroup"
}
variable "location" {
  type    = string
  default = "East US"
}
variable "vn_name" {
  type    = string
  default = "1Vnet"
}

variable "subnetname" {
  type    = string
  default = "1Subnet"
}
variable "subnet_address_space" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}
variable "ni_name" {
  type    = string
  default = "1Nic"
}
variable "ip_c_name" {
  type    = string
  default = "1NicConfig"
}

variable "vm_name" {
  type    = string
  default = "HanaVM"
}
variable "vm_size" {
  type    = string
  default = "Standard_B1ms"
}

variable "osp_cname" {
  type    = string
  default = "Hanavm"
}
variable "osp_a_pwd" {
  type      = string
  default   = "Password123!"
  sensitive = true
}


locals {
  osp_a_user_name  = "adminuser"
  vn_address_space = ["10.0.0.0/16"]
  ip_c_piaa        = "Dynamic"
  sir_sku          = "18.04-LTS"
  sir_pub          = "Canonical"
  sir_off          = "UbuntuServer"
  sir_ver          = "latest"
  sod_name         = "1OsDisk"
  sod_cach         = "ReadWrite"
  sod_c_op         = "FromImage"
  sod_mdt          = "Standard_LRS"
}
