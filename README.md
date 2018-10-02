# Ocean-Node
#### In progress: update to new metamask account system

Ocean Node in Helsinki at 95.216.136.41.


### Steps for running on Kovan

For latest code:
```
git clone https://github.com/oceanprotocol/docker-images.git
```

Switch into repo and set environment variables:
```
cd docker-images
export OCEAN_VERSION=latest
export KEEPER_NETWORK_NAME=kovan
```

1. For the new metamask account system:

Install metamask in your browser. Brave's built in Metamask work's well.
```
./start_ocean.sh
```

2. For the old 10-account system:
```
git checkout origin/master
docker-compose --project-name=ocean up
```

Wait a few minutes for the various services to start and connect.
