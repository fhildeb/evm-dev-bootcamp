## Web3 Instance Contract Interaction

The project is a basic example of how to interact with a smart contract deployed on a local Ethereum blockchain using `Web3.js`.

This JavaScript file initializes a web3 instance connecting to a local Ethereum network at `http://localhost:8545`. It then retrieves all the accounts from the local Ethereum network.

A contract instance is created using the `Contract ABI` and `address`. The script then calls the myUint function from the contract, both as a plain value and as a string. It also demonstrates how to send a transaction by calling the setUint function of the contract.

## Project Structure

- `index.html`: A webpage which includes the `web3.js` library to interact with Ethereum smart contracts.
- `sampleContract.sol`: A Solidity smart contract `SampleContract` with a state variable `myUint` and a function `setUint`.
- `web3-browser.js`: JavaScript file that initializes a `web3` instance and interacts with the `SampleContract`.

## Contract Interaction

The sample smart contract has two functions:

- `myUint()`: This function returns a uint256 value stored in the contract.
- `setUint(uint256 _myUint)`: This function sets a uint256 value to the contract. This function is nonpayable, meaning it can't receive Ether.

## Web3 Library

Web3.js helps because no hashes have to be encoded and
decoded manually. Connection is done via normal REST interface from open ports to the blockchain network consisting of nodes.

Standard Port: `8545`

It has different subsets:

```text
.eth 		- interacting with the Ethereum network
.net	        - interacting with the network properties
.personal	- interacting with Ethereum accounts
.shh            - interacting with the whisper protocol
.bzz		- interacting with the swarm network
.utils		- utilities for interaction
```

## Prerequisites

- Node.js and npm installed on your machine
- Truffle for compiling and deploying smart contracts
- Ganache for running a local Ethereum network

## Getting Started

### 1. Install Truffle and Ganache

Install Truffle globally on your machine.

```bash
npm install -g truffle ganache-cli
```

### 2. Install Web3.js

Navigate to your project directory and install `web3.js`.

```bash
npm install web3
```

### 3. Start Ganache

Start the local Ethereum node. Once Ganache is running, it will start a local Ethereum node at http://localhost:8545/.

Run Ganache CLI with the following command:

```bash
ganache-cli
```

The output will look similar to this:

```text
Ganache CLI v6.4.1 (ganache-core: 2.5.3)

Available Accounts
==================
(0) 0x90F8bf6A479f320ead074411a4B0e7944Ea8c9C1 (~100 ETH)
(1) 0xFFcf8FDEE72ac11b5c542428B35EEF5769C409f0 (~100 ETH)
...

Private Keys
==================
(0) 0x4f3edf983ac636a65a842ce7c78d9aa706d3b113bce9c46f30d7d21715b23b1d
(1) 0x6cbed15c793ce57650b9877cf6fa156fbef513c4e6134f022a85b1ffdd59b2a1
...

HD Wallet
==================
Mnemonic:      candy maple cake sugar pudding cream honey rich smooth crumble sweet treat
Base HD Path:  m/44'/60'/0'/0/{account_index}

Gas Price
==================
20000000000

Gas Limit
==================
6721975

Listening on 127.0.0.1:8545
```

### 4. Compile and Deploy the Contract

Deploy the smart contract to your local Ethereum network using Truffle.

> This step involves deploying the contract on the Ganache chain as a separate step described within the Truffle docs.

```bash
truffle migrate --network development
```

On successful deployment, you will get a contract address. Update this address in the `web3-browser.js` file.

### 5. Install HTTP Server

Install a HTTP server such as `http-server` to serve the `index.html` file.

```bash
npm install -g http-server
```

### 6. Run the HTTP Server

Run the server from the root of your project directory.

```bash
http-server
```

### 7. Access the Project

Open your browser and go to `http://localhost:8080` to view and interact with the project.

The webpage is accessing Ganache on `http://localhost:8080` in the background.
