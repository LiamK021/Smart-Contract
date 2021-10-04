pragma solidity ^0.8.0;

contract MappingsStructExample {
    
    struct Payment{
        uint amount;
        uint timestamp;
    }
    
    struct Balance {
        uint totalBalance;
        uint numPayments;
        mapping(uint => Payment) payments;
    }
    
    mapping (address => Balance) public balanceReceived;
    
    function getBalance() public view returns(uint){
        return address(this).balance;
    }
    
    function sendMoney() public payable{
        balanceReceived[msg.sender].totalBalance += msg.value;
    }
}