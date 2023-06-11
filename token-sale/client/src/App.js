import React, { Component } from "react";
import Token from "./contracts/Token.json";
import TokenSale from "./contracts/TokenSale.json";
import KYCManager from "./contracts/KYCManager.json";
import getWeb3 from "./getWeb3";

import "./App.css";

class App extends Component {
  state = {
    loaded: false,
    KYCAddress: "0x123",
    tokenSaleAddress: "",
    userTokenBalance: 0,
  };

  componentDidMount = async () => {
    try {
      // Get network provider and web3 instance.
      this.web3 = await getWeb3();

      // Use web3 to get the user's accounts.
      this.accounts = await this.web3.eth.getAccounts();

      // Get the contract instance.
      //this.networkId = await this.web3.eth.net.getId(); <<- this doesn't work with MetaMask anymore
      this.networkId = await this.web3.eth.getChainId();

      this.tokenInstance = new this.web3.eth.Contract(
        Token.abi,
        Token.networks[this.networkId] && Token.networks[this.networkId].address
      );

      this.tokenSaleInstance = new this.web3.eth.Contract(
        TokenSale.abi,
        TokenSale.networks[this.networkId] &&
          TokenSale.networks[this.networkId].address
      );

      this.kycManagerInstance = await new this.web3.eth.Contract(
        KYCManager.abi,
        KYCManager.networks[this.networkId] &&
          KYCManager.networks[this.networkId].address
      );

      // Set web3, accounts, and contract to the state, and then proceed with an
      // example of interacting with the contract's methods.
      this.listenToTokenTransfer();
      this.setState(
        {
          loaded: true,
          tokenSaleAddress: TokenSale.networks[this.networkId].address,
        },
        this.updateUserTokenBalance
      );
    } catch (error) {
      // Catch any errors for any of the above operations.
      alert(
        `Failed to load web3, accounts, or contract. Check console for details.`
      );
      console.error(error);
    }
  };

  handleInputChange = (event) => {
    const target = event.target;
    const value = target.type === "checkbox" ? target.checked : target.value;
    const name = target.name;

    this.setState({
      [name]: value,
    });
  };

  handleKYCSubmit = async () => {
    const { KYCAddress } = this.state;
    await this.kycManagerInstance.methods
      .setKYCCompleted(KYCAddress)
      .send({ from: this.accounts[0] });
    alert("Account " + KYCAddress + " is now whitelisted");
  };

  handleBuyToken = async () => {
    await this.tokenSaleInstance.methods
      .buyTokens(this.accounts[0])
      .send({ from: this.accounts[0], value: 1 });
  };

  updateUserTokenBalance = async () => {
    let getTokenBalance = await this.tokenInstance.methods
      .balanceOf(this.accounts[0])
      .call();
    this.setState({ userTokenBalance: getTokenBalance });
  };

  listenToTokenTransfer = async () => {
    this.tokenInstance.events
      .Transfer({ to: this.accounts[0] })
      .on("data", this.updateUserTokenBalance);
  };

  render() {
    // Uncomment IF for UI Showcase
    if (!this.state.loaded) {
      return <div>Loading Web3, accounts, and contract...</div>;
    }
    return (
      <div className="App">
        <div className="above"></div>
        <h1>Token Sale</h1>
        <h2>Enable your account</h2>
        <p></p>Address to allow:{" "}<p></p>
        <input
          type="text"
          name="KYCAddress"
          value={this.state.KYCAddress}
          onChange={this.handleInputChange}
        />
        <p></p>
        <button type="button" onClick={this.handleKYCSubmit}>
          Add Address to Whitelist
        </button>
        <p></p>
        <h2>Buy some Tokens</h2>
        <p>Send Ether to this address: {this.state.tokenSaleAddress}</p>
        <p>You have: {this.state.userTokenBalance}</p>
        <button type="button" onClick={this.handleBuyToken}>
          Buy more tokens
        </button>
      </div>
    );
  }
}

export default App;
