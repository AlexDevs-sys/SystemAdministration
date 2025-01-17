### Ansible and terraform for working in cloud ###

__Keep in mind that these are only recipes for configuring cloud (terraform) and VMs (ansible)__

If you want to use them, you should install terraform and ansible.
Then you should use any cloud provider (e.x. yandex cloud or AWS).
__It's also highly recommended to edit metadata with your own credentials cuz current data in metadata is only for demonstration__
You can edit main.tf to remove or add your own settings.
__Note for clouds except Yandex cloud:__ terraform.tfvars should be also edited with valid OS image information (id) (It requires Ubuntu 22.04 LTS). 

#### For configuring created Virtual machines with ansible use the commands below ####

It basically creates Web Servers, Proxy server and Backup Server for deploying web service (Media Wiki)

__Commands for basic initialization (execute in directory with playbook)__
1. First create roles with _ansible-galaxy_ command. 
There are should be 5 main roles: backup\_server\_setup, nginx\_proxy\_setup, app_basic setup, 
pgsql\_main\_launch and pgsql\_replicas\_launch.
And you can also consider using promote\_replica for replica promotion in case of main bd servers fails.


2. Just execute this command 5 times

ansible-playbook playbook.yaml -i inventory.yaml --tags="__ROLE NAME__"
