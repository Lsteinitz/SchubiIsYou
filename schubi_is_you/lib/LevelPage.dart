import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:schubi_is_you/styles.dart';
import 'package:schubi_is_you/MoveControlButton.dart';
import 'package:schubi_is_you/GameController.dart';

import 'Level.dart';

class LevelPage extends StatefulWidget {
  @override
  _LevelPageState createState() => _LevelPageState();

}
class _LevelPageState extends State<LevelPage>
{
 late GameController gameController;

 @override
 void initState() {
   super.initState();
   gameController = GameController();
 }

 @override
 void dispose() {
   gameController.viewNotifier.dispose();
   super.dispose();
 }

  Widget build(BuildContext context)
  {
    return Scaffold(
      //appBar: customAppBar("Level 1"),
      body: Container(
       decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/grassbackground.jpeg"),
            fit: BoxFit.cover,
            alignment: Alignment.topRight
          )
        ),
        child:  getChildren(context)
          )

    );

  }

  Widget getChildren(BuildContext context)
  {

  if(MediaQuery.of(context).orientation==Orientation.portrait)
    {
      return Center(
          child: Padding(padding: const EdgeInsets.only(left:10, right: 10, top: 50, bottom: 10),
             child:Expanded(child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [ Expanded(flex: 1,child: gameController.createView(), ),
              MoveControlButton(gameController),

               ]  //children
            )
        )
      )
      );
    }
    else{
      return Center(
        child: Padding(padding:  const EdgeInsets.only(left:20, right: 20, top: 10, bottom: 10),
          child: Expanded( child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ Expanded(flex: 1,child: gameController.createView(), ),
               MoveControlButton(gameController),

            ]  //children
          ),
          )
        )
      );
    }

  }
}



