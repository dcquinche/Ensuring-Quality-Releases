resource "azurerm_resource_group" "Azuredevops" {
  name     = "${var.resource_group}"
  location = "${var.location}"
}

resource "azurerm_network_interface" "example_nic" {
  name                = "${var.application_type}-${var.resource_type}-nic"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_address_id
  }
}

resource "azurerm_linux_virtual_machine" "example_vm" {
  name                = "${var.application_type}-${var.resource_type}"
  location            = var.location
  resource_group_name = var.resource_group
  size                = "Standard_DS2_v2"
  admin_username      = var.vm_admin_username
  network_interface_ids = [azurerm_network_interface.example_nic.id]
  source_image_id       = var.packer_image
  admin_ssh_key {
    username   = var.vm_admin_username
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCa4LVi/A/HtneOiU7YXKI9HsblwSRnj04UJqfaC1HcmtDirMDMsKhZ00bvR8vifWzLYH7koYgWc0ynB+839L6m0SDPic35b7CAXpgFYSstYatPqcv/5PnqAVevMdYxpB+TpLk9l6imnkKYcMOpLtP/YuTOmIOSrz1bRsTqQ1D3TRGaKQLCL6TNhJM8CC20fC5oERh0XdM91g3OCuhMhdgXYbu19RGSLAAc8rpyX4ZzZiOBPh+aJDYOBrmPWdihrjonJ2bPm5BBrN+nPCl5KRNLxT//acR/Dz+V7BFwiHIcQ7DAFxSI6zqk1wW4sI6CVtrvUE+auDAPoTMj2G1IdES7"
  }
  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

}
