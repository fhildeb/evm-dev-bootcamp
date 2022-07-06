# Preparation:
# npm install -g truffle

# Installing a react repository
truffle unbox react

# Create development branch and show accounts
truffle develop

# Migrieren aller Contracts im truffle develop terminal
# Reset is mandatory to redeploy, otherwise contracts are
# not pushed to the network
mirgrate --reset

# Start client
cd client
npm start

# Send Transaction within truffle
# Parameters: item contract address, value, wallet address, gas
web3.eth.sendTransaction({to:"CUSTOM_ADDRESS", value:10, from:accounts[1], gas:300000});

# Testing within truffle
test