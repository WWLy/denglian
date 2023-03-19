// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

interface IScore {
    /// 修改分数
    function setScore(address student, uint8 score) external;
    /// 查询分数
    function getScore(address student) external view returns(uint8);
}

contract Score is IScore {

    address private owner;

    /// 分数
    mapping(address => uint8) private scores;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyTeacher() {
        require(msg.sender == owner, "Not teacher");
        _;
    }

    function getScore(address stu) external view override returns (uint8) {
        return scores[stu];
    }

    function setScore(address stu, uint8 newScore) external override onlyTeacher {
        require(newScore <= 100, "Score out of range");
        require(newScore > 0, "Score out of range");
        scores[stu] = newScore;
    }
}