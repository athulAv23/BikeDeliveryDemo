import 'package:flutter/material.dart';

Widget normaltext(String text, double size) {
  return Text(
    text,
    style:
        TextStyle(color: const  Color.fromARGB(255, 25, 30, 54), fontSize: size),
  );
}

Widget boldtext(String text, double size) {
  return Text(
    text,
    style: TextStyle(  
        color:const Color.fromARGB(255, 25, 30, 54), 
        fontSize: size,
        fontWeight: FontWeight.bold),
  );
}
