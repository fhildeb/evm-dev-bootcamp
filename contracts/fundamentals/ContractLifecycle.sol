// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract ContractLifecycle {
    
    address owner;
    bool public paused;
    
    constructor() {
        owner = msg.sender;
        paused = true;
    }
    
    function sendFunds() public payable {
        
    }
    
    function setPaused(bool _paused) public {
        require(msg.sender == owner, "Only the owner can pause the contract");
        paused = _paused;
    }
    
    function withdrawAllFunds(address payable _receiver) public {
        require(msg.sender == owner, "Only the owner can withdraw all funds");
        require(!paused, "Contract is paused");
        _receiver.transfer(address(this).balance);
        
    }
    
    function destroySmartContract(address payable _owner) public {
        require(msg.sender == owner, "Only the owner can destroy the contract");
        selfdestruct(_owner);
    }
}