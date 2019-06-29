# from linuxserver/transmission
###
# Transmission + autoremove-torrents + FlexGet

docker create \
  --name=transmission \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -e TRANSMISSION_WEB_HOME=/combustion-release/ `#optional` \
  -p 9091:9091 \
  -p 51413:51413 \
  -p 51413:51413/udp \
  -v path to data:/config \
  -v path to downloads:/downloads \
  -v path to watch folder:/watch \
  -v path to config.yml folder:/root/.flexget \
  --restart unless-stopped \
  rabbired/transmission

# jerrymakesjelly/autoremove-torrents
https://github.com/jerrymakesjelly/autoremove-torrents

docker exec "name" autoremove-torrents --confg="" --log=""

# FlexGet set

# set webui passwd

docker exec "name" flexget web passwd "passwd"

# stop flexget

docker exec "name" flexget daemon stop
