import 'package:flutter/cupertino.dart';
import 'package:schubi_is_you/Field.dart';

class Rules
{
  late List<Field> game;
  Rules(BuildContext context,  this.game);

  void updateRules(FieldId fieldId, Rule rule)
  {
    for(int i=1; i<160; i++)
    {
      if(game[i].fieldId==fieldId)
      {
        game[i].property=rule;
      }
    }
  }

  void resetRules() //pruefungende
  {
    for(int i=1; i<160; i++)
      {
        game[i].property=Rule.None;
      }
  }

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
            case Rule.LeafPush: updateRules(FieldId.Leaf,newRule);
            case Rule.LeafDead: updateRules(FieldId.Leaf, newRule);
            case Rule.LeafStop: updateRules(FieldId.Leaf, newRule);
            case Rule.LeafWin: updateRules(FieldId.Leaf, newRule);

            case Rule.HedgePush: updateRules(FieldId.Hedge, newRule);
            case Rule.HedgeDead: updateRules(FieldId.Hedge, newRule);
            case Rule.HedgeStop: updateRules(FieldId.Hedge, newRule);
            case Rule.HedgeWin: updateRules(FieldId.Hedge, newRule);

            case Rule.FlowerDead: updateRules(FieldId.Flower, newRule);
            case Rule.FlowerPush: updateRules(FieldId.Flower, newRule);
            case Rule.FlowerStop: updateRules(FieldId.Flower, newRule);
            case Rule.FlowerWin: updateRules(FieldId.Flower, newRule);

            case Rule.WaterDead: updateRules(FieldId.Water, newRule);
            case Rule.WaterPush: updateRules(FieldId.Water, newRule);
            case Rule.WaterStop: updateRules(FieldId.Water, newRule);
            case Rule.WaterWin: updateRules(FieldId.Water, newRule);

            default: ; //keine Regel zusammengestellt für dieses is
          }
        }
      }
    }
  }


}
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