# https://learn.microsoft.com/en-us/training/modules/deploy-backend-apis/3-exercise-deploy-resources?pivots=python&source=learn

# Collect password
$adminSqlLogin = "cloudadmin"
$password = "Password1"
# Prompt for local ip address
# $ipAddress = "$(curl ifconfig.co)"

Connect-AzAccount

# Get resource group and location and random string
$resourceGroupName = "learn-59396413-451a-48bc-9f35-ccdbedd2d21b"
$resourceGroup = Get-AzResourceGroup | Where ResourceGroupName -like $resourceGroupName
$resourceGroup
$uniqueID = Get-Random -Minimum 100000 -Maximum 1000000
$location = $resourceGroup.Location
# The logical server name has to be unique in the system
$serverName = "bus-server$($uniqueID)"
$serverName = "bus-server248468"
# The sample database name
$databaseName = "bus-db"
Write-Host "Please note your unique ID for future exercises in this module:"
Write-Host $uniqueID
Write-Host "Your resource group name is:"
Write-Host $resourceGroupName
Write-Host "Your resources were deployed in the following region:"
Write-Host $location
Write-Host "Your server name is:"
Write-Host $serverName

# 2.13.153.57
# learn-cf392e0c-0fc1-4b57-9a09-ad5023ce571a
# 732836
# westus
# bus-server248468

# Create a new server with a system wide unique server name
$server = New-AzSqlServer -ResourceGroupName $resourceGroupName `
    -ServerName $serverName `
    -Location $location `
    -SqlAdministratorCredentials $(New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $adminSqlLogin, $(ConvertTo-SecureString -String $password -AsPlainText -Force))
# Create a server firewall rule that allows access from the specified IP range and all Azure services
# $serverFirewallRule = New-AzSqlServerFirewallRule `
#     -ResourceGroupName $resourceGroupName `
#     -ServerName $serverName `
#     -FirewallRuleName "AllowedIPs" `
#     -StartIpAddress $ipAddress -EndIpAddress $ipAddress
$serverFirewallRule = New-AzSqlServerFirewallRule `
    -ResourceGroupName $resourceGroupName `
    -ServerName $serverName `
    -FirewallRuleName "AllowedIPs" `
    -StartIpAddress 0.0.0.0 -EndIpAddress 255.255.255.255
$allowAzureIpsRule = New-AzSqlServerFirewallRule `
    -ResourceGroupName $resourceGroupName `
    -ServerName $serverName `
    -AllowAllAzureIPs
# Create a database
$database = New-AzSqlDatabase  -ResourceGroupName $resourceGroupName `
    -ServerName $serverName `
    -DatabaseName $databaseName `
    -Edition "GeneralPurpose" -Vcore 4 -ComputeGeneration "Gen5" `
    -ComputeModel Serverless -MinimumCapacity 0.5
Write-Host "Database deployed."

bash
