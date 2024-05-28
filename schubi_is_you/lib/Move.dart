import 'dart:io';

import 'package:flutter/material.dart';
import 'package:schubi_is_you/Field.dart';
import 'package:schubi_is_you/Rules.dart';

///Kümmert sich um die Bewegung der Spielfigur
class Move
{
  late List<Field> game;
  Move(this.game);

  ///oberer Spielfeldrand = 1 bis 16
  static int playgroundBorderUp =17;
  ///unterer Spielfeldrand von 145 bis 160
  static int playgroundBorderDown =144;
  ///Gesamtzahl Spielfelder
  static int playgroundNumber = 160;
  ///Spielfeldbreite
  static int playgroundWidth =16;
  ///Spielfeldhöhe
  static int playgroundHeight =10;

  ///Sucht Spielfigur Schubi auf dem Spielfeld (in der Liste) und gibt den Listenplatz zurück
  int getSchubiPosition()
  {
    //Schleifenbeginn mit 1 aus historischen Gründen
    int i=1;
    for(i; i<160;i++)
    {
      if((game[i].fieldId== FieldId.Schubert) || (game[i].fieldId == FieldId.Schubertlinks))
      {
        return i;
      }
    }
    return 0; // Fehler-> kein Schubi gefunden //Fehlermeldung erstellen
  }

  void moveUp()
  {
    int schubiPosition = getSchubiPosition();
    game[schubiPosition].fieldId= FieldId.Schubert; //wenn schubert vorher nach links gelaufen ist, wird es jetzt wieder normal angezeigt
    if( schubiPosition < playgroundBorderUp) //wenn am Rand, dann
    {
      move(playgroundNumber-16, playgroundNumber-32,0,true,schubiPosition,true,Direction.Up);
      return;
    }
    move(playgroundWidth,playgroundWidth*2, 128,false,schubiPosition,false,Direction.Up);
  }

  void moveDown()
  {
    int schubiPosition = getSchubiPosition();
    game[schubiPosition].fieldId= FieldId.Schubert; //wenn schubert vorher nach links gelaufen ist, wird es jetzt wieder normal angezeigt
    if( schubiPosition > playgroundBorderDown) //wenn am Rand, dann
    {
      move(playgroundNumber-16, playgroundNumber-32,0,false,schubiPosition,true,Direction.Down);
      return;
    }
    move(playgroundWidth,playgroundWidth*2, 128,true,schubiPosition,false,Direction.Down);
  }

  void moveLeft()
  {
    int schubiPosition = getSchubiPosition();
    game[schubiPosition].fieldId= FieldId.Schubertlinks; //Schubi links wird angezeigt
    int helpRand= schubiPosition % playgroundWidth;

    if( helpRand==1) //wenn am Rand, dann
    {
      move(playgroundWidth-1, playgroundWidth-2,0,true,schubiPosition,true,Direction.Left);
      return;
    }
    move(1,2, 14,false,schubiPosition,false,Direction.Left);
  }

  void moveRight()
  {
    int schubiPosition = getSchubiPosition();
    game[schubiPosition].fieldId= FieldId.Schubert; //wenn schubert vorher nach links gelaufen ist, wird es jetzt wieder normal angezeigt
    int helpRand= schubiPosition % playgroundWidth;

    if( helpRand==0) //wenn am Rand, dann
    {
      move(playgroundWidth-1, playgroundWidth-2,0,false,schubiPosition,true,Direction.Right);
      return;
    }
    move(1,2, 14,true,schubiPosition,false,Direction.Right);

  }
///zahl3 = Anzahl der Felder, die ein geschobenes Objekt vom Ausgangspunkt der Spielfigur in umgekehrte Richtung zurücklegen müsste, um auf neuem Feld zu landen
  ///zahl6 = ist neues Feld leer (0) oder ist Objekt vorhanden (1, true)
  void move(int stepsToNextField, int stepsPushedItem, int zahl3, bool isPositiveDirection, int position, bool isNextFieldNotEmpty, Direction direction )
  {
    bool isItemOnBorder = false;
    Property property1;
    Property property2;
    Property property3;

    FieldId fieldId1;
    FieldId fieldId2;
    FieldId fieldId3;

    int wordPosition;

    if(isPositiveDirection)
    {
      property1= game[position+stepsToNextField].property;
      property2 = game[position+stepsPushedItem].property;
      property3 = game[position-zahl3].property;

      fieldId1= game[position+stepsToNextField].fieldId;
      fieldId2= game[position+stepsPushedItem].fieldId;
      fieldId3= game[position-zahl3].fieldId;

      wordPosition = game[position+ stepsToNextField].wordPosition;

      if(property1== Property.Win) print("gewonnen");
      if((property1==Property.Stop)||(fieldId1== FieldId.You)||(fieldId1== FieldId.Is2)||(fieldId1 == FieldId.WordSchubert)) return;
      if(property1==Property.Dead)
        {
          print("Ups... du bist gestorben, Versuche es einfach nochmal!");
          game[position].fieldId=FieldId.Earth;
          //Zeichnen aufrufen / restart
          return;
        }


    }
  }

}

enum Direction
{
  Left(0),
  Up(1),
  Right(2),
  Down(4);

  final   int directionValue;
  const Direction(this.directionValue);
}