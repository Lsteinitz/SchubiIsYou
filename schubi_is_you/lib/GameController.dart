import 'package:flutter/cupertino.dart';
import 'package:schubi_is_you/Level.dart';
import 'package:schubi_is_you/Move.dart';

import 'Field.dart';

class GameController
{
  GameController()
  {

  }
  late Level level = Level();
  late Move initialMove = getMove() ;
  late ValueNotifier<List<Field>> viewNotifier = ValueNotifier<List<Field>>(level.game);

  Move getMove()
  {
    level.InitializeList();
    return Move(level.game);
  }

 /*late GridView gamePlan = createGridView();

 GridView createGridView() {
    return GridView.count(
        crossAxisCount: 16,
        children: this.gamePictures
    );
  }*/



    ListView createView()
      {
        return ListView(children: [Column(
        mainAxisSize: MainAxisSize.min,
          children: [
                Row(children: this.gamePictures.getRange(1, 16).toList(),),
                Row(children: this.gamePictures.getRange(17, 32).toList(),),
                Row(children: this.gamePictures.getRange(33, 48).toList(),),
                Row(children: this.gamePictures.getRange(49, 64).toList(),),
                Row(children: this.gamePictures.getRange(65, 80).toList(),),
                Row(children: this.gamePictures.getRange(81, 96).toList(),),
                Row(children: this.gamePictures.getRange(97, 112).toList(),),
                Row(children: this.gamePictures.getRange(113, 128).toList(),),
                Row(children: this.gamePictures.getRange(129, 144).toList(),),
                Row(children: this.gamePictures.getRange(145, 160).toList(),),
              ],
            )
        ],
        );

  }
 late List<Expanded> gamePictures= level.convertGameToPictures();

 void moveUp()
 {
   initialMove.moveUp();
   viewNotifier.value= initialMove.game;
 }
 void moveDown(){initialMove.moveDown();viewNotifier.value= initialMove.game;}
 void moveLeft(){initialMove.moveLeft();viewNotifier.value= initialMove.game;}
 void moveRight(){initialMove.moveRight();viewNotifier.value= initialMove.game;}
}