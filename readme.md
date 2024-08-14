# Overview

A simple demo of azd managed deployment.

The application create a storage account and a functionApp that is triggered on uploading a file to blob storage.

The sample also demonstrates an azd post infrastructure provisioning hook in /scripts folder

## Prerequisites

- Install [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- Install [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/install-azd)
- If using Windows, install the [Platform PowerShell](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.4).
    **OBS!** It is MUST be installed. It is NOT Windows default PowerShell.
- Login to your tenant with Azure CLI `az login`

## Deploy the infrastructure

```sh
azd env set AZURE_LOCATION 'swedencentral'
azd up
```

**OBS!** 'Deploying services (azd deploy)' stage can take up to 10 min.

## ENV Variables

The env variables are set in the azd config file located at:

```.azure/<env_name>/.env```
