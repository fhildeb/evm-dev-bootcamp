//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Functions {
    
    // Input data of an transaction is used in bytes
    bytes public lastFallbackData;

    address payable owner;
    
    mapping(address => uint) public balanceReceived;

    // Called once at deployment and can not be executed afterwards
    constructor() {
        owner = payable(msg.sender);
    }
    
    // Custom getter function for reading state variables only
    function getOwner() public view returns(address) {
        return owner;
    }
    
    // Not interacting with any state variables
    function convertWeiToEther(uint _amountInWei) public pure returns(uint) {
        /**
         * Amount Units: ether, finney, szabo, wei
         * Suffixes: fenny
         * 
         * Will show zero if amount is below 1 ether
         * because integers are rounded down
         */
        return _amountInWei / 1 ether;
    }

    // Can only be called from this contract
    function resetLastFallbackData() private {
        lastFallbackData = "";
    }

    // Can only be called from this contract or other contract's functions
    function setLastFallbackData(bytes memory _lastFallbackData) internal {
        lastFallbackData = _lastFallbackData;
    }

    // Can only be called from the outside
    function sampleCalculation() external pure returns(uint) {
        return 4 + 5;
    }
    
    function destroySmartContract() public {
        require(msg.sender == owner, "You are not the owner");
        selfdestruct(owner);
    }
    
    function receiveFunds() public payable {
        assert(balanceReceived[msg.sender] + msg.value >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawFunds(address payable _receiver, uint _value) public {
        require(_value <= balanceReceived[msg.sender], "You do not have enough funds");
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _value);
        balanceReceived[msg.sender] -= _value;
        _receiver.transfer(_value);
    } 
    
    /** 
     * Execute code without a specific function nor value.
     * Only one fallback function is allowed, either
     * payable or non-payable
     */
    fallback() external  {
        // Input parameters from the transaction
        lastFallbackData = msg.data;
        receiveFunds();
    }
    
    // Execute code without a specific function call but value
    receive() external payable {
        // forward to declared function
        receiveFunds();
    }
}