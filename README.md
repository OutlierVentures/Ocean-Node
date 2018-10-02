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
sudo ./start_ocean.sh
```

2. For the old 10-account system:
```
git checkout origin/master
sudo docker-compose --project-name=ocean up
```

Wait a few minutes for the various services to start and connect.

Once services are running you should see:
```
keeper-contracts_1  | eth_getFilterLogs
keeper-contracts_1  | eth_getFilterLogs
keeper-contracts_1  | eth_getFilterLogs
...
```
... interrupted occasionally by output from `tendermint_1`

At this point, you can publish from the server at `0.0.0.0:3000`
