# Token Sale DApp

This repository contains a Token Sale DApp that enables the selling of a specific ERC20 token in exchange for Ether. Investors can participate in the token sale, purchasing tokens at a specified rate, and the proceeds of the sale are forwarded to a wallet address.

## Simple Web Interface

![Simple Web Interface](/img/token_sale.png)

## Contract Functionality

- **Crowdsale**: This is the main contract used to manage the token sale. It facilitates the purchase of tokens by investors using Ether. The contract includes features to set the rate of conversion between Ether and the token, keep track of the amount of Ether raised, and send purchased tokens to the investors.
- **Context**: This contract provides functions to determine the execution context of a transaction.
- **IERC20**: This interface defines the standard functions provided by ERC20 tokens.
- **SafeMath**: This contract provides math functions with safety checks that throw on error to prevent overflow and underflow.
- **SafeERC20**: This contract provides ERC20 token functions with safety checks that throw on error.
- **ReentrancyGuard**: This contract provides a modifier to prevent reentrant calls, a common attack vector for contracts.
- **KYCManager**: This contract provides Know Your Customer compliance functions. It allows the owner to specify which addresses have completed their KYC process and are permitted to interact with the token sale. It also provides the ability to revoke KYC completion status.

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

## Testing

To perform testing within Truffle, simply use the `test` command.

```bash
test
```

Remember to replace the placeholders like `web3.eth.accounts[0]` with the actual values you want to use in your project.
