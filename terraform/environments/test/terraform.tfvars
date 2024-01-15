# Azure subscription vars
subscription_id = "80ae9245-22ea-4f16-a42f-d5cebd7aac99"
tenant_id = "f958e84a-92b8-439f-a62d-4f45996b6d07"
client_id = "6845eb09-b63b-4860-b866-9205d56810cb"
client_secret = "OdA8Q~FAozrLZxmgM2AaVdEW9v76-7zEJghfdbnf"

# Resource Group/Location
location = "westeurope"
resource_group = "Azuredevops"
application_type = "my-application"

# Network
virtual_network_name = "my-vnet"
address_space = ["10.5.0.0/16"]
address_prefix_test = "10.5.1.0/24"

# VM
vm_admin_username = "adminuser"
packer_image = "/subscriptions/80ae9245-22ea-4f16-a42f-d5cebd7aac99/resourceGroups/Azuredevops/providers/Microsoft.Compute/images/myPackerImage"
