// Create Contract Instances
var Token = artifacts.require("./Token.sol");
var TokenSale = artifacts.require("./TokenSale.sol");
var KYCManager = artifacts.require("./KYCManager.sol");

/**
 * Link to .env file to change variables there
 * and get rid of static variables
 */
require("dotenv").config({ path: "../.env" });
// console.log(process.env);

module.exports = async function (deployer) {
  let addr = await web3.eth.getAccounts();

  // Initialize token with 1000 supply
  await deployer.deploy(Token, process.env.INITIAL_TOKENS);

  // Initialize KYC
  await deployer.deploy(KYCManager);
  await deployer.deploy(
    TokenSale,
    1,
    addr[0],
    Token.address,
    KYCManager.address
  );

  // Without KYC (only 3 arguments)
  //await deployer.deploy(TokenSale, 1, addr[0], Token.address);

  // Initialize token sale with initial supply to account 0
  let tokenInstance = await Token.deployed();
  await tokenInstance.transfer(TokenSale.address, process.env.INITIAL_TOKENS);
};
