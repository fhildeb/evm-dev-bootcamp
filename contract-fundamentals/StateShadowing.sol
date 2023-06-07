// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract NumberA {
    uint private x = 123;

    function getXfromA() public view returns (uint) {
        return x;
    }
}

contract NumberB is NumberA {
    /** Declaring the same variable name of an
     * inherited contract is only allowed on
     * private variables
     */
    uint x = 234;

    function getXfromB() public view returns (uint) {
        return x;
    }
}
