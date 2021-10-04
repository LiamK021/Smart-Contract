pragma solidity ^0.8.0;

contract SendMoneyExample{
    uint public balanceReceived;
    uint public lockedUntil;
    address public owner;
    
    constructor(){
        owner = msg.sender;
    }
    
    function receiveMoney() public payable{
        balanceReceived += msg.value;
        lockedUntil = block.timestamp + 1 minutes;
    }
    
    function getBalance() public view returns( uint){
        return address(this).balance;
    }
    
    function withdrawMoney() public
     {
         if ( lockedUntil < block.timestamp){
             address payable to = payable(msg.sender);
            to.transfer(getBalance());
         }
        
     }
     
    function withdrawMoneyTo ( address payable _to) public{
        if ( lockedUntil < block.timestamp){
            _to.transfer(getBalance());
        }
    }
    
    function withdrawAllMoney (address payable _to) public{
        require(owner == msg.sender, "You can not withdraw");
        _to.transfer(getBalance());
    }
}