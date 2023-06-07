// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract ExceptionAssert {
    // Saving storage on uint
    mapping(address => uint64) public balanceReceived;

    function receiveFunds() public payable {
        // Checking math for overflow
        assert(
            balanceReceived[msg.sender] + uint64(msg.value) >=
                balanceReceived[msg.sender]
        );
        balanceReceived[msg.sender] += uint64(msg.value);
    }

    function withdrawFundsTo(address payable _receiver, uint64 _value) public {
        // Require instead of IF-clause, to handle error
        require(
            _value <= balanceReceived[msg.sender],
            "You do not have enough funds."
        );
        assert(
            balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _value
        );
        balanceReceived[msg.sender] -= _value;
        _receiver.transfer(_value);
    }
}
