# Get resource group and location and random string
$resourceGroupName = "learn-59396413-451a-48bc-9f35-ccdbedd2d21b"
$resourceGroup = Get-AzResourceGroup | Where ResourceGroupName -like $resourceGroupName
$uniqueID = Get-Random -Minimum 100000 -Maximum 1000000
$location = $resourceGroup.Location
# Azure static web app name
$webAppName = $("bus-app$($uniqueID)")
$webAppName = "bus-server248468"
# Get the repository name
$appRepository = "https://github.com/copdips/serverless-full-stack-apps-azure-sql"
# Get user's GitHub personal access token
$githubToken = "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"
# App service plan name
$appServicePlanName = (Get-AzAppServicePlan -resourceGroupName $resourceGroupName).Name

# Deploy Azure static web app
$staticWebApp = az staticwebapp create -n $webAppName -g $resourceGroupName `
-s $appRepository -l 'westus2' -b main --token $githubToken
Write-Host "Azure Static Web App deployed."
