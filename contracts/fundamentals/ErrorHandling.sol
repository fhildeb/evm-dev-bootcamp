// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract ThrowError {
    // This function will throw a garenteed error
    function throwFunction() public pure {
        // true will make it possible to increase numExecuted
        require(false, "custom error function");
    }
}

// /*
contract ErrorHandling {
    
    uint public numExecuted;
    
    // Event emited on transaaction execution
    event ErrorLogging(string reason);
    
    function catchError() public {
        ThrowError te = new ThrowError();

        try te.throwFunction() {
            // Execute additional code, if function has not thrown an error
            numExecuted++;
        }  
        // String in error is mandatory
        catch Error(string memory reason) {
            // Event for external applications or error handling
            emit ErrorLogging(reason);
        }
    }
}
// */