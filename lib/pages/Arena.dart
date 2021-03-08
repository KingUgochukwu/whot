import 'package:WHOT/constants/pageDimensionsAndColor.dart';
import 'package:flutter/material.dart';

class cardArena extends StatefulWidget {
  String gameMode;
  cardArena(this.gameMode);
  @override
  _cardArenaState createState() => _cardArenaState();
}

class _cardArenaState extends State<cardArena> {
  pageCalculations pageSpecs;
  @override
  Widget build(BuildContext context) {
    pageSpecs = pageCalculations(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      body: SafeArea(
        child: Center(
          child: Container(
            height: pageSpecs.superheight,
            width: pageSpecs.superwidth,
            decoration: BoxDecoration(
              color: Colors.redAccent,
            ),
          ),
        ),
      ),
    );
  }
}
