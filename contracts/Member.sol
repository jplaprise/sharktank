pragma solidity ^0.4.2;
// Member

contract Member {

  string public name;
  uint public maxClaim;

  function member(){
  }

  function setName(string aName) {
    name = aName;
  }

  function setMaxClaim(uint max) {
    maxClaim = max;
  }
	
}