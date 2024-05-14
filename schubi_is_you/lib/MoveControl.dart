import 'package:flutter/material.dart';

class MoveControlButton extends StatefulWidget {
  const MoveControlButton({super.key});

  @override
  State<MoveControlButton> createState() => _MoveControlButtonState();
}

class _MoveControlButtonState extends State<MoveControlButton> {
  @override
  Widget build(BuildContext context) {

    IconButton buttonUp = new IconButton(
        iconSize: 40 ,
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith((states) => Colors.amber)
        ),
        icon: const Icon(Icons.arrow_circle_up),
        onPressed: () {
          moveUp();
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
        moveLeft();
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
        moveRight();
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
        moveDown();
        setState(() {
          //_volume += 10;
        });
      },
    );

    //if phone upwards
    if(MediaQuery.of(context).orientation== Orientation.portrait ){
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          buttonUp,
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttonLeft,
                buttonRight
           ]   //children
          ),
          buttonDown
        ],
        );
      }
      else{
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            buttonLeft,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buttonUp,
                buttonDown
              ]   //children
            ),
            buttonRight
        ],
        );
      }
  }

  void moveUp()
  {
    print("up");
  }

  void moveDown()
  {
    print("down");
  }

  void moveLeft()
  {
    print("left");
  }

  void moveRight()
  {
    print("right");
  }
}
