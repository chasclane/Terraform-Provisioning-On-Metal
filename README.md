# Terraform-Provisioning-On-Metal

Basic provisioning script to create a SSH keypair, and provision one or more servers on Equinix Metal. 

# Getting Started:
  
You'll need to Install Terraform:

## Terraform is just a single binary. Visit their download page, choose your operating system, make the binary executable, and move it into your path.

Here is an example for macOS:

curl -LO https://releases.hashicorp.com/terraform/0.12.18/terraform_0.12.18_darwin_amd64.zip 
unzip terraform_0.12.18_darwin_amd64.zip 
chmod +x terraform 
sudo mv terraform /usr/local/bin/ 

## Download this project
To download this project and get in the directory, run the following commands:

`git clone https://github.com/chasclane/Terraform-Provisioning-On-Metal/`

`cd Terraform-Provisioning-On-Metal`

## Initialize Terraform:
Terraform uses modules to deploy infrastructure. In order to initialize the modules your simply run: `terraform init`. This should download the necessary modules into a hidden directory .terraform 

# Tasks Performed in the script:

1. Create an SSH Key Pair to use to securely access the servers once provisioned

2. Upload the Public Key to Equinix Metal, Point to the locally saved Private Key for authorization.

3. Provision one or more servers in the given datacenter (facility), with the given OS, to the provided project.

# Output:

The script will output the IP Address(es) for the created instance(s). 

Modify the following variables in the file terraform.tfvars:
```
api_key
```
API Key can be found/created in the console.equinix.com portal - Click the dropdown next to your name in the top right, click API-Keys.
```
project_id
```
Project ID can be found in the console.equinix.com portal - Once logged in, and in the Project, Click "Project Settings" copy the Project ID and paste here:
```
name
```
Hostname prefix for your instance(s). Example: test-server
```
quantity
```
To change the quantity of servers provisioned, modify this number. Default is set at 2. 

# To Access:
On Linux/Mac
To SSH into these servers: Open a terminal and type `ssh root@(YOUR PUBLIC IPv4 ADDRESS)`
On Windows:
- Download an SSH client, such as PuTTY.
- Run the PuTTY.exe binary downloaded earlier go to `Data` under `Connection`, and add `root` in the field of the username.
- Go to `Authentication`, under `SSH`, and click the `Browse` button, then navigate to where you put your private SSH key that you created earlier.
- Now go back to `Session`, enter the public IP address of your server, give a name to the session, and click `Open`.

