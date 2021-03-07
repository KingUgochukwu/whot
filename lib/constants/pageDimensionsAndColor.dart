import 'package:flutter/material.dart';
const double SUPERBORDER = 0.95;

class pageCalculations{
  double screenHeight;
  double screenWidth;
  double HPButtonHeight;
  double HPButtonWidth;
  double settingsIcons;
  double superwidth;
  double superheight;
  pageCalculations(this.screenWidth, this.screenHeight){
    superheight = SUPERBORDER * screenHeight;
    superwidth = SUPERBORDER * screenWidth;
    HPButtonWidth = 0.24 * SUPERBORDER * screenWidth;
    HPButtonHeight = 0.15 * SUPERBORDER * screenHeight;
    settingsIcons = 0.1 * SUPERBORDER * screenHeight;

  }

  double getWidthPad(double ratio){
    return ratio * superwidth;
  }

  double getHeightPad(double ratio){
    return ratio * superheight;
  }
}