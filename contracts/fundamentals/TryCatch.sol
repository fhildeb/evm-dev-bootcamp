// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract FailureType {
    function requireFailure() public pure {
        require(false, "Custom error string from FailureType");
    }

    function revertFailure() public pure {
        revert("Error from FailureType");
    }

    function assertFailure() public pure {
        assert(false);
    }
}

contract TryCatch {
    FailureType ft;

    event Error(string _reason);
    event LowLevelError(bytes _reason);

    constructor() {
        ft = new FailureType();
    }

    function executeTryCatch() public returns (bool) {
        try ft.requireFailure() {
            return true;
        } catch Error(string memory reason) {
            /**
             * This is executed in case
             * revert was called inside getData
             * and a reason string was provided.
             */
            emit Error(reason);
            return false;
        } catch (bytes memory lowLevelData) {
            /**
             * This is executed in case there
             * was a failing assertion, division
             * by zero, etc. inside getData without
             * reason string provided
             */
            emit LowLevelError(lowLevelData);
            return false;
        }
    }
}
