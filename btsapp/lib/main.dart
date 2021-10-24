import 'package:btsapp/createTile.dart';
import 'package:btsapp/favourites.dart';
import 'package:btsapp/favouritesGetter.dart';
import 'package:btsapp/randomAnswer.dart';
import 'package:btsapp/toastFuncs.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:core';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BTS soundboard',
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      /* ThemeMode.system to follow system theme,
         ThemeMode.light for light theme,
         ThemeMode.dark for dark theme
      */
      home: mainParent(),
    ),
  );
  favsInit();
}

class mainParent extends StatefulWidget {
  @override
  _mainParentState createState() => _mainParentState();
}

class _mainParentState extends State<mainParent> {
  @override
  Widget build(BuildContext context) {
    favsInit();
    List<String> allMemes = [
      'anneyong',
      'beach',
      'bonobonoya',
      'carbonara',
      'cutejk',
      'dingdong',
      'excuseme',
      'heyjimin',
      'hibaby',
      'horselaugh',
      'imspiderman',
      'infires',
      'jhoperingtone',
      'jiminringtone',
      'lachimodala',
      'lovely',
      'niagara',
      'oinkoink',
      'paprika',
      'pizzapasta',
      'rrapmonsta',
      'sexponista',
      'sitdown',
      'sneaku',
      'stobit',
      'whatsyourname',
      'wwhandsome',
      'yourhope',
      'flower',
      'boomboom',
      'red',
      'hamburgersprite',
      'safety'
    ];

    //funcion to pass o tile constructo so we can add to favs tiles
    void changeFavs(String toAdd) async {
      Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
      final SharedPreferences prefs = await _prefs;
      final tmpPrefs = prefs.getStringList('sharedFavourites');

      final alreadyExists = (tmpPrefs.contains(toAdd));
      setState(() {
        if (alreadyExists) {
          tmpPrefs.remove(toAdd);
          prefs.setStringList('sharedFavourites', tmpPrefs);
          favsInit();
          successRemoved();
        } else {
          tmpPrefs.add(toAdd);
          prefs.setStringList('sharedFavourites', tmpPrefs);
          favsInit();
          successAdded();
        }
      });
    }

    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => favouritesList(),
                ),
              );
            },
            child: Text(
              '🔥',
              style: TextStyle(fontSize: 20.0),
            ),
            backgroundColor: Colors.purple,
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => randomAnswer(),
                ),
              );
            },
            child: Text(
              '🤔',
              style: TextStyle(fontSize: 20.0),
            ),
            backgroundColor: Colors.purple,
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Center(
          child: Text('BTS soundboard 🎵'),
        ),
      ),
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 3,
          children: tilesGenerator(tilesList: allMemes, changeFavs: changeFavs),
        ),
      ),
    );
  }
}
