import 'package:WHOT/constants/CustomTextStyles.dart';
import 'package:WHOT/constants/pageDimensionsAndColor.dart';
import 'package:WHOT/stateManagement/HomeStateManagement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}



class _homePageState extends State<homePage> {
pageCalculations pageSpecs;
homePageNotifier _homePageNotifier_;
  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    _homePageNotifier_ = homePageNotifier();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    pageSpecs = pageCalculations(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider.value(
      value: _homePageNotifier_,
      child: Scaffold(
        backgroundColor: Color(0xFF000000),
        body: SafeArea(
          child: Center(
            child: Container(
              width: SUPERBORDER * screenWidth,
              height: SUPERBORDER * screenHeight,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.07),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Stack(
                children: [
                  Consumer<homePageNotifier>(
                    builder: (context, homePageSM, child){
                      return AnimatedOpacity(
                        opacity: homePageSM.selectedAny ? 0: 1,
                        duration: Duration(milliseconds: 200),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("WELCOME TO WHOT", style: CTS().HomeBanner,),
                            SizedBox(
                              height: pageSpecs.HPButtonHeight,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildButtons("LOCAL", _homePageNotifier_,  height: pageSpecs.HPButtonHeight ?? 200, width: pageSpecs.HPButtonWidth ?? 80, buttonCode: 0),
                                SizedBox(width: 2,),
                                _buildButtons("ONLINE", _homePageNotifier_,  height: pageSpecs.HPButtonHeight ?? 200, width: pageSpecs.HPButtonWidth ?? 80, buttonCode: 1)
                              ],
                            ),
                            SizedBox(height: 2,),
                            _buildButtons("HOW TO PLAY", _homePageNotifier_,  height: pageSpecs.HPButtonHeight ?? 200, width: pageSpecs.HPButtonWidth ?? 80, buttonCode: 2),
                            SizedBox(
                              height: 2 * pageSpecs.HPButtonHeight,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    width: pageSpecs.settingsIcons,
                                    height: pageSpecs.settingsIcons,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(pageSpecs.settingsIcons),
                                        color: Colors.white.withOpacity(0.2)
                                    )),
                                SizedBox(
                                    width: pageSpecs.getWidthPad(0.01)
                                ),
                                Container(
                                  width: pageSpecs.settingsIcons,
                                  height: pageSpecs.settingsIcons,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(pageSpecs.settingsIcons),
                                      color: Colors.white.withOpacity(0.2)
                                  ),
                                  child: Icon(
                                    Icons.settings,
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                ),
                                SizedBox(
                                    width: pageSpecs.getWidthPad(0.01)
                                ),
                                Container(
                                    width: pageSpecs.settingsIcons,
                                    height: pageSpecs.settingsIcons,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(pageSpecs.settingsIcons),
                                        color: Colors.white.withOpacity(0.2)
                                    )),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  Consumer<homePageNotifier>(
                    builder: (context, homePageSM, child){
                      return Visibility(child: GestureDetector(
                        onTap: (){
                          homePageSM.close();
                        },
                        child: Container(
                          width: pageSpecs.superwidth,
                          height: pageSpecs.superheight,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.07),
                              borderRadius: BorderRadius.circular(8)
                          ),
                        ),
                      ), visible: homePageSM.selectedAny

                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtons(String title, homePageNotifier notifier,  {Function action, double height, double width, int buttonCode}){
    return GestureDetector(
      onTap: action ?? (){
        notifier.tappedButton(buttonCode);
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), 
          color: Colors.white.withOpacity(0.20),
        ),
        child: Center(child: Text(title, style: CTS().HomeBanner,)),
      ),
    ) ;
  }
}
