// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract LetterFromA {
    
    event LetterEventA(string _myString);
    
    /**
     * Functions can only be overridden when marked
     * as virtual or contained in an interface
     * 
     * This will also change the bytecode
     * of the function
     */
    function message() public virtual {
        emit LetterEventA("from A");
    }
}


contract LetterFromB {
    
    event LetterEventB(string _myString);

    function message() public virtual {
        emit LetterEventB("from B");
    }
}

/**
 * Override on functions with equal names is
 * done in the specified order:
 * 
 * message in LetterFromB is overridden from message in LetterFromA
 * The last contract has the power
 */
contract LetterFromC is LetterFromB, LetterFromA {
    /** Override must be used in order
     * to manipulate the overload a function
     * 
     * Order of override itself does not change override
     * power from the inherited contracts
     */
    function message() public override(LetterFromA, LetterFromB) {
        emit LetterEventA("from C");
        super.message();
    }
}
