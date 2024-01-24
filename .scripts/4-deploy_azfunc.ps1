$resourceGroupName = "learn-edd46d66-29c2-4723-96ef-78e7536f9b37"
$resourceGroup = Get-AzResourceGroup | Where ResourceGroupName -like $resourceGroupName
$uniqueID = Get-Random -Minimum 100000 -Maximum 1000000
$location = $resourceGroup.Location
# Azure function name
$azureFunctionName = $("azfunc$($uniqueID)")
$azureFunctionName = "azfunc460332"
# Get storage account name
$storageAccountName = (Get-AzStorageAccount -ResourceGroup $resourceGroupName).StorageAccountName
$storageAccountName

# New-AzFunctionApp doesn't support Python 3.10+ with Function v$ on Linux
$functionApp = New-AzFunctionApp -Name $azureFunctionName `
    -ResourceGroupName $resourceGroupName -StorageAccount $storageAccountName `
    -FunctionsVersion 4 -RuntimeVersion 3.9 -Runtime python -Location $location
