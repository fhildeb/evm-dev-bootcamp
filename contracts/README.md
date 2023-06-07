# Solidity Smart Contracts

## Fundamentals

This repository contains a series of Smart Contracts written in Solidity for the purpose of understanding and learning how to write, deploy, and interact with smart contracts on the Ethereum blockchain. Below is a brief description of each contract:

### ArrayLength Contract

- This contract demonstrates the use of dynamic arrays in Solidity.
- Provides functions to add and remove elements from a public uint array, 'myUintArray'.

### ContractLifecycle Contract

- A contract to demonstrate the lifecycle of a smart contract including creation, pausing, withdrawal of funds, and destruction.
- Includes a function to send funds, set the contract to paused or active, withdraw all funds to a certain address, and finally, a function to destroy the contract itself.

### Debugger Contract

- This contract showcases how certain elements in Solidity like public variables and function names are processed.
- Contains an explanatory section on how function names are hashed, the role of the Application Binary Interface (ABI), and how gas consumption is tied to different OPCODES.
- Provides a simple function to set a public uint variable, 'myUint'.

### ErrorHandling Contract

- A contract built to intentionally throw an error using the 'require' function.
- The 'throwFunction' is designed to always throw a custom error message.
- This contract demonstrates the error handling in Solidity.
- Uses the 'try/catch' paradigm to handle errors thrown by the 'ThrowError' contract.
- Emits an event logging the reason for the error.

### Events Contract

- This contract showcases how events in Solidity can be used to inform external listeners about the occurrences inside a contract.
- Maintains a token balance for addresses and provides a function to send tokens from the contract's address to another address.
- Emits an event every time tokens are sent.

### ExceptionAssert Contract

- The contract showcases the use of 'assert' for overflow/underflow protection and 'require' for error handling in Solidity.
- Allows for funds to be received and withdrawn to a certain address while maintaining a balance record.
- Includes overflow checks and balance requirement checks.

### FirstContract

- This is a simple contract containing a public string variable.
- Represents a basic introductory example to Solidity contracts.

### Functions Contract

- A contract demonstrating the various types of functions in Solidity.
- It shows how to handle constructor, view, pure, private, internal, and external functions.
- Also includes functionalities like fund receiving, fund withdrawal, and fallback operations with a unique feature to store the last fallback data.

### InheritanceModifier Contract

- A contract showing how inheritance is done in Solidity.
- It allows token creation, burning, purchasing, and transferring between addresses. It uses a contract called 'Owned' (not provided here) that provides certain functionalities (possibly related to ownership control).
- Also includes a special function modifier "onlyOwner" that restricts certain function calls to the owner of the contract only.

### Libraries Contract

- A contract that shows how to use external libraries in Solidity. This contract uses the OpenZeppelin's SafeMath library to prevent overflow and underflow in mathematical operations.
- It includes functionality to maintain and transfer tokens between addresses.

### LibraryWithoutUsing Contract

- The Search library offers a function to find the index of a value in an array.
- The contract demonstrating how to use functions from a library without the 'using' keyword.
- It includes functions to append data to an array and replace an old value with a new one in the array.
- The library "Search" is utilized to find the index of the old value that needs to be replaced.

### LibraryWithUsing Contract

- The Search library offers a function to find the index of a value in an array.
- The LibraryWithUsing contract demonstrates how to use the Search library with the 'using' keyword.
- The contract includes functions to append data to an array and replace an old value with a new one in the array. The Search library's indexOf function is used to find the index of the old value that needs to be replaced.

### Mapping Contract

- A simple contract demonstrating the use of mappings in Solidity. It provides methods to manipulate boolean values stored against uint and address keys.
- The contract has a method for toggling a boolean value for the caller's address and a method to set a specific boolean value.

### MappingStruct Contract

- A more complex contract demonstrating the use of mappings with structs.
- The contract tracks payments made to it, storing each payment as a struct containing the amount and timestamp. These payment structs are stored in a mapping against the sender's address.
- The contract includes functions for sending funds to it, and withdrawing a specific amount or all funds from it.

### Overwrite Contracts

- These contracts demonstrate function overriding in Solidity using a hirachical letter sending scenario.
- In the contract LetterFromC, the function 'message' from both LetterFromA and LetterFromB is overridden.
- The function in LetterFromC calls its own message as well as the message from the parent contracts.

### Owned Contract

- This contract sets the contract creator as the owner, and provides a modifier `onlyOwner` that ensures that a function can only be called by the contract owner.
- The `showOwner` function returns the owner's address and is restricted to the contract owner and inherited contracts due to its `internal` visibility.

### SendingFunds Contract

- This contract includes a function to deposit funds, and two functions to withdraw all deposited funds either to the depositor or a specified recipient.
- Funds are locked for 1 minute after each deposit.

### StateShadowing Contracts

State variable shadowing is a characteristic of Solidity inheritance where a derived contract declares a state variable that has the same name as a state variable in its base contract.

- `NumberA` is a simple contract with a private variable `x`.
- `NumberB` inherits from `NumberA` and declares its own `x` variable.

In the case, `B` is a derived contract that declares a state variable `x` with the same name as a state variable in the base contract `A`. Solidity treats state variable shadowing differently based on the visibility of the variables. In this case, the number within `A` is declared as private, which means it's only visible within the contract. Therefore, the number within `B` doesn't override the value in `A`. Instead, it just shadows it. The visability can be adjusted to test multiple scenarios.

### TryCatch Contracts

- The `FailureType` contract includes functions that cause different types of failures: `requireFailure`, `revertFailure`, and `assertFailure`.
- The `TryCatch` contract, attempts to call `FailureType`'s `requireFailure` function and catches any errors. It then emits events with details about the errors.

## Variables Contract

- This contract is a basic example of how to handle different types of variables in Solidity. It has functions to set and manipulate the value of variables, including a uint, a bool, a uint8, an address, and a string.
- It provides functionality for incrementing and decrementing the uint8 without checking for overflow.
- The `getBalanceOfAddress` function returns the balance of the address stored in `myAddress`.
