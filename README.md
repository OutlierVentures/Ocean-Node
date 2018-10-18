# Ocean-Node

Instructions for setting up an Ocean Protocol node. Network status: testnet on Ethereum Kovan.

A node might currently be running at [http://ocean1.nodes.outlierventures.io:3000](http://ocean1.nodes.outlierventures.io:3000)

### Requirements
- Docker
- Docker Compose
- Node 8 and npm for manual keeper contract functions (e.g. migrations)


### Steps for running on Kovan

For latest code:
```
git clone https://github.com/oceanprotocol/docker-images.git
```

Switch into repo and set environment variables:
```
cd docker-images
export KEEPER_NETWORK_NAME=kovan
```

1. For the new metamask account system:

Install metamask in your browser. Brave's built in Metamask work's well.
```
sudo ./start_ocean.sh --latest
```

2. For the old 10-account system:
```
git checkout origin/master
sudo docker-compose --project-name=ocean up
```

Wait a few minutes for the various services to start and connect.

Once up, you can publish from the server at `0.0.0.0:3000` and interact remotely at `95.216.136.41:3000`.

To allow the process to continue after closing your connection, hit `CTRL` + `Z` and type `bg`.

You can now close the window.
