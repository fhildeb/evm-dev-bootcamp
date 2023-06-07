// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

contract Libraries {
    /**
     * Embed library
     *
     * uint would be unsafe for overflow
     * on calculations, so a library can be
     * used to counter this problem and cancle
     * the transaction on detected overflow operations
     */
    using SafeMath for uint;

    mapping(address => uint) public tokenBalance;

    constructor() {
        tokenBalance[msg.sender] = 1;
    }

    function sendToken(address _receiver, uint _amount) public returns (bool) {
        tokenBalance[msg.sender] = tokenBalance[msg.sender].sub(_amount);
        tokenBalance[_receiver] = tokenBalance[msg.sender].add(_amount);
        return true;
    }
}
