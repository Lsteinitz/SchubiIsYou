

import 'package:flutter/material.dart';
import 'package:schubi_is_you/LevelPage.dart';
import 'package:schubi_is_you/HowToPage.dart';
import 'package:schubi_is_you/CreditPage.dart';
import 'package:schubi_is_you/styles.dart';


void main() {
  runApp(StartApp());
}
class StartApp extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return MaterialApp(home:StartPage());
  }
}


class StartPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    Alignment childAlignment= Alignment.center;
    Padding childPadding = new Padding(padding: EdgeInsets.all(8.0));
    Spacer topSpacer = new Spacer(flex: 5);
    Spacer bottomSpacer = new Spacer(flex: 1);
    Spacer spacerBetween = new Spacer();

    if(MediaQuery.of(context).orientation==Orientation.landscape) {
      childAlignment = Alignment.centerLeft;
      childPadding = new Padding(padding: EdgeInsets.only(left: 100.0));
      topSpacer= new Spacer(flex:3);
      bottomSpacer = new Spacer(flex:3);
    }
      return MaterialApp(
          theme: ThemeData(primaryColor: Colors.amber),
          home: Scaffold(
            // appBar: customAppBar("Startseite"),
              body: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/home.jpeg"),
                          fit: BoxFit.cover,
                          alignment: Alignment.topRight
                      )
                  ),
                  child: Container(
                    alignment: childAlignment,
                      child: Padding(padding: childPadding.padding,
                          child: Column(
                              children: [
                                topSpacer,
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (
                                              context) => LevelPage()));
                                    },
                                    child: Text("Spielen",
                                        style: TextStyle(fontSize: 20)),
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStateColor
                                            .resolveWith((states) =>
                                        Colors.amber)
                                    )
                                ),
                                spacerBetween,
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (
                                              context) => HowToPage()));
                                    },
                                    child: Text("Wie wird gespielt?",
                                        style: TextStyle(fontSize: 20)),
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStateColor
                                            .resolveWith((states) =>
                                        Colors.amber)
                                    )
                                ),
                                spacerBetween,
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (
                                              context) => CreditPage()));
                                    },
                                    child: const Text("Mitwirkende",
                                      style: TextStyle(fontSize: 20),),
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStateColor
                                            .resolveWith((states) =>
                                        Colors.amber)
                                    )
                                ),
                                bottomSpacer
                              ]
                          )
                      )
                  )
              )
          )
      );
  }
}


