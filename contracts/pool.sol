pragma solidity ^0.4.2;
// Pool

import "./Member.sol";

contract Pool {

  uint public total;
  address[] public membersList;


  function enrollMore(string member, uint amount) {
    var addedMember = new Member();
    addedMember.setName(member);
    addedMember.setMaxClaim(amount);

    // add new member to the pool!
    membersList.push(addedMember);

    // update total
    addAmountTotal(amount);

  }

  function processClaimMinimum(uint loss) {
    // TODO add check if there is money first...
    minAmountTotal(loss);
  }

  function addAmountTotal(uint amountToAdd) {
    // add a call to split with insurer partner
    total = total + amountToAdd;
  }

  function minAmountTotal(uint amountToSubstract) {
    total = total - amountToSubstract;
  }

  function getTotal() constant returns (uint) {
    return total;
  }

  // ************ THIS IS NOT WORKING ************
  function getMembers() constant returns (uint){
    // return members;
  }

}