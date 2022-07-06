Web3;
let web3http = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
console.log("");
console.log("Web3 HTTP Provider:");
console.log(web3http);

console.log("");
console.log("Web3 HTTP Accounts:");
web3http.eth.getAccounts().then(console.log);

console.log("");
console.log("Create contract:");
let contract = new web3http.eth.Contract(
	// Contract ABI
	[
		{
			"inputs": [],
			"name": "myUint",
			"outputs": [
				{
					"internalType": "uint256",
					"name": "",
					"type": "uint256"
				}
			],
			"stateMutability": "view",
			"type": "function"
		},
		{
			"inputs": [
				{
					"internalType": "uint256",
					"name": "_myUint",
					"type": "uint256"
				}
			],
			"name": "setUint",
			"outputs": [],
			"stateMutability": "nonpayable",
			"type": "function"
		}
	],
  // Contract address
  "0xCE48EFC8C707C17fa2387522f236f8BA5592ce8b");

console.log("");
console.log("Call function from contract:");
contract.methods.myUint().call().then(console.log);

console.log("");
console.log("Call function from contract as string:");
contract.methods.myUint().call().then(result => console.log(result.toString()));

console.log("");
console.log("Send function from contract:");
contract.methods.setUint(90).send({
    // Address of Ganache
    from:"0x2Fb2B2bc76207179672AD979aa10c1f95a6124D6"}).then(console.log);