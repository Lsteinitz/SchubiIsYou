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

BoxDecoration customBoxDecoration(String imagepath)
{
  return BoxDecoration(
      image: DecorationImage(
          image: AssetImage(imagepath),
          fit: BoxFit.contain,
          alignment: Alignment.center
      )
  );
}

