import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:schubi_is_you/Field.dart';

class Level
{

  Expanded earth = Expanded(child:Image.asset('assets/images/erde.jpeg',fit: BoxFit.fill), flex:1);
  Expanded leaf = Expanded(child:Image.asset('assets/images/blatt.jpeg',fit: BoxFit.fill), flex:1);
  Expanded schubert = Expanded(child:Image.asset('assets/images/schubert.jpeg',fit: BoxFit.fill), flex:1);
  Expanded flower = Expanded(child:Image.asset('assets/images/blume.jpeg',fit: BoxFit.fill), flex:1);
  Expanded water = Expanded(child:Image.asset('assets/images/wasser.jpeg',fit: BoxFit.fill), flex:1);
  Expanded schubertLinks= Expanded(child:Image.asset('assets/images/schubertlinks.jpeg',fit: BoxFit.fill), flex:1);
  Expanded hedge = Expanded(child:Image.asset('assets/images/hecke.jpeg',fit: BoxFit.fill), flex:1);
  Expanded wordLeaf = Expanded(child:Image.asset('assets/images/word_blatt.jpeg',fit: BoxFit.fill), flex:1);
  Expanded wordFlower = Expanded(child:Image.asset('assets/images/word_blume.jpeg',fit: BoxFit.fill), flex:1);
  Expanded wordDead = Expanded(child:Image.asset('assets/images/word_dead.jpeg',fit: BoxFit.fill), flex:1);
  Expanded wordHedge = Expanded(child:Image.asset('assets/images/word_hecke.jpeg',fit: BoxFit.fill), flex:1);
  Expanded wordIs = Expanded(child:Image.asset('assets/images/word_is.jpeg',fit: BoxFit.fill), flex:1);
  Expanded wordPush = Expanded(child:Image.asset('assets/images/word_push.jpeg',fit: BoxFit.fill), flex:1);
  Expanded wordSchubert = Expanded(child:Image.asset('assets/images/word_schubert.jpeg',fit: BoxFit.fill), flex:1);
  Expanded wordStop = Expanded(child:Image.asset('assets/images/word_stop.jpeg',fit: BoxFit.fill), flex:1);
  Expanded wordWater = Expanded(child:Image.asset('assets/images/word_wasser.jpeg',fit: BoxFit.fill), flex:1);
  Expanded wordWin = Expanded(child:Image.asset('assets/images/word_win.jpeg',fit: BoxFit.fill), flex:1);
  Expanded wordYou = Expanded(child:Image.asset('assets/images/word_you.jpeg',fit: BoxFit.fill), flex:1);


  late List<Field> game = [];
  @override
  Level()
  {
    InitializeList();
  }

  List<Expanded> convertGameToPictures()
  {
    List<Expanded> gamePictures= [];
    for(int i= 1; i<161;i++) //160 -> so viele Felder gibt es
    {
      switch (game[i].fieldId)
      {
        case FieldId.Earth: gamePictures.add(earth);
        case FieldId.Hedge: gamePictures.add(hedge);
        case FieldId.Flower: gamePictures.add(flower);
        case FieldId.Schubert: gamePictures.add(schubert);
        case FieldId.Schubertlinks: gamePictures.add(schubertLinks);
        case FieldId.Leaf: gamePictures.add(leaf);
        case FieldId.Water: gamePictures.add(water);

        case FieldId.Is: gamePictures.add(wordIs);
        case FieldId.Is2: gamePictures.add(wordIs);
        case FieldId.You: gamePictures.add(wordYou);
        case FieldId.Push: gamePictures.add(wordPush);
        case FieldId.Stop: gamePictures.add(wordStop);
        case FieldId.Win: gamePictures.add(wordWin);
        case FieldId.Dead: gamePictures.add(wordDead);

        case FieldId.WordLeaf: gamePictures.add(wordLeaf);
        case FieldId.WordSchubert: gamePictures.add(wordSchubert);
        case FieldId.WordHedge: gamePictures.add(wordHedge);
        case FieldId.WordFlower: gamePictures.add(wordFlower);
        case FieldId.WordWater: gamePictures.add(wordWater);
      }
    }
    return gamePictures;
  }
  void InitializeList() //Levelaufbau; Ziel ist es diesen später je nach Level anzupassen
  {
    List<Field> startgame = [];
    startgame.add(Field(FieldId.Earth)); //damit 0tes Listenelement gefüllt ist
    for(int i=1; i<161;i++) //160 -> so viele Felder gibt es
    {
      startgame.add(Field(FieldId.Earth));
    }
//Regeln
    startgame[24]=Field.word(FieldId.WordWater, 1);
    startgame[25]=Field.word(FieldId.Is,2);
    startgame[26]=Field.word(FieldId.Dead,3);

    startgame[18]=Field.word(FieldId.WordSchubert,1);
    startgame[19]=Field.word(FieldId.Is2,2);
    startgame[20]=Field.word(FieldId.You,3);

    startgame[130]=Field.word(FieldId.Leaf,1);
    startgame[131]=Field.word(FieldId.Is,2);
    startgame[132]=Field.word(FieldId.Push,3);

    startgame[29]=Field.word(FieldId.Hedge,1);
    startgame[30]=Field.word(FieldId.Is,2);
    startgame[31]=Field.word(FieldId.Stop,3);

    startgame[110]=Field.word(FieldId.Flower,1);
    startgame[142]=Field.word(FieldId.Is,2);
    startgame[143]=Field.word(FieldId.Win,3);

 // Items
    startgame[70]=Field(FieldId.Schubert);
    startgame[56]=Field(FieldId.Leaf);
    startgame[72]=Field(FieldId.Leaf);
    startgame[88]=Field(FieldId.Leaf);

    for(int i=38 ;i< 43;i++)
    {
      startgame[i]=Field(FieldId.Hedge);
    }
    for(int i=102 ;i< 107;i++)
    {
      startgame[i]=Field(FieldId.Hedge);
    }
    for(int i=134 ;i< 139;i++)
    {
      startgame[i]=Field(FieldId.Water);
    }

    this.game.insertAll(0, startgame);
  }
}