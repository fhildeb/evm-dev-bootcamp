// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Owned {
    address owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner(){
        require(msg.sender == owner, "You are not allowed");
        /**
         * The function body of an modifier method is copied
         * to the underscore during compilation and replaced
         * with the new modifier's function body
         */
        _;
    }
    
    // Restricted to own and inheritance contracts
    function showOwner() internal view returns(address){
        return owner;
    }
}