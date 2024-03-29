const ItemManager = artifacts.require("./ItemManager.sol");

contract("ItemManager", (accounts) => {
  it("... should let you create new Items.", async () => {
    const itemManagerInstance = await ItemManager.deployed();
    const identifier = "test1";
    const price = 500;

    const result = await itemManagerInstance.createItem(identifier, price, {
      from: accounts[0],
    });
    assert.equal(
      result.logs[0].args._index,
      0,
      "There should be one item index in there"
    );

    const item = await itemManagerInstance.items(0);
    assert.equal(
      item.identifier,
      identifier,
      "The item has a different identifier"
    );
  });
});
