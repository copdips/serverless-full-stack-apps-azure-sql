azfunc_name=azfunc460332
resource_group_name=learn-59396413-451a-48bc-9f35-ccdbedd2d21b
password=fakePassword1

# az func python 3.11 has ODBC Driver 18 for SQL Server not 17
az functionapp config appsettings set -n $azfunc_name -g $resource_group_name \
    --settings \
    RealTimeFeedUrl="https://s3.amazonaws.com/kcm-alerts-realtime-prod/vehiclepositions_enhanced.json" \
    AzureSQLConnectionString="Driver={ODBC Driver 17 for SQL Server};Server=tcp:bus-server248468.database.windows.net,1433;Database=bus-db;Uid=cloudadmin;Pwd=$password;Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30;" \
    LogicAppUrl='https://prod-51.westus.logic.azure.com:443/workflows/792eb677aecb4d17a634f8188da78258/triggers/manual/paths/invoke?api-version=2016-10-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=lx8QXj0125xX0P_do2elUV4Zo-mxjinbevcGAXh8tj4'
