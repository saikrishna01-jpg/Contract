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

    function withdraw(uint256 amount) public {
        require(amount <= balance, "Insufficient balance");
        balance -= amount;
        bool success = payable(msg.sender).send(amount);
        if (!success) {
            balance += amount;
            revert("Failed to transfer funds");
        }
    }
}
