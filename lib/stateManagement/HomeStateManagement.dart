import 'package:flutter/cupertino.dart';

class homePageNotifier extends ChangeNotifier{
  int buttonCode;
  bool selectedAny = false;
  int lastPressed;
 List<bool> buttonStates = List<bool>(6);
  homePageNotifier(){
    buttonStates[0] = false;
    buttonStates[1] = false;
    buttonStates[2] = false;
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