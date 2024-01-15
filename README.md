# Ensuring Quality Releases - Project

## Instructions

- Login into the azure account with the command `az login`.

- Copy and paste the credentials in the packer and terraform variables.

- Run the file to configure the storage account with `bash configure-tfstate-storage-account.sh`.

![](https://github.com/dcquinche/Project-Ensuring-Quality-Releases/blob/main/assets/1_storage_account.png)

- Copy and paste the ssh-key and the storage account information to the main file. You can see your ssh-key running this command `cat ~/.ssh/id_rsa.pub` or if you don't have it, you can generate it `ssh-keygen -t rsa`.

- Run the packer file like this `packer build server.json`.

![](https://github.com/dcquinche/Project-Ensuring-Quality-Releases/blob/main/assets/2_packer.png)

- You can check in the azure portal that the storage and image have been created.

![](https://github.com/dcquinche/Project-Ensuring-Quality-Releases/blob/main/assets/3_storage_and_image.png)

- Inicialize terraform with `terraform init`.

![](https://github.com/dcquinche/Project-Ensuring-Quality-Releases/blob/main/assets/4_init.png)

- Import the resource group `terraform import azurerm_resource_group.<resource-group-name> /subscriptions/<suscription-id>/resourceGroups/<resource-group-name>`.

![](https://github.com/dcquinche/Project-Ensuring-Quality-Releases/blob/main/assets/5_import.png)

- Now you can plan and deploy the project with the following commands `terraform plan -out solution.plan` and `terraform apply "solution.plan"`.

![](https://github.com/dcquinche/Project-Ensuring-Quality-Releases/blob/main/assets/6_apply.png)

- Now you should move to the azure portal to create a DevOps oraganization. Then, create a public project. In that project you have to create an access token and a service connection to use them in next steps.

![](https://github.com/dcquinche/Project-Ensuring-Quality-Releases/blob/main/assets/7_access_token.png)

![](https://github.com/dcquinche/Project-Ensuring-Quality-Releases/blob/main/assets/8_service_connection.png)

- Configure a default agent for the pipeline. You can open a terminal in the azure portal and download the agent with the next command `curl -O https://vstsagentpackage.azureedge.net/agent/3.232.1/vsts-agent-linux-x64-3.232.1.tar.gz`, create a new directory and move into it, you can use this command `mkdir myagent && cd myagent`, extracts the downloaded documents `tar zxvf ../vsts-agent-linux-x64-3.232.1.tar.gz`, and then, run the config file `./config.sh` and enter the access token and the DevOps url.

![](https://github.com/dcquinche/Project-Ensuring-Quality-Releases/blob/main/assets/9_download_default_agent.png)

![](https://github.com/dcquinche/Project-Ensuring-Quality-Releases/blob/main/assets/10_config_agent.png)

- Change the agent to an online mode, you can do it running this command `./run.sh`.

![](https://github.com/dcquinche/Project-Ensuring-Quality-Releases/blob/main/assets/11_agent_online.png)

- Create a virtual machine, an environment and connect them for the deploy and test steps of the pipeline.

![](https://github.com/dcquinche/Project-Ensuring-Quality-Releases/blob/main/assets/12_virtual_machine.png)

![](https://github.com/dcquinche/Project-Ensuring-Quality-Releases/blob/main/assets/13_environment.png)

![](https://github.com/dcquinche/Project-Ensuring-Quality-Releases/blob/main/assets/14_vm_env_connection.png)

![](https://github.com/dcquinche/Project-Ensuring-Quality-Releases/blob/main/assets/15_vm_env_connection.png)

- Create a pipeline for the project, select the repository and run the yml file with the tasks for the build, deploy and test steps.

![](https://github.com/dcquinche/Project-Ensuring-Quality-Releases/blob/main/assets/16_pipeline_build.png)

![](https://github.com/dcquinche/Project-Ensuring-Quality-Releases/blob/main/assets/17_pipeline_deploy.png)

After the deploy, the url obtained to access the api was `http://my-application-appservice.azurewebsites.net/`.

![](https://github.com/dcquinche/Project-Ensuring-Quality-Releases/blob/main/assets/18_api.png)

- Check the postman test step for the data validation and regression tests.

![](https://github.com/dcquinche/Project-Ensuring-Quality-Releases/blob/main/assets/19_postman_data_validation.png)

![](https://github.com/dcquinche/Project-Ensuring-Quality-Releases/blob/main/assets/20_postman_regression.png)

- Check the jmeter test step and reports for the stress and endurance tests.

![](https://github.com/dcquinche/cd1807-Project-Ensuring-Quality-Releases/blob/main/assets/21_jmeter_stress.png)

![](https://github.com/dcquinche/cd1807-Project-Ensuring-Quality-Releases/blob/main/assets/22_jmeter_stress_report.png)

![](https://github.com/dcquinche/cd1807-Project-Ensuring-Quality-Releases/blob/main/assets/23_jmeter_endurance.png)

![](https://github.com/dcquinche/cd1807-Project-Ensuring-Quality-Releases/blob/main/assets/24_jmeter_endurance_report.png)

- Create an alert with a condition and configure an action group to receive an email notification when the alert triggers. You can test and check in the monitoring metrics and the email.

![](https://github.com/dcquinche/Project-Ensuring-Quality-Releases/blob/main/assets/25_alert.png)

![](https://github.com/dcquinche/Project-Ensuring-Quality-Releases/blob/main/assets/26_alert_email.png)

![](https://github.com/dcquinche/Project-Ensuring-Quality-Releases/blob/main/assets/27_alert_metrics.png)

- Create a custom log in the log analytics workspaces of azure portal. You have to ingest the output file of the selenium test, select a timestamp format and provide the file's path in the virtual machine.  Now, you can run the table with the logs.

![](https://github.com/dcquinche/Project-Ensuring-Quality-Releases/blob/main/assets/28_selenium_logs.png)

- At the end, you could use the command `terraform destroy` to destroy all the resources previously created.
