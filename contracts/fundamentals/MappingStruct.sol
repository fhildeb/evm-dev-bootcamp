// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract MappingStruct {
    struct Payment {
        uint amount;
        uint timestamps;
    }

    struct Balance {
        uint totalBalance;
        uint numPayments;
        // List of all executed payments
        mapping(uint => Payment) payments;
    }

    // Every address has its own balance
    mapping(address => Balance) public balanceReceived;

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function sendFunds() public payable {
        // Total balance in Balance struct increases
        balanceReceived[msg.sender].totalBalance += msg.value;

        // New payment is instanciated
        Payment memory newPayment = Payment(msg.value, block.timestamp);

        // numPayments is index of payment list and gets fetched to store the payment
        balanceReceived[msg.sender].payments[
            balanceReceived[msg.sender].numPayments
        ] = newPayment;
        balanceReceived[msg.sender].numPayments++;
    }

    function withdrawFundsTo(address payable _receiver, uint _value) public {
        require(
            balanceReceived[msg.sender].totalBalance >= _value,
            "You do not have enough funds"
        );
        balanceReceived[msg.sender].totalBalance -= _value;
        _receiver.transfer(_value);
    }

    function withdrawAllFundsTo(address payable _receiver) public {
        // Create buffer variable for anti-reentrancy
        uint balanceToSend = balanceReceived[msg.sender].totalBalance;
        // Reset mapping before interaction with external address
        balanceReceived[msg.sender].totalBalance = 0;
        // External transactions always at the end
        _receiver.transfer(balanceToSend);
    }
}
