// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract EgBank{

    //ده متغير من نوع ادرس عشان احفظ فيه صاحب العقد ده
    address public minter;

    //دي ماب عشان احفظ فيها الاكونتات اللي عندي
    mapping(address=>uint)public accounts;

    //ده ابرور بياخد براميتر عشان اعرضه ليه وطبعا بستخدمه في المكان اللي بعمل فلديشن  فيه
    error noBalance(uint amountRequested,uint amountAvaliabl);

    //الايفنت  ده هعمله عشان استخدمه اما التحويل يتم
    event SentSuccefult(address from,address account,uint amount);
    //الكونستراكتور ده عشان اول اما يشغل العقد يجيب التوكن بتاع صاحب العقد ويحفظه في المتغير
    constructor(){
        minter = msg.sender;
    }

    // الداله دي هي اللي بتبعت فلوس انا بحددلها الاكونت و الفلوس اللي عايز ابعتها  وبعدين اقدر ازود الحساب ده بالفلوس اللي بعتها
    //طبعا دي للادمن بس او لصاحب العقد بس
    function mint(address account, uint amount)public{
        require(msg.sender == minter); //طبعا دي عشان اتأكد ان اللي هيبعت هو صاحب العقد

        //هنا بقا انا بزود الحساب اللي انا ببعتله ده بالفلوس اللي بعتها
        accounts[account] +=amount;
    }

    //دي بقا داله اي حد من الاكونتات اللي موجوده يقدر يبعت لاكونت تاني عندي
    function send(address account,uint amount)public{
        //هنا لازم اتأكد ان الحساب فيه رصيد اكبر من اللي هيبعته
        if(amount > accounts[msg.sender])
        //هنا قولتله لو اللي هتبعته اكبر من اللي موجود ف الحساب ارجع متكملش ف انا استخدمت ريفرت عشان اقدر اعرضله رساله خطأ
        //طبعا ال noBalance دي بتاخد اوبجكت وبيها البراميتر بتاعتها
        revert noBalance({
            amountRequested:amount,
            amountAvaliabl:accounts[msg.sender]
        });

        //خلاص بقا اتأكدت ان كل حاجه تمام  اروح احول بقا الرصيد للحساب
        //اول حاجه هنقص الفلوس من اللي بيبعت وبعدين ازودهم للي بيتبعتله
        accounts[msg.sender] -= amount;
        accounts[account] += amount;

        //هنا بقا هستقبل الايفنت عشان اعرفه ان التحويل تم بنجاح
        emit SentSuccefult(msg.sender,account,amount);
    }

}
