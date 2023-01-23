# Make backup file of Postgres Docker container data on one server and restore this backup on another
#

# On the Server_1 create backup file
docker exec -i container_name /bin/bash -c "PGPASSWORD=postgres_password pg_dump --username postgres_username postgres_database" > ../dump.sql

# On your machine copy this dump and upload on another server
scp -r server_a_username@server_a_ip:~/dump.sql ./
scp -r ./dump.sql server_b_username@server_b_ip:~/dump.sql

# Run backup SQL on the Server_2
docker exec -i zendesk-support_postgres_1 /bin/bash -c "PGPASSWORD=postgres_password psql --username postgres_username postgres_database" < ./dump.sql
