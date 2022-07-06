// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "./Item.sol";
import "./Ownable.sol";

contract ItemManager is Ownable {

    enum ItemStatus{Created, Paid, Delivered}

    struct ItemStruct {
        Item item;
        ItemManager.ItemStatus status;
        string identifier;
    }
    mapping(uint => ItemStruct) public items;
    
    uint index;


    event ItemStatusChanged(uint _index, uint _status, address _address);

    function createItem(string memory _identifier, uint _price) public onlyOwner {
        Item createdItem = new Item(this, _price, index);        
        items[index].item = createdItem;
        items[index].status = ItemStatus.Created;
        items[index].identifier = _identifier;
        emit ItemStatusChanged(index, uint(items[index].status), address(createdItem));
        index++;
    }

    function payItem(uint _index) public payable {
        Item paidItem= items[_index].item;
        
        // Payable function has to be public but can only be called internally
        require(address(paidItem) == msg.sender, "Only items are allowed to update themselves");
        require(paidItem.price() == msg.value, "Not fully paid yet");
        require(items[_index].status == ItemStatus.Created, "Item is not created or already paid");
        items[_index].status = ItemStatus.Paid;
        emit ItemStatusChanged(_index, uint(items[_index].status), address(paidItem));
    }

    function deliverItem(uint _index) public onlyOwner {
        require(items[_index].status == ItemStatus.Paid, "Item is not created or paid");
        items[_index].status = ItemStatus.Delivered;
        emit ItemStatusChanged(_index, uint(items[_index].status), address(items[_index].item));
    }
}