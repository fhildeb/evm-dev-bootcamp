// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract Allowance is Ownable {
    
    mapping(address => uint) public allowance;
    
    // Indexed is used to help out filter data logs
    event AllowanceChanged(address indexed _address, address indexed _allower, uint _oldAmount, uint _newAmount);
        
    function isOwner() internal view returns(bool) {
        return owner() == msg.sender;
    }

    function setAllowance(address _address, uint _amount) public onlyOwner {
        emit AllowanceChanged(_address, msg.sender, allowance[_address], _amount);
        allowance[_address] = _amount;
    }

    modifier ownerOrAllowed(uint _amount) {
        require(isOwner() || allowance[msg.sender] >= _amount, "You are not allowed!");
        _;
    }

    function reduceAllowance(address _address, uint _amount) internal ownerOrAllowed(_amount) {
        emit AllowanceChanged(_address, msg.sender, allowance[_address], allowance[_address] - _amount);
        allowance[_address] -= _amount;
    }

}