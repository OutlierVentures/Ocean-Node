# Ocean-Node
#### In progress: update to new metamask account system

Ocean Node in Helsinki at 95.216.136.41.

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


To allow the process to continue after closing your connection, hit `CTRL` + `Z` and type `bg`.

You can now close the window.

### Server setup automation

The shell script has been tested in Ubuntu 18.04 (and MacOS 10.14).

SSH into the server. Updates will be handled by the script, so there's no need to upgrade anything.

The only part which will require human input is user creation (passwords), so just create these:
```
adduser theo
adduser aron
```

Next, just SCP `server_setup_automation.sh` across or create a new file and paste the contents in e.g. using Vim or Nano.

Add execute permissions:
```
chmod +x server_setup_automation.sh
```

Now just run:
```
./server_setup_automation.sh
```

Once the script is done, it will close your connection as the server reboots. Wait a minute for the server to come back up, then just `ssh` into your account.
