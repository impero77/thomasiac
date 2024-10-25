terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    version = "<=3.116.0" }
  }
}
resource "azurerm_resource_group" "example" {
  name     = var.name
  location = var.location
}
resource "azurerm_virtual_network" "example" {
  name                = var.vn_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = local.vn_address_space
}
resource "azurerm_subnet" "example" {
  name                 = var.subnetname
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = var.subnet_address_space
}
resource "azurerm_network_interface" "example" {
  name                = var.ni_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = var.ip_c_name
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = local.ip_c_piaa
  }
}
resource "azurerm_virtual_machine" "example" {
  name                  = var.vm_name
  location              = azurerm_resource_group.example.location
  resource_group_name   = azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.example.id]
  vm_size               = var.vm_size
  storage_image_reference {
    publisher = local.sir_pub
    offer     = local.sir_off
    sku       = local.sir_sku
    version   = local.sir_ver
  }
  storage_os_disk {
    name              = local.sod_name
    caching           = local.sod_cach
    create_option     = local.sod_c_op
    managed_disk_type = local.sod_mdt
  }
  os_profile {
    computer_name  = var.osp_cname
    admin_username = local.osp_a_user_name
    admin_password = var.osp_a_pwd
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}
