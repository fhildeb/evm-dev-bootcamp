// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "./ItemManager.sol";

contract Item {
    uint public price;
    uint public paid;
    uint public index;

    // Can create, pay and deliver the item
    ItemManager itemManager;

    constructor(ItemManager _itemManager, uint _price, uint _index) {
        price = _price;
        index = _index;
        itemManager = _itemManager;
    }

    // Receive payment of an item trough fallback payable function
    receive() external payable {
        require(msg.value == price, "Sent funds do not match item price");
        require(paid == 0, "Item is already paid!");
        paid += msg.value;
        // Await until the call of the itemManager went through
        (bool success, ) = address(itemManager).call{value:msg.value}(abi.encodeWithSignature("payItem(uint256)", index));
        require(success, "Delivery did not work");
    }

    fallback () external {
        
    }

}