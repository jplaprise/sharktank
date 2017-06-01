var ConvertLib = artifacts.require("./ConvertLib.sol");
var MetaCoin = artifacts.require("./MetaCoin.sol");
var ProofOfExistence1 = artifacts.require("./ProofOfExistence1.sol");
var ProofOfExistence2 = artifacts.require("./ProofOfExistence2.sol");
var ProofOfExistence3 = artifacts.require("./ProofOfExistence3.sol");
var Insurance = artifacts.require("./Insurance.sol");

var Pool = artifacts.require("./Pool.sol");


module.exports = function(deployer) {
  deployer.deploy(ConvertLib);
  deployer.link(ConvertLib, MetaCoin);
  deployer.deploy(MetaCoin);

  deployer.deploy(ProofOfExistence1);
  deployer.deploy(ProofOfExistence2);
  deployer.deploy(ProofOfExistence3);
  deployer.deploy(Insurance);

  deployer.deploy(Pool);
 
};
