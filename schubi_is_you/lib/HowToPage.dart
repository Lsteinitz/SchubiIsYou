import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:schubi_is_you/styles.dart';
import 'package:schubi_is_you/MoveControlButton.dart';

class HowToPage extends StatefulWidget {
  @override
  _HowToPageState createState() => _HowToPageState();
}
class _HowToPageState extends State<HowToPage>
{
  Expanded leaf = Expanded(child:Image.asset('assets/images/blatt.jpeg',fit: BoxFit.fill), flex:1);
  Expanded schubert = Expanded(child:Image.asset('assets/images/schubert.jpeg',fit: BoxFit.fill), flex:1);
  Expanded flower = Expanded(child:Image.asset('assets/images/blume.jpeg',fit: BoxFit.fill), flex:1);
  Expanded water = Expanded(child:Image.asset('assets/images/wasser.jpeg',fit: BoxFit.fill), flex:1);
  Expanded earth = Expanded(child:Image.asset('assets/images/erde.jpeg',fit: BoxFit.fill), flex:1);
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


  Widget build(BuildContext context)
  {
    return Scaffold(
      //appBar: customAppBar("Level 1"),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/how_to.jpeg"),
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomLeft
                )
            ),
            child: Center(
                child: Padding(padding: const EdgeInsets.all(10.0),
                    child: getChildren(context)
                )
            )
        )
    );
  }

  GridView createGridView(List<Expanded> field, int length)
  {
    return GridView.count(
        crossAxisCount: length,
        children: field, physics: NeverScrollableScrollPhysics(),
    );
  }

  GridView getChildren(BuildContext context)
  {
    List<Expanded> items =<Expanded>[ schubert, leaf, water, hedge, flower,];
    List<Expanded> subjects =<Expanded>[ wordSchubert, wordLeaf, wordWater, wordHedge, wordFlower,];
    List<Expanded> words = <Expanded>[ wordIs, wordYou, wordPush, wordStop, wordDead, wordWin];
    List<Expanded> rule1 = <Expanded>[ wordSchubert, wordIs, wordYou];
    List<Expanded> rule2 = <Expanded>[ wordFlower, wordIs, wordWin];
    List<Expanded> rule3 = <Expanded>[ wordLeaf, wordIs, wordPush];

    //if(MediaQuery.of(context).orientation==Orientation.portrait)
    {
      return GridView.count(
        crossAxisCount: 1,
          scrollDirection: Axis. vertical,
          children: [

            customText("Es stehen verschiedene Items zur Verfügung: Erde, Wasser, Schubert, Blatt, Hecke und Blume."),
            Expanded(child: createGridView(items,items.length),),

            customText("Diese können durch Wörter beschrieben werden: "),
            Expanded(child: createGridView(subjects,subjects.length), ),

            customText("Außerdem gibt es noch andere Wörter."),
            Expanded(child: createGridView(words,words.length), ),

            customText("Die Wörter können zu einer Regel zusammengeschoben werden: "),

            customText("Die wichtigste ist folgende: "),
            Expanded(child: createGridView(rule1,rule1.length), ),
            customText("Sie definiert die Spielfigur."),

            customText("Eine andere wichtige Regel wird wiefolgt definiert:"),
            Expanded(child: createGridView(rule2,rule2.length), ),
            customText("Sie definiert das Ende des Spiels. Wenn man den Gegenstand aus der Regel erreicht hat, hat man gewonnen."),

            customText("In dieser Manier werden auch andere Regeln definiert. z.B."),
            Expanded(child: createGridView(rule3,rule3.length), ),
            customText("Diese Regel legt fest, dass man das Blatt verschieben kann."),

            customText("Ein paar Regeln sind zum Levelbeginn festgeschrieben, andere kann man während des Spiels verändern."),
            customText("Viel Spaß beim Ausprobieren!"),

          ]
  //children
      );
    }
    /*else{
      return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ Expanded(child: createGridView(spielplan), flex: 2,),
            Spacer(flex:1),


          ]  //children
      );
    }*/
  }
}



