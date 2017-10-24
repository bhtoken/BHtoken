pragma solidity ^0.4.11;

import "zeppelin-solidity/contracts/crowdsale/CappedCrowdsale.sol";
import "zeppelin-solidity/contracts/token/MintableToken.sol";
import "./BlackHoleToken.sol";

/**
 * @title SaftTokenSale
 * @dev The DAOStack SAFT token sale.
 */
contract BlackHoleTokenCrowdFunding is CappedCrowdsale {

  function BlackHoleTokenCrowdFunding(uint256 _startTime, uint256 _endTime, uint256 _rate, uint256 _cap, address _wallet)
    CappedCrowdsale(_cap)
    Crowdsale(_startTime, _endTime, _rate, _wallet)
  {

  }

  function createTokenContract() internal returns (MintableToken) {
    return (MintableToken(new BlackHoleToken(wallet, cap/10)));
  }

}
