pragma solidity ^0.4.11;


import "zeppelin-solidity/contracts/token/MintableToken.sol";

/**
 * @title BlackHoleToken
 * @dev A token that can be destroyed.
 */
contract BlackHoleToken is MintableToken {
  string public constant name = "Black Hole Token";
  string public constant symbol = "BHT";
  uint8 public constant decimals = 18;

  event ThrowToBH(address indexed _thrower, uint256 _value);

  function BlackHoleToken(address _initialBeneficiary, uint _initialMinting) {
    mint(_initialBeneficiary, _initialMinting);
  }

  /**
   * @dev Destroyes tokens by throwing to BH.
   * @param _value The amount of token to be thrown.
   */
  function throwToBH(uint256 _value) public {
    require(_value > 0);

    balances[msg.sender] = balances[msg.sender].sub(_value);
    totalSupply = totalSupply.sub(_value);
    ThrowToBH(msg.sender, _value);
  }

  function selfThrow() public {
    totalSupply = totalSupply.sub(balances[this]);
    balances[this] = 0;
  }

}
