import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/playlist_provider.dart';
import 'package:flutter_application_1/models/songs.dart';
import 'package:provider/provider.dart';

class Playlist extends StatefulWidget {
  final Function onSongAdd;
  Playlist({
    super.key, required this.onSongAdd,
    });
  @override
  _PlaylistState createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  List<Songs> _songs = [];

  void _addSong(Songs song) {
    setState(() {
      _songs.add(song);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(builder:(
      context, playlistProvider, child) {
        final playlist1 = playlistProvider.playlist1;
        return Scaffold(
          body: Column(
            children: [
              SizedBox(height: 20),
              Text('Favorite Songs:'),
              Expanded(
                child: ListView.builder(
                  itemCount: playlist1.length,
                  itemBuilder: (context, index) {
                    final song = playlist1[index];

                    return ListTile(
                      title: Text(song.songName),
                      subtitle: Text(song.artistName),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      });
  }
}