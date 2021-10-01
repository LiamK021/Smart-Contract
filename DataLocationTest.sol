pragma solidity ^0.8.0;

contract DataLocationTest{
    uint[] stateVar = [1,4,5];
    
    function foo() public {
        uint[] memory y = stateVar;
        
        y[0] = 12;
        y[1] = 20;
        y[2] = 24;
        
        stateVar = y;
        
        uint[] storage z = stateVar;
        
        z[0] = 38;
        z[1] = 89;
        z[2] = 72;
    }
}