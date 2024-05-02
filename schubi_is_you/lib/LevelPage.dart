import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:schubi_is_you/styles.dart';

class LevelPage extends StatefulWidget {
  @override
  _LevelPageState createState() => _LevelPageState();
}
class _LevelPageState extends State<LevelPage>
{
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Level Auswahl"),
    );
  }
}

