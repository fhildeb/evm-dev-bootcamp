#---------------------TRUFFLE & REACT & TESTS-------------------
# Initialize React
truffle unbox react

# Clear Project
# Remove everything from ./contracts except Migrations.sol
# Remove all tests from ./tests
# Remove all migrations from ./migrations

# Tests from Open Zepplin
# https://github.com/OpenZeppelin/openzeppelin-contracts/tree/docs-v3.x/test#
# as seen in /test/test_Token.js (ERC20)
# like https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/test/token/ERC20/ERC20.test.js

# Truffle Test Documentation:
# https://www.trufflesuite.com/docs/truffle/testing/testing-your-contracts

# Chai Test Framework
# https://www.chaijs.com/plugins/chai-as-promised/
# https://www.chaijs.com/guide/styles/#assert

# Open Zepplin Contracts needed for Crowdsale:
# https://github.com/OpenZeppelin/openzeppelin-contracts/blob/docs-v2.x/contracts/crowdsale/Crowdsale.sol
# All dependencies need to be updated to solidity 0.8.7
# All imports need to be changed

# Install dependency module that loads environment variables for tests
npm install --save dotenv

# Create .env file within the project folder
# Set test variables within .env

# Add .env to the test file (2_deploy_contract)
# require('dotenv').config({path: '../.env'});

# Log .env in console
# console.log(process.env);

# Start development server from root folder
cd client
npm run start

#---------------------CONNECT WITH METAMASK-------------------

# Start ganache from CLI to match chainID
ganache-cli --networkId 5777 --chainId 5777 
# might also be 1337
# Start Ganache on port 7545 or 8545

# Show accounts within truffle
accounts

# Add custom chain Ganache to Metamask
# Network Name: Ganache
# RPC URL: HTTP://127.0.0.1:8545 
# might also be 7545
# Chain ID: 5777

# Send TX within truffle to Metamask
# Account address need to equal first MetaMask Account
# This will be the address, truffle is deploying contracts with
# Therefore it needs funds
web3.eth.sendTransaction({from: accounts[0], to:"0xFB010D3F1282629a4E9Ef51A355D6AD7B4e2979e", value: web3.utils.toWei("5","ether")})

# Add HD Wallet Provider to truffle
# This will connect MetaMask accounts with the local truffle network
# Attached in ./truffle-config.js
npm install --save @truffle/hdwallet-provider

# Open Mnemonic from Metamask and copy it to .env file
# Metamask -> Account -> Settings -> Security & Privacy -> Reveal Seed Words

# Run the Migrations again with the right network
# the name ganache_local is defined in ./truffle-config.js
truffle migrate --network ganache_local --reset

# Logging
truffle console --network ganache_local

#---------------------CONNECT INFURA-------------------
# Create new network in config file
truffle migrate --network kovan_infura --reset