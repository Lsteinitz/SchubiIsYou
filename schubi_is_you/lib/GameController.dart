import 'package:flutter/cupertino.dart';
import 'package:schubi_is_you/Level.dart';
import 'package:schubi_is_you/Move.dart';
import 'package:schubi_is_you/Rules.dart';

import 'Field.dart';

class GameController
{
  GameController()
  {

  }
  late Level level = Level();
  late Move initialMove = getMove() ;
  late Rules rules = getRules();
  late ValueNotifier<List<Field>> viewNotifier = ValueNotifier<List<Field>>(level.game);

  Move getMove()
  {
    level.InitializeList();
    return Move(level.game);
  }

  Rules getRules()
  {
    level.InitializeList();
    return Rules(level.game);
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
   rules.checkRules();
   initialMove.moveUp();
   rules.resetRules();
   viewNotifier.value= initialMove.game;
 }
 void moveDown(){
   rules.checkRules();
   initialMove.moveDown();
   rules.resetRules();
   viewNotifier.value= initialMove.game;
 }
 void moveLeft(){
   rules.checkRules();
   initialMove.moveLeft();
   rules.resetRules();
   viewNotifier.value= initialMove.game;
 }
 void moveRight(){
   rules.checkRules();
   initialMove.moveRight();
   rules.resetRules();
   viewNotifier.value= initialMove.game;
 }
}