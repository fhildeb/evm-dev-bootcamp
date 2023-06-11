
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "./subcontracts/Ownable.sol";

contract KYCManager is Ownable {



    mapping(address => bool) allowed;

    function setKYCCompleted(address _addr) public onlyOwner {
        allowed[_addr] = true;
    }

    function setKYCRevoked(address _addr) public onlyOwner {
        allowed[_addr] = false;
    }

    function isKYCCompleted(address _addr) public view returns(bool) {
        return allowed[_addr];
    }
}