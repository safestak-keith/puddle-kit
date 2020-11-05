# SafeStak [SAFE] Cardano Puddle Construction Kit

## Goals
Define a minimal executable declarative representation of cloud infrastructure to host a [Cardano](https://cardano.org/en/what-is-cardano/) stake pool 

## Prerequisites
 - **Azure CLI** [here](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?view=azure-cli-latest#install-or-update)
 - **Terraform** [here](https://www.terraform.io/downloads.html)
 - **Visual Studio Code** [here](https://code.visualstudio.com/download) and the **Remote - SSH** extension 
 - An Azure account - [try a free trial](https://azure.microsoft.com/en-gb/free/)

## General Guide
 - Amend the variables in [spool-vars.tfvars](./spool-vars.tfvars) using [spool-vars.tf](./spool-vars.tf) as reference
 - Login with `az login`
 - Set relevant subscription `az account set --subscription SubscriptionName` (verify using `az account show`)
 - Create `spool-vars.tfvars` variable assignment file with your variables (see spool-vars.tf for reference)
 - Run `terraform init`
 - Run `terraform plan --var-file spool-vars.tfvars`
 - If the output looks good, run `terraform apply --var-file spool-vars.tfvars --auto-approve`
 - Create SSH key .pem file from the output from using `terraform output sshpvk > ssh.pem`
 - Note the public IP addresses by running `terraform output c0pip` and `terraform output r0pip`
  
### SSH key prep (Linux)
`chmod 400 ssh.pem`

### SSH key prep (Windows)
```
$path = "ssh.pem"
icacls.exe $path /reset
icacls.exe $path /GRANT:R "$($env:USERNAME):(R)"
icacls.exe $path /inheritance:r
```
### SSH to Provisioned Azure Cloud VMs
`ssh -i ssh.pem ss@{PUBLIC_IP_ADDRESS}`

### SSH using Visual Studio Code Remote - SSH
Click on the green remote icon bottom left to `Remote-SSH: Open Configuration File...` and add entries like:
```
Host FRIENDLY_NAME
  HostName {PUBLIC_IP_ADDRESS}
  IdentityFile {ABSOLUTE_PATH_TO_SSH_PEM}
  User {vm-username}
```
Click on the green remote icon bottom left again and to `Remote-SSH: Connect to Host...` and click on the entries created in the previous step to SSH to them.

### Troubleshooting
Note: If you are using Windows, ensure you have [OpenSSH](https://www.howtogeek.com/336775/how-to-enable-and-use-windows-10s-built-in-ssh-commands/) 

If you are unable to SSH to the newly created VMs please check the SSH NSG rule in the Azure Portal and ensure your current IP is correct.

## Was this useful?
I hope this guide can help many others get their first Cardano stake pool up and running. I truly believe that the more people we have contributing to the community the quicker this ecosystem can realise its tremendous potential.

## CBF and want us to do it all for you?
Reach out to us at safestak@pm.me 

### How you can contribute
Stake to `SAFE` [SafeStak Staking Pool](https://www.safestak.com)

Donate ADA to `DdzFFzCqrhstoeh312o7AySdVMRyB5PpferbUcTEHqq6XXfs51qLGQWJeVjK3q5GovyF22wkit5eQbUKDH5u6ZrqsHtu8sSkPy1ZEQDh`
