// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "./subcontracts/ERC20.sol";

contract Token is ERC20 {
    constructor(uint256 initialSupply) ERC20("BootcampToken", "BCT") {
        _mint(msg.sender, initialSupply);
    }

    function decimals() public override pure returns(uint8) {
        return 0;
    }

}