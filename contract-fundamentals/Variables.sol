// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Variables {
    uint256 public myUint;
    bool public myBool;
    uint8 public myUint8;
    address public myAddress;
    string public myString;

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }

    function incrementUint() public {
        // dont check for overflow
        unchecked {
            myUint8++;
        }
    }

    function decrementUint() public {
        // dont check for overflow
        unchecked {
            myUint8--;
        }
    }

    function setAddress(address _myAddress) public {
        myAddress = _myAddress;
    }

    function getBalanceOfAddress() public view returns (uint) {
        return myAddress.balance;
    }

    function setMyString(string memory _myString) public {
        myString = _myString;
    }
}
