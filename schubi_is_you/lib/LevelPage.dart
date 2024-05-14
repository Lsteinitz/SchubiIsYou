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
  Expanded leaf = Expanded(child:Image.asset('assets/images/blatt.jpeg',fit: BoxFit.fill), flex:1);
  Expanded schubert = Expanded(child:Image.asset('assets/images/schubert.jpeg',fit: BoxFit.fill), flex:1);
  Expanded flower = Expanded(child:Image.asset('assets/images/blume.jpeg',fit: BoxFit.fill), flex:1);
  Expanded water = Expanded(child:Image.asset('assets/images/wasser.jpeg',fit: BoxFit.fill), flex:1);
  Expanded earth = Expanded(child:Image.asset('assets/images/erde.jpeg',fit: BoxFit.fill), flex:1);


  Widget build(BuildContext context) {
    Alignment moveControlAlignment =  Alignment.centerLeft;
    MainAxisAlignment mainAxis = MainAxisAlignment.center;

    if(MediaQuery.of(context).orientation==Orientation.portrait){
      moveControlAlignment= Alignment.bottomCenter;
      mainAxis = MainAxisAlignment.end;
    }

    return Scaffold(
      //appBar: customAppBar("Level 1"),
      body:  Container(
       decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/grassbackground.jpeg"),
            fit: BoxFit.cover,
            alignment: Alignment.topRight
          )
        ),
        child: Center(
          child: Padding(padding: const EdgeInsets.all(10.0),
            child: Column( mainAxisAlignment: mainAxis,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        water, earth,
                        Expanded(child:Image.asset('assets/images/blatt.jpeg',fit: BoxFit.fill), flex:1),
                        Expanded(child:Image.asset('assets/images/schubert.jpeg',fit: BoxFit.fill), flex:1),
                        Expanded(child:Image.asset('assets/images/blume.jpeg',fit: BoxFit.fill), flex:1),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        water, earth,
                        leaf, schubert, earth
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        flower, schubert, water, earth, leaf
                      ],
                    ),
                  ] //children of column
                ),
                //end of grid
                Spacer(flex:1),
                Container(alignment: moveControlAlignment,
                    child: MoveControlButton()
                )
              ]  //children
            ),
          )
        )
      )
    );}
    }



