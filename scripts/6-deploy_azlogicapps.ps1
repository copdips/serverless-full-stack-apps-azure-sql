# Resource group name and resource group
$resourceGroupName = "learn-2e005eb2-3818-4992-8437-f52ef937cae2"
$resourceGroup = Get-AzResourceGroup | Where ResourceGroupName -like $resourceGroupName
$location = $resourceGroup.Location
# Get the repository name
$appRepository = Read-Host "Enter your GitHub repository URL (e.g. https://github.com/[username]/serverless-full-stack-apps-azure-sql):"
# Clone the repo - note this asks for the token
$cloneRepository = git clone $appRepository
# Get subscription ID
$subId = [Regex]::Matches($resourceGroup.ResourceId, "(\/subscriptions\/)+(.*\/)+(.*\/)").Groups[2].Value
$subId = $subId.Substring(0,$subId.Length-1)
# Deploy logic app
az deployment group create --name DeployResources --resource-group $resourceGroupName `
    ` --template-file ./serverless-full-stack-apps-azure-sql/deployment-scripts/template.json `
    --parameters subscription_id=$subId location=$location
