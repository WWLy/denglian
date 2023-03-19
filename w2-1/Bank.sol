// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract Bank {

    address private owner;

    mapping(address => uint256) private balances;

    constructor() {
        owner = msg.sender;
    }

    event OnTransactionLog(address sender, uint256 amount, string log);

    /// 接收
    receive() external payable {
        // 更新
        balances[msg.sender] += msg.value;

        emit OnTransactionLog(msg.sender, msg.value, "receive");
    }

    /// 提取
    function withdraw(uint256 amount) public {
        require(msg.sender == owner, "No Premission");
        require(amount > 0, "Amount must be greater than 0");
        require(balances[msg.sender] >= amount, "Insufficient Balance");

        balances[msg.sender] -= amount;

        (bool success, ) = msg.sender.call{value: amount}("");
        
        require(success, "Withdraw Failed");

        emit OnTransactionLog(msg.sender, amount, "withdraw");
    }

    function getBalance() public view returns(uint256) {
        return balances[msg.sender];
    }
}