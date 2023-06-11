import React, { Component } from "react";
import ItemManager from "./contracts/ItemManager.json";
import Item from "./contracts/Item.json";
import getWeb3 from "./getWeb3";
import "./App.css";

class App extends Component {
  state = { cost: 10, itemName: "Apple", loaded: false };

  componentDidMount = async () => {
    try {
      // Get network provider and web3 instance.
      this.web3 = await getWeb3();

      // Use web3 to get the user's accounts.
      this.accounts = await this.web3.eth.getAccounts();

      // Get the contract instance.
      const networkId = await this.web3.eth.net.getId();

      this.itemManager = new this.web3.eth.Contract(
        ItemManager.abi,
        ItemManager.networks[networkId] &&
          ItemManager.networks[networkId].address
      );
      this.item = new this.web3.eth.Contract(
        Item.abi,
        Item.networks[networkId] && Item.networks[networkId].address
      );

      this.listenToPaymentEvent();
      this.setState({ loaded: true });
    } catch (error) {
      // Catch any errors for any of the above operations.
      alert(
        `Failed to load web3, accounts, or contract. Check console for details.`
      );
      console.error(error);
    }
  };

  handleSubmit = async () => {
    const { cost, itemName } = this.state;
    console.log(itemName, cost, this.itemManager);
    let result = await this.itemManager.methods
      .createItem(itemName, cost)
      .send({ from: this.accounts[0] });
    console.log(result);
    alert(
      "Send " +
        cost +
        " wei to " +
        result.events.ItemStatusChanged.returnValues._address
    );
  };

  listenToPaymentEvent = () => {
    let self = this;
    this.itemManager.events
      .ItemStatusChanged()
      .on("data", async function (event) {
        if (event.returnValues._status == 1) {
          let item = await self.itemManager.methods
            .items(event.returnValues._index)
            .call();
          console.log(item);
          alert("Item " + item.identifier + " was paid, deliver it now!");
        }
        console.log(event);
      });
  };

  handleInputChange = (event) => {
    const target = event.target;
    const value = target.type === "checkbox" ? target.checked : target.value;
    const name = target.name;

    this.setState({
      [name]: value,
    });
  };

  render() {
    // Uncomment IF for UI Showcase
    if (!this.state.loaded) {
      return <div>Loading Web3, accounts, and contract...</div>;
    }
    return (
      <div className="App">
        <div className="above"></div>
        <h1>Supply Chain Channel</h1>
        <h2>Items</h2>
        <h2>Add Element</h2>
        <div>
        Item Costs:{" "}
        <input
          type="text"
          name="cost"
          value={this.state.cost}
          onChange={this.handleInputChange}
        />
        </div>
        <div>
        Item Name:{" "}
        <input
          type="text"
          name="itemName"
          value={this.state.itemName}
          onChange={this.handleInputChange}
        />
        </div>
        <button type="button" onClick={this.handleSubmit}>
          Create new Item
        </button>
      </div>
    );
  }
}

export default App;
