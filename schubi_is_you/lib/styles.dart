import 'package:flutter/material.dart';
PreferredSizeWidget customAppBar(String text)
{
  return AppBar(
    backgroundColor: Colors.amber,
    title: Text(
        text,
        style: TextStyle(color: Colors.black)
    ),
  );
}

