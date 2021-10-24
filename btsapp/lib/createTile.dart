import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:shared_preferences/shared_preferences.dart';

void playMeme(audio) {
  final player = AudioCache();
  player.play('cut_audios/$audio.wav');
}

List tilesGenerator({List<String> tilesList, Function changeFavs}) {
  return (tilesList
      .map((title) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onDoubleTap: () {
                changeFavs(title);
              },
              child: (MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                padding: EdgeInsets.all(0.0),
                color: Colors.black38,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/pictures/$title.PNG'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
                enableFeedback: false,
                onPressed: () {
                  playMeme(title);
                },
              )),
            ),
          ))
      .toList());
}
