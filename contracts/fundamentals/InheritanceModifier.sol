// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

/**
 * Inheritance with seperate contract
 * mimics object-oriented workflow
 */
import "./Owned.sol";

contract InheritanceModifier is Owned {
    mapping(address => uint) public tokenBalance;

    uint tokenPrice = 1 ether;

    constructor() {
        tokenBalance[owner] = 100;
    }

    function createNewToken() public onlyOwner {
        tokenBalance[owner]++;
    }

    function burnToken() public onlyOwner {
        require(tokenBalance[owner] >= 0, "You have no tokens to burn");
        tokenBalance[owner]--;
    }

    function purchaseToken() public payable {
        require(
            (tokenBalance[owner] * tokenPrice) / msg.value > 0,
            "There are not enough tokens"
        );
        tokenBalance[owner] -= msg.value / tokenPrice;
        tokenBalance[msg.sender] += msg.value / tokenPrice;
    }

    function sendToken(address _receiver, uint _value) public {
        require(
            tokenBalance[msg.sender] >= _value,
            "You do not have enough tokens"
        );
        assert(tokenBalance[_receiver] + _value >= tokenBalance[_receiver]);
        assert(tokenBalance[msg.sender] - _value <= tokenBalance[msg.sender]);

        tokenBalance[msg.sender] -= _value;
        tokenBalance[_receiver] += _value;
    }

    // Call inherited function
    function getOwner() public view returns (address) {
        return super.showOwner();
    }
}
