// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Debugger {
    uint public myUint;

    /**
     * Function names will be converted into hashes
     * during compilation. Public variables receive
     * an getter function automatically
     *
     * First 4 bytes of keccack256 hash:
     * setMyUint() => 492bfa18
     *
     * Application binary interface is used
     * in order to know certain functionalities
     * a smart contract comes with => JSON will be
     * transformed into hashes so methods can be
     * compared to stored bytecode
     *
     * OPCODES have different gas consumption
     * which can be read from the Ethereum yellowpaper.
     * Those can also be checked in the debugger
     */
    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }
}
