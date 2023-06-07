## Shared Wallet

The Shared Wallet project is a blockchain-based solution created on Ethereum using Solidity. It showcases an innovative way to share funds between multiple participants while maintaining control and traceability. This shared wallet is not just a simple wallet where all members can freely draw funds, but rather, it is structured to have an owner who can allocate specific allowances to individual addresses.

#### Allowance Contract

This contract, inherited from OpenZeppelin's Ownable contract, allows the owner of the contract to set allowances for other Ethereum addresses. Each address's allowance represents the amount of Ether they are authorized to withdraw from the wallet. The `setAllowance` function enables the owner to change these allowances. For auditing and transparency, the contract emits an `AllowanceChanged` event whenever an allowance is modified. There are also internal functions and modifiers that check if a function caller is the owner or has enough allowance for certain operations.

#### Shared Wallet Contract

This contract extends the Allowance contract and is the main point of interaction for users. Users can deposit funds to the wallet, and authorized users can withdraw money up to their allocated allowance. The `withdrawMoney` function incorporates a check to ensure that there are sufficient funds in the contract before proceeding with the withdrawal. The owner of the wallet can withdraw unlimited funds, while other users are constrained by their allowance. Two events, `MoneySent` and `MoneyReceived`, are emitted when money is withdrawn or deposited, respectively, providing a clear transaction history. The owner's ability to renounce ownership, a function provided by the OpenZeppelin Ownable contract, has been deliberately blocked to ensure continued control over the wallet.
