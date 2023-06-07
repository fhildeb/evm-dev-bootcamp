const Token = artifacts.require("Token");
const TokenSale = artifacts.require("TokenSale");
const KYCManager = artifacts.require("KYCManager");

// Chai setup
const chai = require("./setup_chai.js");
const BN = web3.utils.BN;
const expect = chai.expect;

contract("TokenSale Test", async function (accounts) {
  const [initialHolder, recipient, anotherAccount] = accounts;

  // Test if Tokens are in token sale contract
  it("there shouldnt be any coins in my account", async () => {
    let instance = await Token.deployed();

    return expect(
      instance.balanceOf.call(initialHolder)
    ).to.eventually.be.a.bignumber.equal(new BN(0));
  });

  it("all coins should be in the tokensale smart contract", async () => {
    let instance = await Token.deployed();
    let balance = await instance.balanceOf.call(TokenSale.address);
    let totalSupply = await instance.totalSupply.call();

    // Always return last expect to close testcase
    return expect(balance).to.be.a.bignumber.equal(totalSupply);
  });

  it("should be possible to buy one token by simply sending ether to the smart contract", async () => {
    let tokenInstance = await Token.deployed();
    let tokenSaleInstance = await TokenSale.deployed();
    let balanceBeforeAccount = await tokenInstance.balanceOf.call(recipient);

    //KYC start
    await expect(
      tokenSaleInstance.sendTransaction({
        from: recipient,
        value: web3.utils.toWei("1", "wei"),
      })
    ).to.be.rejected;
    await expect(balanceBeforeAccount).to.be.bignumber.equal(
      await tokenInstance.balanceOf.call(recipient)
    );

    let kycInstance = await KYCManager.deployed();

    await kycInstance.setKYCCompleted(recipient);
    //KYC end

    await expect(
      tokenSaleInstance.sendTransaction({
        from: recipient,
        value: web3.utils.toWei("1", "wei"),
      })
    ).to.be.fulfilled;

    // Always return last expect to close testcase
    return expect(balanceBeforeAccount + 1).to.be.bignumber.equal(
      await tokenInstance.balanceOf.call(recipient)
    );
  });
});
