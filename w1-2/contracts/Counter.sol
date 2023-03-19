// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract Counter {

    uint public result = 0;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function add(uint num) public {
        result += num;
    }

    function count() public view returns(uint) {
        require(msg.sender == owner);
        
        return result;
   }

}