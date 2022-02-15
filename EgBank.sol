// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract EgBank{

    //ده متغير من نوع ادرس عشان احفظ فيه صاحب العقد ده
    address public minter;

    //دي ماب عشان احفظ فيها الاكونتات اللي عندي
    mapping(address=>uint)public accounts;

    //الكونستراكتور ده عشان اول اما يشغل العقد يجيب التوكن بتاع صاحب العقد ويحفظه في المتغير
    constructor(){
        minter = msg.sender;
    }

    // الداله دي هي اللي بتبعت فلوس انا بحددلها الاكونت و الفلوس اللي عايز ابعتها  وبعدين اقدر ازود الحساب ده بالفلوس اللي بعتها
    function mint(address account, uint amount)public{
        require(msg.sender == minter); //طبعا دي عشان اتأكد ان اللي هيبعت هو صاحب العقد

        //هنا بقا انا بزود الحساب اللي انا ببعتله ده بالفلوس اللي بعتها
        accounts[account] +=amount;
    }

}
