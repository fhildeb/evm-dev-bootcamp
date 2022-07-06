// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "./Crowdsale.sol";
import "./KYCManager.sol";

contract TokenSale is Crowdsale {
    
    KYCManager kycManager;

    constructor(uint256 rate, address payable wallet, IERC20 token, KYCManager _kycManager) Crowdsale(rate, wallet, token) {
        kycManager = _kycManager;
    }

    function _preValidatePurchase(address beneficiary, uint256 weiAmount) internal view override {
        super._preValidatePurchase(beneficiary, weiAmount);
        require(kycManager.isKYCCompleted(beneficiary), "KYC not completed yet, aborting");
    }
    
}