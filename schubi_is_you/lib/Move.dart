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
        print("schubi at ");
        print(i);
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
  void move(int stepsToNextField, int stepsNextNextField, int zahl3, bool isPositiveDirection, int position, bool isNextFieldNotEmpty, Direction direction )
  {
    bool isItemOnBorder;

    Field nextField;
    Field nextNextField;
    Field field3;

    if(isPositiveDirection)
    {

    }
    else
    {
      nextField= game[position-stepsToNextField];
      nextNextField= game[position-stepsNextNextField];
      field3= game[position+zahl3];
    }

    nextField= game[position+stepsToNextField];
    nextNextField= game[position+stepsNextNextField];
    field3= game[position-zahl3];

    if(nextField.property== Property.Win) print("gewonnen");
    if((nextField.property==Property.Stop)||(nextField.fieldId== FieldId.You)||(nextField.fieldId== FieldId.Is2)||(nextField.fieldId == FieldId.WordSchubert)) return;
    if(nextField.property==Property.Dead)
    {
      print("Ups... du bist gestorben, Versuche es einfach nochmal!");
      game[position].fieldId=FieldId.Earth;
      return;
    }

    if ((nextField.property==Property.Push)||(nextField.wordPosition !=0)) //alle Items die geschoben werden können & Wörter
    {
      if((nextNextField.property==Property.Stop)||(nextNextField.property==Property.Push)||(nextNextField.wordPosition != 0)) return; //Schubi kann nicht mehr als eine Sachen auf einmal verschieben & darf nicht in ein Stop-Item hineinschieben

      //Verschieben eines Objektes in ein anderes was "dead" ist -> hineingeschobenes Item wird gelöscht
      if(nextNextField.property== Property.Dead)
      {
        game[position + stepsToNextField] = game[position];
        game[position]= Field(FieldId.Earth);
        return; //keine weiteren Verschiebungen müssen ausgeführt werden
      }
      isItemOnBorder = OnBorder(position, stepsToNextField, direction);
      if((isItemOnBorder)&& (!isNextFieldNotEmpty))
      {
        //Verschieben über Rand verhindern & toteszone ( vermutlich), macht das gleiche wie oben
        if((field3.property==Property.Push)||(field3.property== Property.Stop)||(field3.wordPosition != 0)) return;
        if(field3.property==Property.Dead)
        {
          if(isPositiveDirection)
          {
            game[position + stepsToNextField] = game[position];
            game[position]= Field(FieldId.Earth);
            return; //keine weiteren Verschiebungen müssen ausgeführt werden
          }
          else
          {
            game[position - stepsToNextField] = game[position];
            game[position]= Field(FieldId.Earth);
            return; //keine weiteren Verschiebungen müssen ausgeführt werden
          }
        }
        //Bewegung über Rand
        if(isPositiveDirection)
        {
          game[position - zahl3] = nextField;
          nextField = game[position + stepsToNextField];
          game[position + stepsToNextField] = game[position];
          game[position] = field3;
        }
        else
        {
          game[position + zahl3] = nextField;
          nextField = game[position - stepsToNextField];
          game[position - stepsToNextField] = game[position];
          game[position] = field3;
        }
      }
      else
      {
        //normale Bewegung
        if(isPositiveDirection)
        {
          game[position+stepsToNextField]= game[position];
          game[position]= nextNextField;
          game[position+ stepsNextNextField]= nextField;
        }
        else
        {
          game[position-stepsToNextField]= game[position];
          game[position]= nextNextField;
          game[position-stepsNextNextField]= nextField;
        }
      }
    }
    else //wenn nichts verschoben werden muss
    {
      if(isPositiveDirection)
      {
        game[position+stepsToNextField]= game[position];
        game[position]= nextNextField;
      }
      else
      {
        game[position-stepsToNextField]= game[position];
        game[position]= nextNextField;
      }
    }
  }
  ///prüft, ob sich Spielfigur am Rand befindet
  bool OnBorder(int position, int stepsToNextField, Direction direction)
  {
    switch(direction)
    {
      case Direction.Left: if(((position-stepsToNextField) % playgroundWidth) ==1) return true;
      case Direction.Up: if((position-stepsToNextField)<playgroundBorderUp) return true;
      case Direction.Right:  if(((position+stepsToNextField) % playgroundWidth) ==0) return true;
      case Direction.Down: if((position-stepsToNextField)<playgroundBorderDown) return true;
    }
    return false;
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