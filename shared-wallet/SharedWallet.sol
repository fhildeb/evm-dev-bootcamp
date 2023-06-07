// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "./Allowance.sol";

contract SharedWallet is Allowance{
    
    event MoneySent(address indexed _beneficiary, uint _amount);
    event MoneyReceived(address indexed _from, uint _amount);
    
    function withdrawMoney(address payable _receiver, uint _amount) public ownerOrAllowed(_amount) {
        require(_amount <= address(this).balance, "Contract doesn't own enough money");
        if(!isOwner()) {
            reduceAllowance(msg.sender, _amount);
        }
        emit MoneySent(_receiver, _amount);
        _receiver.transfer(_amount);
    }
    
    // Overriding the OpenZepplin functionality to change owner
    function renounceOwnership() public view override onlyOwner {
        revert("can't renounceOwnership");
    }

    receive() external payable {
        emit MoneyReceived(msg.sender, msg.value);
    }
}