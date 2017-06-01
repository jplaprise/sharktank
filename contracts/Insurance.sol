pragma solidity ^0.4.2;
// Insurance contract, I guess

contract Insurance {

  address public owner;
  mapping (bytes32 => bool) private insureds;

  function insurance() {
    // set owner = the creator of this contract
    owner = msg.sender;
  }

  // add an address to the map as valid
  // only owner can do this >> if statement below
  function addInsured(string insured) {
    // if (msg.sender != owner) return;
    var insuredID = getInsuredID(insured);
    insureds[insuredID] = true;
  }

  function getInsuredID(string insured) constant returns (bytes32) {
    return sha256(insured);
  }

  function checkIfInsured(string requestor) constant returns (bool) {
    var insuredID = getInsuredID(requestor);
    return insureds[insuredID];
  }

  // ask for money
  // only an insured can do this >> require statement
  function declareLoss(string requestor, uint amount) constant returns(uint) {
    require(checkIfInsured(requestor));
    return amount;
  }

  function getOwner() constant returns(address) {
    return owner;
  }

  function getSender() constant returns(address) {
    return msg.sender;
  }






}