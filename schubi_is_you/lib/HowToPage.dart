import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:schubi_is_you/styles.dart';
import 'package:schubi_is_you/MoveControl.dart';

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


  Widget build(BuildContext context)
  {
    return Scaffold(
      //appBar: customAppBar("Level 1"),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/grassbackground.jpeg"),
                    fit: BoxFit.cover,
                    alignment: Alignment.topRight
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

  GridView createGridView(List<Expanded> field)
  {
    return GridView.count(
        crossAxisCount: 10,
        children: field
    );
  }

  Widget getChildren(BuildContext context)
  {
    List<Expanded> spielplan =<Expanded>[ earth, water, schubert, leaf, water, earth, flower, water, leaf, schubert,
      water, water, schubert, leaf, water, earth, flower, water, leaf, schubert,
      earth, water, schubert, leaf, water, flower, flower, water, leaf, schubert,
      water, water, schubert, leaf, water, earth, flower, water, leaf, schubert,
      earth, water, schubert, leaf, water, earth, flower, water, leaf, schubert,
      water, water, schubert, leaf, water, earth, flower, water, leaf, schubert,
      earth, water, schubert, leaf, water, earth, flower, water, leaf, schubert,
      water, water, schubert, leaf, water, earth, flower, water, leaf, schubert,
      earth, water, schubert, leaf, water, earth, flower, water, leaf, schubert,
      schubert, water, schubert, leaf, water, earth, flower, water, leaf, schubert,];

    if(MediaQuery.of(context).orientation==Orientation.portrait)
    {
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [ Expanded(child: createGridView(spielplan), flex: 2,),
            Spacer(flex:1),
            MoveControlButton()

          ]  //children
      );
    }
    else{
      return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ Expanded(child: createGridView(spielplan), flex: 2,),
            Spacer(flex:1),
            MoveControlButton(),

          ]  //children
      );
    }
  }
}



