#-----------------------INSTALLATION-----------------------

# Installing geth
brew tap ethereum/ethereum
brew install ethereum

# Starting geth
geth

# Start an interactive JavaScript environment
# This connects to a node
# within one folder

# Terminal 1:
geth --datadir ~/EthereumChain

# Terminal 2:
geth attach ipc:/Users/fhildebrandt/EthereumChain/geth.ipc

#------------------------INSTANCE------------------------

# Create new Account
personal.newAccount();

# Keystore Directory
# /Users/fhildebrandt/EthereumChain/keystore

# Get current sync status
eth.syncing

#---------------------PRIVATE NETWORK--------------------

# Create genesis file, which is used to instanciate the
# first block on the chain
# See ./geneses.json

# Within the genesis.json folder run
geth --datadir ./chaindata init ./genesis.json
# to initialize the network

# Start the private network 
geth --datadir ./chaindata --nodiscover

# Start an interactive JavaScript environment
geth attach ipc:/Users/fhildebrandt/Downloads/Lukso/Bootcamp/Geth/chaindata/geth.ipc

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

#---------------------MUTANT CHAIN-------------------
cd ~~
git clone https://github.com/ethereum/go-ethereum

# Option 1: Open Consensus
code ~/go-ethereum/consensus/ethash/consensus.go

# Search for return CalcDifficulty(chain.Config(), time, parent)
# amd replace it with the following line
return big.NewInt(1)

# Option 2: Open Miner
code ~/go-ethereum/miner/worker.go
# Search for return if now := time.Now().Unix(); tstamp > now+1 {
# amd replace it with the following line
if now := time.Now().Unix(); tstamp > now {

# Build
cd ~/go-ethereum/
make geth

cd ~/Downloads/Lukso/Bootcamp/Geth/

# Within the genesis.json folder run
/Users/fhildebrandt/go-ethereum/build/bin/geth --datadir ./mutantdata init ./mutantgenesis.json

# Start the private mutant network 
/Users/fhildebrandt/go-ethereum/build/bin/geth --datadir ./mutantdata --nodiscover

# Start an interactive JavaScript environment
/Users/fhildebrandt/go-ethereum/build/bin/geth attach ipc:/Users/fhildebrandt/Downloads/Lukso/Bootcamp/Geth/mutantdata/geth.ipc

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

#---------------------CLOSING TERMINAL-------------------
# geth: ctrl+c
# geth-js: ctrl+d

#---------------------START MINING ONELINER-------------------
# GETH
cd ~/Downloads/Lukso/Bootcamp/Geth/
geth --datadir ./chaindata --nodiscover --unlock 0 --mine --miner.threads=1

# MUTANT
cd ~/Downloads/Lukso/Bootcamp/Geth/
/Users/fhildebrandt/go-ethereum/build/bin/geth --datadir ./mutantdata --nodiscover --unlock 0 --mine --miner.threads=1