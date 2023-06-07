/**
 * Creating one instance of chai where all
 * tests can be run within one go
 */

"use strict";
var chai = require("chai");
const expect = chai.expect;

// Connect to chai setup
const BN = web3.utils.BN;
// Import BigNumber from web3.js
const chaiBN = require("chai-bn")(BN);
chai.use(chaiBN);

var chaiAsPromised = require("chai-as-promised");
chai.use(chaiAsPromised);
module.exports = chai;
