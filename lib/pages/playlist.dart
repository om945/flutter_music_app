import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/songs.dart';
import 'package:flutter_application_1/pages/song_page.dart';

class Playlist extends StatefulWidget {
  Playlist({
    super.key,
    });
  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  
  //list to store song
  List<Songs> _songs = [];
  void _addSong(Songs song){
    //add Fav. song
    setState(() {
      _songs.add(song);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SongPage(
     onSongAdd:_addSong,
    );
  }
}