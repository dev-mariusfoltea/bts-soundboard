import 'dart:math';

import 'package:btsapp/createTile.dart';
import 'package:btsapp/favouritesGetter.dart';
import 'package:btsapp/toastFuncs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class randomAnswer extends StatefulWidget {
  @override
  _randomAnswerState createState() => _randomAnswerState();
}

class _randomAnswerState extends State<randomAnswer> {
  List<String> answers = [
    "Jimin says: without a doubt",
    "Suga says: yes, definetly",
    "V says: it is certain",
    "Suga says: absolutely no",
    "Jungkook is very doubtful",
    "Jimin says: ask again later"
  ];
  int rnd = 0;
  int tmpRand = 0;
  Random random = new Random();

  @override
  void updateRnd() {
    setState(() {
      while (tmpRand == rnd) {
        tmpRand = random.nextInt(6);
      }
      rnd = tmpRand;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple, title: Text('BTS answer to you')),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40.0, 0, 0),
              child: Column(
                children: [
                  Container(
                    width: 300.0,
                    height: 300.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/gifs/answer$rnd.gif'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: null /* add child content here */,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 0),
                    child: Text(
                      answers[rnd],
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                color: Colors.purple,
                minWidth: double.infinity,
                height: 50.0,
                onPressed: updateRnd,
                child: Text(
                  "Get answer 🔄",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
