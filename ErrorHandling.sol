// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ErrorHandling {
    address public owner;
    uint public value;

    constructor() {
        owner = msg.sender;
    }

    function setValue(uint newValue) public {
        require(msg.sender == owner, "only owner can set the value");
        assert(newValue > 0);
        value = newValue;
    }

    function withdraw() public {
        require(msg.sender == owner, "Only the owner can withdraw!");
        require(value>0, "the contract has no funds to withdraw");
        uint amt = value;
        value = 0;
        
    }

    function triggerRevert() public {
        require(msg.sender == owner, "Only the owner can triggert a revert");
        require("this function reverts");
    }
}