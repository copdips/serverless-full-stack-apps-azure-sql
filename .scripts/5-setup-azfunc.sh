azfunc_name=azfunc460332
resource_group_name=learn-edd46d66-29c2-4723-96ef-78e7536f9b37

# az func python 3.11 has ODBC Driver 18 for SQL Server not 17
az functionapp config appsettings set -n $azfunc_name -g $resource_group_name \
    --settings \
    RealTimeFeedUrl="https://s3.amazonaws.com/kcm-alerts-realtime-prod/vehiclepositions_enhanced.json" \
    AzureSQLConnectionString="Driver={ODBC Driver 18 for SQL Server};Server=tcp:bus-server248468.database.windows.net,1433;Database=bus-db;Uid=cloudadmin;Pwd=$password;Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30;" \
    LogicAppUrl='https://prod-44.westus.logic.azure.com:443/workflows/8eae4ddbc7e34a3cb6cb5f0dceea4860/triggers/manual/paths/invoke?api-version=2016-10-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=bOXn1AAJu3FRz_ZiOyzn3qBA8peT5eiSCJsUCNEWmdA'
