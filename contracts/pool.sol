pragma solidity ^0.4.2;
// Pool

contract Pool {

  uint public total;
  mapping (bytes32 => uint) public members;

  function processClaim(string member, uint loss){
    // substract amount from members money
    // ajust pool total
    var memberID = sha256(member);
    minAmountMember(memberID, loss);
    minAmountTotal(loss);
  }

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

  // ******** TODO SOMETHING CLEVER **********
  function minAmountMember(bytes32 member, uint loss) {
    members[member] = members[member] - loss;
  }

  function getTotal() constant returns (uint) {
    return total;
  }

  function getMembers() constant returns (uint){
    // return members;
  }

}