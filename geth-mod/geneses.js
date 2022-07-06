/**
 *  chainId: 15
 *      Identifier of the network
 *      (1) Mainnet PoW (3) Ropsten PoW
 *      (4) Rinkeby PoA (5) Görli PoA)
 * 
 *  homesteadBlock: 0
 *  byzantiumBlock: 0
 *  constantinopleBlock: 0
 *  petersburgBlock: 0
 *      Ethereum was split in certain releases. The
 *      first one was frontier, now the release is 
 *      called petersburg. The lines enable all those
 *      releases from the given blocknumber onwards.
 * 
 *  eip150Block: 0
 *  eip155Block: 0
 *  eip158Block: 0
 *      Ethereum Improvement Proposals are improvements
 *      on the protocol itself. The lines enable all those
 *      releases from the given blocknumber onwards.
 * 
 *  ethash: {}
 *      Ethash is a updated heavyweight PoW algorithm 
 *      used by Mining EVM blockchains
 * 
 *  difficulty: 0x20000
 *      Important for PoW blockchains, the lower this 
 *      value is set, the faster transactions will 
 *      be executed
 * 
 *  gasLimit: 0x8000000
 *      Nessesarry for smart contract execution and
 *      limits the amount of computation that can be
 *      done on a miner with one transaction.
 *
 *  "alloc": {} 
 *      Preallocating Ether to certain accounts on
 *      creation.
    }
 */