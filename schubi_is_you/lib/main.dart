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
    if(MediaQuery.of(context).orientation==Orientation.portrait) {
      return MaterialApp(
          theme: ThemeData(primaryColor: Colors.amber),
          home: Scaffold(
            // appBar: customAppBar("Startseite"),
              body: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/home.jpeg"),
                          fit: BoxFit.cover,
                          alignment: Alignment.topRight
                      )
                  ),
                  child: Center(
                      child: Padding(padding: const EdgeInsets.all(8.0),
                          child: Column(
                              children: [
                                Spacer(flex: 5),
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
                                Spacer(flex: 1),
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
                                Spacer(flex: 1),
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
                                Spacer(flex: 1)
                              ]
                          )
                      )
                  )
              )
          )
      );
    }else
      {
        return MaterialApp(
            theme: ThemeData(primaryColor: Colors.amber),
            home: Scaffold(
              // appBar: customAppBar("Startseite"),
                body: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/home.jpeg"),
                            fit: BoxFit.cover,
                            alignment: Alignment.topRight
                        )
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                        child: Padding(padding: const EdgeInsets.only(left:100.0),
                            child: Column(
                                children: [
                                  Spacer(flex: 3),
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
                                  Spacer(flex: 1),
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
                                  Spacer(flex: 1),
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
                                  Spacer(flex: 3)
                                ]
                            )
                        )
                    )
                )
            )
        );
      }
  }
}


