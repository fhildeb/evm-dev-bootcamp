// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

library Search {
    
    // Iterating through an array until the vaule was found
    function indexOf(uint[] storage self, uint value) public view returns (uint) {
        for (uint i = 0; i < self.length; i++)
        if (self[i] == value) return i;
        return 0xFFFFFFFF;
    }
}

// Implementing Search using object-oriented approach
contract LibraryWithoutUsing {
    
    uint[] data;
    
    function append(uint value) public {
        data.push(value);
    }
    
    function replace(uint _old, uint _new) public {
        // This performs the library function call
        uint index = Search.indexOf(data, _old);
        
        if (index == 0xFFFFFFFF)
            data.push(_new);
        else
            data[index] = _new;
    }
}