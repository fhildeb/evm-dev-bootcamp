// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Mapping {
    mapping(uint => bool) public myUintMapping;
    mapping(address => bool) public myAddressMapping;

    function setValue(uint _index) public {
        myUintMapping[_index] = true;
    }

    function revertMyAddressValue() public {
        myAddressMapping[msg.sender] = !myAddressMapping[msg.sender];
    }

    function setMyAddressValue(bool _bool) public {
        myAddressMapping[msg.sender] = _bool;
    }
}
