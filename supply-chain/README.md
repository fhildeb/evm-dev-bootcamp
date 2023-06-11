# Minimal Supply Chain App

This repository contains a minimal supply chain application to provide a trustless, decentralized system for managing a assets. It covers the entire life cycle of an item, from creation to payment and delivery, can be transparently tracked and verified on the Ethereum blockchain, ensuring the utmost transparency and reducing the potential for fraud.

## Simple Web Interface

![Simple Web Interface](/img/supply_chain.png)

## Contract Functionality

- **Item**: This contract represents an individual item in the supply chain. It has a price, an index, and a state to represent whether it's been paid for. A new instance of the Item contract is created for each item added to the supply chain. The contract also contains a fallback payable function to receive the payment for an item.
- **ItemManager**: The ItemManager contract is responsible for managing the lifecycle of an item in the supply chain. It allows the owner to create, pay for, and deliver items. Each item can be in one of the three states - Created, Paid, or Delivered, represented by an enumeration. For each state change, an event is emitted. This contract also ensures that only the contract owner can perform certain operations, such as creating an item or marking an item as delivered.
- **Migrations**: The Migrations contract keeps track of the migrations. It's a utility provided by the Truffle Suite, enabling the execution of deployment scripts in the correct order.
- **Ownable**: The Ownable contract implements an authorization pattern, which centralizes the ownership of a contract to a single address. This pattern is useful for contracts that require access control mechanisms.

## Installation

Install the Truffle package globally using npm.

```bash
npm install -g truffle
```

## Setup React Repository

Use Truffle's unbox command to create a React repository.

```bash
truffle unbox react
```

## Development Branch and Accounts

Enter the development environment with the `truffle develop` command.

```bash
truffle develop
```

## Migrating Contracts

To migrate all contracts in the Truffle development terminal, use the `migrate` command. Including the `--reset` option is mandatory to redeploy the contracts, otherwise they will not be pushed to the network.

```bash
migrate --reset
```

## Start the Client

Navigate to the client directory and start the client with your package manager.

> The frontend only works with **Node V14**. Make sure to use NVM or manually switch to a older version before continuing to install all packages.

```bash
cd client
npm install
npm start
```

## Sending Transactions

Within Truffle, transactions can be sent using the `web3.eth.sendTransaction` function. The parameters for this function include the item contract address, value, wallet address, and gas.

```bash
web3.eth.sendTransaction({to:"CUSTOM_ADDRESS", value:10, from:accounts[1], gas:300000});
```

Replace `CUSTOM_ADDRESS` with the actual address of the contract you want to send the transaction to.

## Testing

To perform testing within Truffle, simply use the `test` command.

```bash
test
```

Remember to replace the placeholders like `CUSTOM_ADDRESS` with the actual values you want to use in your project.
