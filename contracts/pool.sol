pragma solidity ^0.4.2;
// Pool

import "./Member.sol";

contract Pool {

  uint public total;
  mapping (bytes32 => uint) public members;
  address[] public membersList;

  function pool() {

  }

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

  function processClaim(string member, uint loss){
    // substract amount from members money
    // ajust pool total
    var memberID = sha256(member);
    minAmountMember(memberID, loss);
    minAmountTotal(loss);
  }

  // ***** DEPRECATED ******
  function enroll(string member, uint amount){
   // add member and his amount
   // calculate new total
   var memberID = sha256(member);
   addAmountMember(memberID, amount);
   addAmountTotal(amount);
  }

  function addAmountTotal(uint amountToAdd) {
    // add a call to split with insurer partner
    total = total + amountToAdd;
  }

  function addAmountMember(bytes32 member, uint amount) {
    members[member] = members[member] + amount;
  }

  function minAmountTotal(uint amountToSubstract) {
    total = total - amountToSubstract;
  }

  function minAmountMember(bytes32 member, uint loss) {
    members[member] = members[member] - loss;
  }

  function getTotal() constant returns (uint) {
    return total;
  }

  // ************ THIS IS NOT WORKING ************
  function getMembers() constant returns (uint){
    // return members;
  }

}