wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/mssql-server-2022.list)"
sudo apt-get update
sudo apt-get install mssql-tools

# run github workflow Deploy Database Job create schema and tables before bewlow sqlcmd

TERM=dumb
/opt/mssql-tools/bin/sqlcmd -S bus-server248468.database.windows.net -P fakePassword1 -U cloudadmin -d bus-db
