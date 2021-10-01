pragma solidity ^0.8.7;

contract HelloWorldContract{
    function hellowWord() external pure returns (string memory){
        return "hello world";
    }
}