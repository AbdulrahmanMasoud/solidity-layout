pragma solidity >=0.7.0 <0.9.0;

contract Layout{
    string name = "Abdulrahman"; //String Type
    int number = 1; //Int Type but it has alot of int types like int265 int8 etc... you can use anyone debend your number length to control your coste
    bytes32 nameBt = "Masoud"; //This bytes type the value will be bytes
    bool isTrue = false; //This a boolen type
    address auth = msg.sender; //This type so save data like your walet addres

    //If condetion
    if(name == "Abdulrahman"){
        isTrue = true;
    }else{
        isTrue = false;
    }

    //for loop
    for(int i = 1, i < 10, i++){
        number++
    }


}
