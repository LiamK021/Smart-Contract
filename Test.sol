pragma solidity ^0.8.0;
pragma abicoder v2;

contract Test{
    struct S {uint a; uint[] b; T[] c;}
    struct T {uint x; uint y;}
    function f(S memory, T memory, uint) public pure {}
    function g() public pure returns (S memory, T memory, uint) {}
}