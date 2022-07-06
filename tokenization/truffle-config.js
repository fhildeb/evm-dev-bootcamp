const path = require("path");
require('dotenv').config({path: './.env'});
const HDWalletProvider = require("@truffle/hdwallet-provider");
const MetaMaskAccountIndex = 0;

module.exports = {
  /**
   * See <http://truffleframework.com/docs/advanced/configuration>
   * to customize your Truffle configuration!
   * 
   * develop port might be 8545 or 7545
   * network_id might be 5777 or 1337
   */
  contracts_build_directory: path.join(__dirname, "client/src/contracts"),
  networks: {
    develop: {
      port: 8545,
      network_id: "5777",
      host: "127.0.0.1"
    },
    ganache_local: {
      // Defining a new provider for MetaMask
      provider: function() {
          return new HDWalletProvider(process.env.MNEMONIC, "http://127.0.0.1:8545", MetaMaskAccountIndex )
      },
      network_id: 5777
    },
    kovan_infura: {
        // Defining a new provider for MetaMask
        provider: function() {
            return new HDWalletProvider(process.env.MNEMONIC, "https://kovan.infura.io/v3/3c3ac01072324311983429cc8fc261cd", MetaMaskAccountIndex )
        },
        network_id: 42
    }
  },
  compilers: {    
    solc: {
    version: "^0.8.7"
    }
}
};
