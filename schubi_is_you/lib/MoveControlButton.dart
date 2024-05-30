import 'package:flutter/material.dart';
import 'package:schubi_is_you/GameController.dart';
import 'package:schubi_is_you/Move.dart';

class MoveControlButton extends StatefulWidget {

  MoveControlButton(this.gameController);
  late GameController gameController;
  @override
  State<MoveControlButton> createState() => _MoveControlButtonState(this.gameController);
}

class _MoveControlButtonState extends State<MoveControlButton> {
  _MoveControlButtonState(this.gameController);
  late GameController gameController;
  @override
  Widget build(BuildContext context) {

    IconButton buttonUp = IconButton(
        iconSize: 40 ,
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith((states) => Colors.amber)
        ),
        icon: const Icon(Icons.arrow_circle_up),
        onPressed: () {
          gameController.moveUp;
          setState(() { });
        }
      );

    IconButton buttonLeft =  IconButton(
      alignment: Alignment.centerLeft,
      iconSize: 40 ,
      style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith((states) => Colors.amber)
      ),
      icon: const Icon(Icons.arrow_circle_left_outlined),
      onPressed: () {
        gameController.moveLeft;
        setState(() { });
      },
    );

   IconButton buttonRight= IconButton(
      alignment: Alignment.centerRight,
      iconSize: 40 ,
      style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith((states) => Colors.amber)
      ),
      icon: const Icon(Icons.arrow_circle_right_outlined),
      onPressed: () {
        gameController.moveRight;
        setState(() { });
      },
    );

   IconButton buttonDown= IconButton(
      iconSize: 40 ,
      style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith((states) => Colors.amber)
      ),
      icon: const Icon(Icons.arrow_circle_down),
      onPressed: () {
        gameController.moveDown;
        setState(() {});
      },
    );


      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buttonUp,
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buttonLeft,
                buttonRight
           ]   //children
          ),
          buttonDown
        ],
        );
     }




}
