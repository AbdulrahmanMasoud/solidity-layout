// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
contract Overloading{

    function sumNumbers(uint _x,uint _y,uint _z) public view returns(uint){
        return _x + _y + _z;
    }

    function sumNumbers(uint _x,uint _y)public view returns (uint){
        return _x + _y;
    }

    function checkWhchOne() public view returns (uint){
        return sumNumbers(5,5); //will use the function debend on parameters
    }

}
