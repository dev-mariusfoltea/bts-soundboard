import 'package:btsapp/createTile.dart';
import 'package:btsapp/favouritesGetter.dart';
import 'package:btsapp/toastFuncs.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class favouritesList extends StatefulWidget {
  @override
  _favouritesListState createState() => _favouritesListState();
}

class _favouritesListState extends State<favouritesList> {
  @override

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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: /*Text('My favourites 🔥')*/
            Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('My favourites 🔥'),
            Text(
              'double tap to add/remove a sound to favs',
              style: new TextStyle(
                fontSize: 15.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 3,
          children: tilesGenerator(tilesList: favs, changeFavs: changeFavs),
        ),
      ),
    );
  }
}
