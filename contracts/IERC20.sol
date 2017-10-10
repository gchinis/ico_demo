pragma solidity ^0.4.4;

interface IERC20 {

  //functions

  //totalSupply() is a constant
  //returns total supply uint256
  function totalSupply() constant returns (uint256 totalSupply);

  //balanceOf takes address(type) _owner...is a constant
  //returns uint balanceOf
  function balanceOf(address _owner) returns (uint256 balanceOf);

  //transfer takes address(type) _to, uint _value
  //returns bool success
  function transfer(address _to, uint256 _value) returns (bool success);

  //transferFrom takes address _from, address _to, and uint _value
  //returns bool success
  function transferFrom(address _from, address _to, uint256 _value) returns (bool success);

  //approve takes address _spender, uint value
  //returns bool success
  function approve(address _spender, uint256 _value) returns (bool success);

  //allowance takes address _owner, and _spender, is a constant
  //returns uint remaining
  function allowance(address _owner, address _spender) constant returns (uint256 remaining);

  // events

  //Transfer
  //takes address indexed _from, address indexed _to, uint _value
  event Transfer(address indexed _from, address indexed _to, uint256 _value);

  //Approval
  //takes address indexed _owner, address indexed _spender, uint _valule
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}
