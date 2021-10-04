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
    
    mapping (address => uint) public balanceReceived;
    
    function getBalance() public view returns(uint){
        return address(this).balance;
    }
    
    function sendMoney() public payable{
        balanceReceived[msg.sender] += msg.value;
    }
    
    function withdrawAllMoney (address payable _to) public{
        uint balanceToSend = balanceReceived[msg.sender];
        balanceReceived[msg.sender]= 0;
        _to.transfer(balanceToSend);
    }
}