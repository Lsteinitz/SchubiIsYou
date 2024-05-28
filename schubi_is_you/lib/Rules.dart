import 'package:flutter/cupertino.dart';
import 'package:schubi_is_you/Field.dart';

///Managed die Regeln, die auf die verschiedenen Felder zutreffen
class Rules
{
  late List<Field> game;
  Rules(this.game);

  ///wendet die Regeln für die jeweiligen Spielfelder an
  void updateRules(FieldId fieldId, Property property)
  {
    for(int i=1; i<160; i++)
    {
      if(game[i].fieldId==fieldId)
      {
        game[i].property=property;
      }
    }
  }

  ///setzt die Regeln für Spielfelder zurück
  void resetRules() //pruefungende
  {
    for(int i=1; i<160; i++)
      {
        game[i].property=Property.None;
      }
  }

  ///prüft, ob neue Regel erstellt wurde
  void checkRules() //pruefung
  {
    Rule newRule; //RegelNumber ehemals x
    for (int i = 1; i<160; i++)
    {
      if(game[i].wordPosition == 2)
      {
        if((game[i-1].wordPosition == 1) && (game[i+1].wordPosition == 3))
        {
          newRule = Rule.fromInt(game[i-1].fieldId.fieldNumber + game[i+1].fieldId.fieldNumber); // Feldnummern werden addiert; Wert legt Regel fest
          switch (newRule)
          {
            case Rule.LeafPush: updateRules(FieldId.Leaf,Property.Push);
            case Rule.LeafDead: updateRules(FieldId.Leaf, Property.Dead);
            case Rule.LeafStop: updateRules(FieldId.Leaf, Property.Stop);
            case Rule.LeafWin: updateRules(FieldId.Leaf, Property.Win);

            case Rule.HedgePush: updateRules(FieldId.Hedge, Property.Push);
            case Rule.HedgeDead: updateRules(FieldId.Hedge, Property.Dead);
            case Rule.HedgeStop: updateRules(FieldId.Hedge, Property.Stop);
            case Rule.HedgeWin: updateRules(FieldId.Hedge, Property.Win);

            case Rule.FlowerDead: updateRules(FieldId.Flower, Property.Dead);
            case Rule.FlowerPush: updateRules(FieldId.Flower, Property.Push);
            case Rule.FlowerStop: updateRules(FieldId.Flower, Property.Stop);
            case Rule.FlowerWin: updateRules(FieldId.Flower, Property.Win);

            case Rule.WaterDead: updateRules(FieldId.Water, Property.Dead);
            case Rule.WaterPush: updateRules(FieldId.Water, Property.Push);
            case Rule.WaterStop: updateRules(FieldId.Water, Property.Stop);
            case Rule.WaterWin: updateRules(FieldId.Water, Property.Win);

            default: ; //keine Regel zusammengestellt für dieses is
          }
        }
      }
    }
  }


}
///definiert mögliche Regeln und deren numerische Werte
enum Rule{
  None(0),
  //zahlenwerte sind historisch bedingt -> bestimmte Zahl steht für bestimmte Regel
  LeafPush(98),
  HedgePush(118),
  FlowerPush(128),
  WaterPush(138),

  LeafWin(104),
  HedgeWin(124),
  FlowerWin(134),
  WaterWin(144),

  LeafStop(103),
  HedgeStop(123),
  FlowerStop(133),
  WaterStop(143),

  LeafDead(107),
  HedgeDead(127),
  FlowerDead(137),
  WaterDead(147),
;
  final int ruleNumber;
  const Rule(this.ruleNumber);

  static Rule fromInt( int ruleValue)
  {
    for(Rule rule in Rule.values)
    {
      if (rule.ruleNumber == ruleValue)
      {
        return rule;
      }
    }
    return None;
  }
}