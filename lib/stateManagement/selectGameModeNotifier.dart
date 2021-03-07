

import 'package:flutter/material.dart';
const int QUICKPLAYBTN = 0;
const int TOURNAMENTBTN = 1;
const int DONKEY = 2;
const int JACKPOT = 3;

class selectGameMode extends ChangeNotifier{
    List<bool> buttonStates = List(4);
    bool selectedAny = false;
    selectGameMode(){
      for (int i = 0; i<buttonStates.length; i++ ){
        buttonStates[i] = false;
      }
    }


    void toggleBtn(int buttonCode){
      buttonStates[buttonCode] = !buttonStates[buttonCode];
      var result = false;
      buttonStates.forEach((element) => result != element);
      selectedAny = result;
      notifyListeners();
    }
}