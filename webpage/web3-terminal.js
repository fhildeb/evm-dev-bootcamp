/** 
 * Initialization:
 * Install npm + node + ganache
 * Create empty directory and navigate into it
 * Open Ganache
 * node inity -y
 * npm install -g truffle
 * npm install --save web3
 * Start scripting in terminal or .js file
 */ 

let Web3 = require("web3");

console.log("");
console.log("Web3 Package:");
console.log(Web3);

let web3http = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
console.log("");
console.log("Web3 HTTP Provider:");
console.log(web3http);

console.log("");
console.log("Wallet Funds in Wei:");
web3http.eth.getBalance("0xfF2ddC6ecbf0D4459aF908ebD4DB10f0A57E594f").then(console.log);

console.log("");
console.log("Wallet Funds in Ether:");
web3http.eth.getBalance("0xfF2ddC6ecbf0D4459aF908ebD4DB10f0A57E594f").then(function(result) { console.log(Web3.utils.fromWei(result, "ether"))});

console.log("");
console.log("Send ether transaction:");
web3http.eth.sendTransaction({
  // Address 1 from Ganache
  from: "0x2Fb2B2bc76207179672AD979aa10c1f95a6124D6",
  // Address 2 from Ganache
  to: "0x797F799B2979b2d81Dc62d82971B0C50d8F93470",
  value: Web3.utils.toWei("2", "ether")});

console.log("");
console.log("Send static transaction to contract:");
web3http.eth.call({
  // Address from Ganache
  from:"0x2Fb2B2bc76207179672AD979aa10c1f95a6124D6",
  // Contract from Remix
  to:"0xCE48EFC8C707C17fa2387522f236f8BA5592ce8b",
  // Input Byte Value from deployment transaction
  data:"0x06540f7e"}).then(console.log);

console.log("");
console.log("Get function hash:");
console.log(Web3.utils.sha3("myUint()"));
console.log("Trimmed down:");
console.log(Web3.utils.sha3("myUint()").substr(0,10));

console.log("");
console.log("Send variable transaction to contract:");
web3http.eth.call({
  // Address from Ganache
  from:"0x2Fb2B2bc76207179672AD979aa10c1f95a6124D6",
  // Contract from Remix
  to:"0xCE48EFC8C707C17fa2387522f236f8BA5592ce8b",
  // Input Byte Value from deployment transaction
  data: Web3.utils.sha3("myUint()").substr(0,10)}).then(console.log);

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
console.log("Show contract:");
console.log(contract);

console.log("");
console.log("Call function from contract:");
contract.methods.myUint().call().then(console.log);

console.log("");
console.log("Send function from contract:");
contract.methods.setUint(50).send({
    // Address of Ganache
    from:"0x2Fb2B2bc76207179672AD979aa10c1f95a6124D6"}).then(console.log);
