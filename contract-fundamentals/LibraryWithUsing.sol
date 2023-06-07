// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

/**
 * Libraries are working like stateless contracts but are
 * called in context of another smart contract
 * to extend their functionalities and can^ not
 * be destroyed.
 *
 * The code can be reused by DELEGATECALL.
 *
 *  -no state variables
 *  -can not inherit
 *  -can not receive ether
 */
library Search {
    // Iterating through an array until the vaule was found
    function indexOf(
        uint[] storage self,
        uint value
    ) public view returns (uint) {
        for (uint i = 0; i < self.length; i++) if (self[i] == value) return i;
        return 0xFFFFFFFF;
    }
}

contract LibraryWithUsing {
    using Search for uint[];

    uint[] data;

    function append(uint value) public {
        data.push(value);
    }

    function replace(uint _old, uint _new) public {
        // This performs the library function call
        uint index = data.indexOf(_old);
        if (index == 0xFFFFFFFF) data.push(_new);
        else data[index] = _new;
    }
}
