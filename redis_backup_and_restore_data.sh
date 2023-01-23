# Shut down Redis server/container with volume on Server_1 and copy dump.rdb file on your machine
scp -r root@116.203.207.172:/var/lib/docker/volumes/zendesk-support_redis_data/_data/dump.rdb ./
# Then shut down Redis on the Server_2 and upload dump.rdb to the Server_2
scp -r ./dump.rdb root@91.107.251.152:/var/lib/docker/volumes/zendesk-support_redis_data/_data/dump.rdb
# Now when you will start Redis on the Server_2 it will have data stored on the Server_1