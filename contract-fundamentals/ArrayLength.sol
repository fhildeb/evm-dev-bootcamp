// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract ArrayLenght {
    uint[] public myUintArray;

    function addElement(uint _num) public {
        myUintArray.push(_num);
    }

    function removeElement() public {
        myUintArray.pop();
    }
}
