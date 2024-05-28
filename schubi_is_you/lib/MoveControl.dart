import 'package:flutter/material.dart';
import 'package:schubi_is_you/Move.dart';

class MoveControlButton extends StatefulWidget {
  const MoveControlButton({super.key});

  @override
  State<MoveControlButton> createState() => _MoveControlButtonState();
}

class _MoveControlButtonState extends State<MoveControlButton> {

  @override
  Widget build(BuildContext context) {
    Move move = new Move(); //Liste des Spielfeldes übergeben

    IconButton buttonUp = new IconButton(
        iconSize: 40 ,
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith((states) => Colors.amber)
        ),
        icon: const Icon(Icons.arrow_circle_up),
        onPressed: () {
          move.moveUp();
          setState(() {
            //_volume += 10;
          });
        }
      );

    IconButton buttonLeft = new IconButton(
      alignment: Alignment.centerLeft,
      iconSize: 40 ,
      style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith((states) => Colors.amber)
      ),
      icon: const Icon(Icons.arrow_circle_left_outlined),
      onPressed: () {
        move.moveLeft();
        setState(() {
          //_volume += 10;
        });
      },
    );

   IconButton buttonRight= new IconButton(
      alignment: Alignment.centerRight,
      iconSize: 40 ,
      style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith((states) => Colors.amber)
      ),
      icon: const Icon(Icons.arrow_circle_right_outlined),
      onPressed: () {
        move.moveRight();
        setState(() {
          //_volume += 10;
        });
      },
    );

   IconButton buttonDown= new IconButton(
      iconSize: 40 ,
      style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith((states) => Colors.amber)
      ),
      icon: const Icon(Icons.arrow_circle_down),
      onPressed: () {
        move.moveDown();
        setState(() {
          //_volume += 10;
        });
      },
    );


      return Container (child: Column(
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
        )
      );
     }




}
