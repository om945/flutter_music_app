import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/playlist_provider.dart';
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

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(builder:(
      context, playlistProvider, child) {
        final playlist1 = playlistProvider.playlist1;
        return Scaffold(
          appBar: AppBar(
            title: Text("Playlist"),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          selectedItemColor: Theme.of(context).colorScheme.secondary,  
          items:[ 
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.playlist_play_sharp), 
          label: "Playlist"
          ),],
          onTap: (int index){
            if(index == 1){
              return null;
            }else{
              Navigator.pop(context);
            }
          },
          ),
          body: Column(
            children: [
              SizedBox(height: 10,),
              Expanded(
                child: ListView.builder(
                  itemCount: playlist1.length,
                  itemBuilder: (context, index) {
                    final song = playlist1[index];
                    return ListTile(
                      title: Text(song.songName),
                      subtitle: Text(song.artistName),
                      leading: Image.asset(song.songImage),
                      trailing: IconButton(
                      onPressed: (){
                        playlistProvider.removeSongFromPlaylist(index);
                      }, 
                      icon: Icon(Icons.delete)),
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