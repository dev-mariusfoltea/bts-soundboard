import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

void successAdded() {
  Fluttertoast.showToast(
      msg: "Added to favourites",
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 1,
      fontSize: 16.0);
}

void successRemoved() {
  Fluttertoast.showToast(
      msg: "Removed from favourites",
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.deepPurple,
      fontSize: 16.0);
}
