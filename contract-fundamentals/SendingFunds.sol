// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract SendingFunds {
    uint public balanceReceived;
    uint public lockedUntil;

    function depositFunds() public payable {
        balanceReceived += msg.value;

        /**
         * Single Time Units: week, day, hour, minute, second
         * Suffixes: weeks, days, hours, minutes, seconds
         */
        lockedUntil = block.timestamp + 1 minutes;
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function withdrawAllFunds() public {
        if (lockedUntil < block.timestamp) {
            // payable cast mandatory
            address payable receiver = payable(msg.sender);
            receiver.transfer(address(this).balance);
        }
    }

    function withdrawAllFundsTo(address payable _receiver) public {
        if (lockedUntil < block.timestamp) {
            _receiver.transfer(address(this).balance);
        }
    }
}
