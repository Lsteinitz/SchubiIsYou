import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:schubi_is_you/styles.dart';
import 'package:schubi_is_you/MoveControl.dart';

class LevelPage extends StatefulWidget {
  @override
  _LevelPageState createState() => _LevelPageState();
}
class _LevelPageState extends State<LevelPage>
{
  Widget build(BuildContext context) {
    Alignment moveControllAlignment =  Alignment.centerLeft;
    MainAxisAlignment mainAxis = MainAxisAlignment.center;

    if(MediaQuery.of(context).orientation==Orientation.portrait){
      moveControllAlignment= Alignment.bottomCenter;
      mainAxis = MainAxisAlignment.end;
    }

    return Scaffold(
      //appBar: customAppBar("Level 1"),
      body:  Container(
       /* decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/grassbackground.jpeg"),
            fit: BoxFit.cover,
            alignment: Alignment.topRight
          )
        ),*/
        child: Center(
          child: Padding(padding: const EdgeInsets.all(10.0),
            child: Column( mainAxisAlignment: mainAxis,
              children: [
                //grid with kids itself
                Container(decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage("assets/images/home.jpeg"),
                  fit: BoxFit.contain,
                  alignment: Alignment.center
                   )//customBoxDecoration("assets/images/schubert.jpeg"),
                )),
                //end of grid
                Container(alignment: moveControllAlignment,
                    child: MoveControlButton()
                )
              ]  //children
            ),
          )
        )
      )
    );}
    }



