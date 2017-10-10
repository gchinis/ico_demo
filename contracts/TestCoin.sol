pragma solidity ^0.4.4;

import './IERC20.sol';

contract TestCoin is IERC20 {

  //declare how many tokens will be in circulation
  uint public constant _totalSupply = 1000000000;

  //exchange symbol
  string public constant symbol = 'TCN';

  //public name of the coin
  string public constant name = 'Test Coin';

  //places of decimals of the coin (fractions)
  uint8 public constant decimals = 3;

  //declare a mapping of addresses and their balances
  mapping(address => uint265) balances;

  //declare a mapping of permissions for spending
  mapping(address => (mapping(address => uint256)) allowed;

  //constructor
  function TestCoin() {
    //initialize first balance (minter account with total supply)
    balances[msg.sender] = _totalSupply;
  }

  function totalSupply() constant returns (uint256 totalSupply){
    return _totalSupply;
  }

  function balanceOf(address _owner) constant returns (uint256 balanceOf){
    return balances[_owner];
  }

  function transfer(address _to, uint256 _value) returns (bool success){
    //check if amount exists in account
    require(
      balances[msg.sender] >= _value
      && _value > 0;
      );
    //subtract amount from msg.sender
    balances[msg.sender] -= _value;
    //add amount to _to address
    balances[_to] += _value;
    //log Tx event
    Transfer(msg.sender, _to, _value);
    //return success bool
    return true;
  }

  function transferFrom(address _from, address _to, uint256 _value) returns (bool success){
    require(
      //is this address allowed to send on from's behalf
      allowed[_from][msg.sender] >= _value
      //is the balance of from greater than value?
      && balances[_from] >= _value
      //is the value greater than 0
      && _value > 0;
      )

      //transfer the balances between accounts
      balances[_from] -= _value;
      balances[_to] += _value;

      //decrement amount that msg.sender is allowed to spend on _from's behalf
      allowed[_from][msg.sender] -= _value;

      //log the Tx event and return bool
      Transfer(_from, _to, _value);
      return true;
  }

  function approve(address _spender, uint256 _value) returns (bool success){
    //add spender mapped to value to sender's list of approved accounts
    allowed[msg.sender][_spender] = _value;
    //log Approval event
    Approval(msg.sender, _spender, _value);
    return true;
  }

  function allowance(address _owner, address _spender) constant returns (uint256 _value){
    return allowed[_owner][_spender];
  }

  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);

}
