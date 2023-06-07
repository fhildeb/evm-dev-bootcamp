# Geth Client Modifications

In this guide, we cover the installation and setup of a private Ethereum network or what we call a "Mutant Chain". This involves running your own Ethereum nodes, initializing and configuring your private network, and even modifying Ethereum's consensus mechanism for your specific use case. The guide also covers the use of Geth, a multipurpose command line tool that runs a full Ethereum node.

Used Geth Version: [Xathorron (v1.10.11)](https://github.com/ethereum/go-ethereum/releases/tag/v1.10.11)

## 1. Installation

Firstly, we need to install Geth, a command line interface for running a full Ethereum node.

```shell
# Installing geth
brew tap ethereum/ethereum
brew install ethereum

# Starting geth
geth
```

## 2. Instance

Next, let's initiate the interactive JavaScript environment.

```shell
# Start an interactive JavaScript environment within one folder
# Terminal 1:
geth --datadir ~/EthereumChain

# Terminal 2:
geth attach ipc:<home-path>/EthereumChain/geth.ipc
```

You can create a new account and check the current sync status with the following commands:

```shell
# Create new Account
personal.newAccount();

# Get current sync status
eth.syncing
```

## 3. Setting Up a Private Network

Now, we need to set up a private network. This involves creating a genesis file, which is used to instantiate the first block on the chain. Once the genesis file is created, we can initialize the network and start the private network.

```shell
# Create genesis file
# See ./genesis.json

# Initialize the network
geth --datadir ./chaindata init ./genesis.json

# Start the private network
geth --datadir ./chaindata --nodiscover
```

## 4. Interacting with the Private Network

Here's how to start an interactive JavaScript environment and show accounts.

```shell
# Start an interactive JavaScript environment
geth attach ipc:<full-pwd>/Geth/chaindata/geth.ipc

# Show accounts
eth.accounts

# Show personal information
personal

# Create new Accounts
personal.newAccount();

# Show miner functionalities
miner

# Set miner coinbase
miner.setEtherbase(eth.accounts[0]);

# Start miner on 1 core
miner.start(1);

# Web3 Functionality Overview
web3

# Show account balance in ether
web3.fromWei(web3.eth.getBalance(eth.accounts[0]), "ether");
```

## 5. Building and Starting a Mutant Chain

We can also create a modified version of the Ethereum chain by tweaking the consensus mechanism. Here's how to clone the Ethereum repo, modify it, and build it.

```shell
# Clone Ethereum
cd ~
git clone https://github.com/ethereum/go-ethereum
```

### 5.1 Modify consensus mechanism

```shell
code ~/go-ethereum/consensus/ethash/consensus.go
```

Then search for the difficulty calculation:

`return CalcDifficulty(chain.Config(), time, parent)`

and replace it with the following linear static difficulty:

`return big.NewInt(1)`

### 5.2 Modify the miner timing

```shell
code ~/go-ethereum/miner/worker.go
```

Search for the minor timestamp calculation:

`return if now := time.Now().Unix(); tstamp > now+1 {`

and replace it with the following static miner timestamp:

`if now := time.Now().Unix(); tstamp > now {`

### 5.3 Build from source

```
cd ~/go-ethereum/
make geth
```

### 5.4 Start the mutant network

```shell
# Initialize the network with mutant genesis
<home-path>/go-ethereum/build/bin/geth --datadir ./mutantdata init ./mutantgenesis.json

# Start the private mutant network
<home-path>/go-ethereum/build/bin/geth --datadir ./mutantdata --nodiscover
```

## 6. Interacting with the Mutant Chain

Here's how to interact with the mutant chain and start mining. Make sure to exchange <full-pwd> with static directory path

```shell
# Start an interactive JavaScript environment
# Exchange <full-pwd> with static directory path
<home-path>/go-ethereum/build/bin/geth attach ipc:<full-pwd>/Geth/mutantdata/geth.ipc
```

Now we can interact with the Geth client directly:

```shell
# Show accounts
eth.accounts

# Create new Accounts
personal.newAccount();

# Set miner coinbase
miner.setEtherbase(eth.accounts[0]);

# Start miner on 1 core
miner.start(1);

# Web3 Functionality Overview
web3

# Show account balance in ether
web3.fromWei(web3.eth.getBalance(eth.accounts[0]), "ether");

# Stop miner
miner.start(1);
```

## 7. Closing the Client Terminals

```shell
# To exit Geth
# In the geth terminal: ctrl+c
# In the geth-js terminal: ctrl+d
```

## 8. Private PoW Network Commands

You can also use these commands to start mining in the regular private network or the mutant chain with a single command:

### 8.1 Start regular private network

```shell
# Exchange <full-pwd> with static directory path
cd <full-pwd>/Geth/

geth --datadir ./chaindata --nodiscover --unlock 0 --mine --miner.threads=1
```

### 8.2 Start mutant chain network

```shell
# Exchange <full-pwd> with static directory path
cd <full-pwd>/Geth/
<home-path>/go-ethereum/build/bin/geth --datadir ./mutantdata --nodiscover --unlock 0 --mine --miner.threads=1
```
