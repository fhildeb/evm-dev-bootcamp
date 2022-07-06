// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Events {
    
    mapping(address => uint) public tokenBalance;
    
    event TokensSent(address _sender, address _receiver, uint _amount);
    
    constructor() {
        tokenBalance[msg.sender] = 100;
    }
    
    /**
     * Returns bool in logs only on simulated chains but not
     * in real networks. To react to executed code, events are
     * mandatory for external behaviour
     */
    function sendToken(address _receiver, uint _amount) public returns(bool) {
        require(tokenBalance[msg.sender] >= _amount, "Not enough tokens");
        assert(tokenBalance[_receiver] + _amount >= tokenBalance[_receiver]);
        assert(tokenBalance[msg.sender] - _amount <= tokenBalance[msg.sender]);
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_receiver] += _amount;
        
        emit TokensSent(msg.sender, _receiver, _amount);
        
        return true;
    }
}