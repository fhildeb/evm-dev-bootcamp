# Supply Chain MVP App

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

```bash
cd client
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
