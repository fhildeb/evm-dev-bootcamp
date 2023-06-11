# Web3 Terminal Interaction

This script is used for interaction with an Ethereum blockchain network. It makes use of the Web3.js library, which is a collection of modules to help you interact with a local or remote Ethereum network using HTTP, IPC or WebSocket.

## What the script does:

1. Imports the Web3 package.
2. Creates an instance of Web3 connecting to the local Ethereum network.
3. Logs the current state of Web3.
4. Retrieves the balance of a specified account in Wei (smallest unit of Ether).
5. Converts and logs the account balance from Wei to Ether.
6. Sends an Ether transaction from one account to another.
7. Sends a static transaction to a contract.
8. Computes the SHA-3 hash of a specified function and trims it down.
9. Sends a variable transaction to a contract.
10. Creates a contract instance.
11. Logs the contract details.
12. Calls a function from the contract.
13. Sends a function to the contract.

## Contract Interaction

The sample smart contract has two functions:

- `myUint()`: This function returns a uint256 value stored in the contract.
- `setUint(uint256 _myUint)`: This function sets a uint256 value to the contract. This function is nonpayable, meaning it can't receive Ether.

The script creates an instance of this contract and calls these functions. Be sure to replace the contract ABI and address with your actual contract's ABI and address.

The contract has to be deployed on the local Ganache chain as a separate step before being able to conect to it within the script.

## Development

### 1. Install Node and NPM

Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine, and npm is a package manager for Node.js packages. Visit the official [Node.js website](https://nodejs.org/) and download the installer. You can verify the installation by running the following commands in your terminal:

```bash
node -v
npm -v
```

### 2. Install Ganache

Ganache is a personal blockchain for Ethereum development. You can quickly fire up a personal Ethereum blockchain to run tests, execute commands, and inspect state while controlling how the chain operates. Install Ganache CLI globally with npm by running the following command in your terminal:

```bash
npm install -g ganache-cli
```

### 3. Install Truffle Suite

Truffle Suite is a development environment, testing framework, and asset pipeline for Ethereum. It will help you to build smart contracts and dApps. You can install it globally with npm by running the following command in your terminal:

```bash
npm install -g truffle
```

### 4. Install Web3

Web3.js is a collection of libraries that allow you to interact with a local or remote Ethereum node using HTTP, IPC, or WebSocket. Navigate to your project directory and run the following command in your terminal:

```bash
npm install web3
```

## Running the Script

Before running the script, ensure Ganache is running. You can start Ganache by running the following command in your terminal:

```bash
ganache-cli
```

This will start a local Ethereum blockchain that you can use for testing. It will provide you with 10 available accounts and private keys, along with a mnemonic to regenerate them.

To run the script, navigate to the script's directory and run the following command in your terminal:

```bash
node web3-terminal.js
```

**Note:** Make sure to replace the addresses, contract ABI, and contract address in the script with your actual values.
