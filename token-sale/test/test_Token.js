const Token = artifacts.require("Token");

// Chai setup
const chai = require("./setup_chai.js");
const BN = web3.utils.BN;
const expect = chai.expect;

require("dotenv").config({ path: "../.env" });
// console.log(process.env);

contract("Token Test", function (accounts) {
  const [initialHolder, recipient, anotherAccount] = accounts;

  // Hook that is called every time before a function (test)
  beforeEach(async () => {
    this.Token = await Token.new(process.env.INITIAL_TOKENS);
  });

  // Test total supply
  it("All tokens should be in my account", async () => {
    let instance = this.Token;
    let totalSupply = await instance.totalSupply();

    // Return last expect for other tests
    return await expect(
      instance.balanceOf(initialHolder)
    ).to.eventually.be.a.bignumber.equal(totalSupply);
  });

  // Test transactions
  it("I can send tokens from Account 1 to Account 2", async () => {
    const sendTokens = 1;

    let instance = this.Token;
    let totalSupply = await instance.totalSupply();

    await expect(
      instance.balanceOf(initialHolder)
    ).to.eventually.be.a.bignumber.equal(totalSupply);
    await expect(instance.transfer(recipient, sendTokens)).to.eventually.be
      .fulfilled;
    await expect(
      instance.balanceOf(initialHolder)
    ).to.eventually.be.a.bignumber.equal(totalSupply.sub(new BN(sendTokens)));

    // Return last expect for other tests
    return await expect(
      instance.balanceOf(recipient)
    ).to.eventually.be.a.bignumber.equal(new BN(sendTokens));
  });

  // Test spending more tokens than available
  it("It's not possible to send more tokens than account 1 has", async () => {
    let instance = this.Token;
    let balanceOfAccount = await instance.balanceOf(initialHolder);

    await expect(instance.transfer(recipient, new BN(balanceOfAccount + 1))).to
      .eventually.be.rejected;

    /**
     * check if the balance is still the same
     * Return last expect for other tests
     */
    return await expect(
      instance.balanceOf(initialHolder)
    ).to.eventually.be.a.bignumber.equal(balanceOfAccount);
  });
});
