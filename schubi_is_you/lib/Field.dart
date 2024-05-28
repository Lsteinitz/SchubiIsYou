import 'dart:ffi';
import 'dart:ui';
import 'package:schubi_is_you/Rules.dart';

class Field
{
    //Koordinaten an dem Bild gezeichnet werden muss
    //int XCoordinate;
    // int yCoordinate;
  ///Feldnummer, wichtig für Identifizierung des Feldes für Regeln & Bildzeichnung
  //final int fieldNumber; //feld = Zahlzuordnung des Feldes (siehe Tabelle)
  //final StringAttribute name;
  final FieldId fieldId;
  int wordPosition = 0;  //posi = Position an der Wort stehen muss
  late Rule property ; //s= Eigenschaft des Feldes

  //push war 3
  //win war 4
  //stop war 5
  //dead war 2

  Field (this.fieldId); //Erstellt Feld mit Feldnummer
  Field.word(this.fieldId, this.wordPosition);

}

enum FieldId
{
  //zahlenwerte sind historisch bedingt
  Earth(1),
  Hedge(2),
  Flower(3),
  Schubert(4),
  Leaf(5),

  Is(6),
  Is2(16), //Schubis is ->darf nicht verschiben werden, deshalb anderer Wert als normales is

  You(7),
  Push(8),
  Stop(13),
  Win(14),
  Dead(17),

  Water(18),

  WordLeaf(90),
  WordSchubert(100),
  WordHedge(110),
  WordBlume(120),
  WordWater(130)

  ;
  final int fieldNumber;
  const FieldId(this.fieldNumber);
  static FieldId? fromInt( int fieldNumber)
  {
    for(FieldId field in FieldId.values)
    {
      if (field.fieldNumber == fieldNumber)
      {
        return field;
      }
    }
  }
}