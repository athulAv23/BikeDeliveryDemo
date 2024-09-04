import 'package:flutter/material.dart';

double customHeight(context, height) {
  return MediaQuery.of(context).size.height * height;
}

double customWidth(context, width) {
  return MediaQuery.of(context).size.width * width;
}
