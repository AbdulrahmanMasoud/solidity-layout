// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
contract HashSecurity{

//Hasing Data
    function hashInput(string memory input)public view returns(bytes32){
        //The most use to hash data in solidity (keccak256,sha256)

        // return keccak256(bytes(input));
        return sha256(bytes(input));
    }

}
