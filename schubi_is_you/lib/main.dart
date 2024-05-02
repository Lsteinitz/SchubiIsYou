//import 'dart:html';
//import 'dart:js';

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
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.amber),
        home: Scaffold(
            appBar: customAppBar("Startseite"),
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/home.jpg")
                  )
              ),
            child:Center(
              child: Padding(padding: const EdgeInsets.all(8.0),
                child: Column(
                    children: [
                      Spacer( flex:3),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => LevelPage()));
                        },
                        child: Text("Level starten", style: TextStyle(fontSize:20 )),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith((states) => Colors.amber)
                          )
                      ),
                      Spacer(flex:1),
                      ElevatedButton(
                          onPressed:() {
                          Navigator.push(context,
                           MaterialPageRoute(builder: (context) => HowToPage()));
                          },
                          child: Text( "Wie wird gespielt?", style: TextStyle(fontSize:20 )),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith((states) => Colors.amber)
                          )
                      ),
                      Spacer(flex:1),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => CreditPage()));
                        },
                        child: Text("Mitwirkende", style: TextStyle(fontSize:20 ),),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith((states) => Colors.amber)
                          )
                          ),
                      Spacer(flex:3)
                    ]
                )
              )
            )
            )
    )
    );
  }
}


