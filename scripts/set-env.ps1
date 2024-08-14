Write-Host "Setting environment variables Storage Account - PS1"

$azdenv = azd env get-values --output json | ConvertFrom-Json
$resourceGroupName = "rg-"+$azdenv.AZURE_ENV_NAME

$storageAccountKey=az storage account keys list `
  --resource-group $resourceGroupName `
  --account-name $azdenv.AZURE_STORAGE_ACCOUNT_NAME `
  --query "[0].value" `
  --output tsv `

if ($? -eq $false) {
    Write-Host "Sourcing Keys failed. Esnure 'az login' and 'azd up' Have been run successfully."
    exit 1
}

azd env set AZURE_STORAGE_ACCOUNT_KEY $storageAccountKey

exit 0