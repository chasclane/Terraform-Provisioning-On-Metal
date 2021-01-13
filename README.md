# Terraform-Provisioning-On-Metal

Basic provisioning script to create a SSH keypair, and provision one or more servers on Equinix Metal. 

#Tasks Performed in the script:

1. Create an SSH Key Pair to use to securely access the servers once provisioned

2. Upload the Public Key to Equinix Metal, Point to the locally saved Private Key for authorization.

3. Provision one or more servers in the given datacenter (facility), with the given OS, to the provided project.

#Output:

The script will output the IP Address(es) for the created instance(s). 

#To Access:

To SSH into these, open a terminal (Linux/Mac), and type ssh root@(IP ADDRESS)

Modify the following variables in the file terraform.tfvars:
'''
api_key
'''
API Key can be found/created in the console.equinix.com portal - Click the dropdown next to your name in the top right, click API-Keys.
'''
project_id
'''
Project ID can be found in the console.equinix.com portal - Once logged in, and in the Project, Click "Project Settings" copy the Project ID and paste here:
'''
name
'''
Hostname prefix for your instance(s). Example: test-server
'''
quantity
'''
To change the quantity of servers provisioned, modify this number. Default is set at 2. 
