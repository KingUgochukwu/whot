import 'package:flutter/material.dart';
const int _LOCALBTN = 0;
const int _ONLINEBTN = 1;
const int _HOWTOPLAYBTN = 2;
class homePageNotifier extends ChangeNotifier{
  int buttonCode;
  bool selectedAny = false;
  int lastPressed;
 List<bool> buttonStates = List<bool>(6);
  homePageNotifier(){
    buttonStates[_LOCALBTN] = false;
    buttonStates[_ONLINEBTN] = false;
    buttonStates[_HOWTOPLAYBTN] = false;
    buttonStates[3] = false;
    buttonStates[4] = false;
    buttonStates[5] = false;
    bool result = false;
    buttonStates.forEach((element) { result |= element;});
    selectedAny = result;
  }


  void tappedButton(int buttonCode){
    lastPressed = buttonCode;
    buttonStates[buttonCode] = !buttonStates[buttonCode];
    bool result = false;
    buttonStates.forEach((element) { result |= element;});
    selectedAny = result;
    notifyListeners();
  }

  void close(){
    selectedAny = false;
    for (var item in buttonStates){
      item = false;
    }
    notifyListeners();
  }
}