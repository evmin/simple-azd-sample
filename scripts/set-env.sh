echo "Setting environment variables for Storage Account - POSIX"

resourceGroupName=rg-$(azd env get-value AZURE_ENV_NAME)
storageAccountName=$(azd env get-value AZURE_STORAGE_ACCOUNT_NAME)

storageAccountKey=$(az storage account keys list \
  --resource-group "$resourceGroupName" \
  --account-name "$storageAccountName" \
  --query "[0].value" \
  --output tsv | tr -d '\r')

if [ $? -eq 0 ]
then
    azd env set AZURE_STORAGE_ACCOUNT_KEY $storageAccountKey
fi