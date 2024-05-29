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

Text customText(String text)
{
  return Text(
    text,
      style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold, backgroundColor: Colors.amber)
  );
}

