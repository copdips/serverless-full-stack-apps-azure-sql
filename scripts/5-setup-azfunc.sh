azfunc_name=azfunc460332
resource_group_name=learn-2e005eb2-3818-4992-8437-f52ef937cae2
az functionapp config appsettings set -n $azfunc_name -g $resource_group_name \
    --settings \
    RealTimeFeedUrl="https://s3.amazonaws.com/kcm-alerts-realtime-prod/vehiclepositions_enhanced.json" \
    AzureSQLConnectionString="Server=tcp:bus-server248468.database.windows.net,1433;Initial Catalog=bus-db;Persist Security Info=False;User ID=cloudadmin;Password=$password;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;" \
    LogicAppUrl=https://azure.com
