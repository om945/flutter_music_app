import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/playlist_provider.dart';
import 'package:flutter_application_1/models/songs.dart';
import 'package:flutter_application_1/pages/currentplaying_song.dart';
import 'package:flutter_application_1/pages/drawer.dart';
import 'package:flutter_application_1/pages/playlist.dart';
import 'package:flutter_application_1/pages/song_page.dart';
import 'package:provider/provider.dart';


class Audiopage extends StatefulWidget {
  const Audiopage({super.key});

  @override
  State<Audiopage> createState() => _AudioplayUrlState();
}

class _AudioplayUrlState extends State<Audiopage> {

  late final dynamic playlistProvider;
  
 
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    playlistProvider = Provider.of<PlaylistProvider>(context,listen: false);
  }

  void goToSong(int songIndex){
    playlistProvider.currentSongIndex = songIndex;

    Navigator.push(context, MaterialPageRoute(builder: (context)=> SongPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: BottomNavigationBar(
      selectedItemColor: Theme.of(context).colorScheme.secondary,  
      items:[ 
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.playlist_play_sharp), 
      label: "Playlist"
      ),],
      onTap: (int index){
        if(index == 0){
          return null;
        }else{
          Navigator.push(context, MaterialPageRoute(builder: (context) => Playlist(onSongAdd: (Songs ) { },
          )));
        }
      },
      ),
      appBar: AppBar(
        title: Text("Audio Player"),
      ),
      drawer: MyDrawer(),
      body: Consumer<PlaylistProvider>(builder: (context, value, child) {
        final List<Songs> playlist = value.playlist;

        return ListView.builder(
          itemCount: playlist.length,
          itemBuilder: (context, index){
            final Songs song = playlist[index];
            return ListTile(
              title: Text(song.songName),
              subtitle: Text(song.artistName),
              leading: Image.asset(song.songImage),
              onTap: () => goToSong(index),
            );
          },
        );
      }
      ,),
      floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: 
        (context) => CurrentplayingSong()));
      },
      child: Icon(Icons.play_arrow,
      size: 30,
      color: Theme.of(context).colorScheme.secondary,
      ),),
    );
  }
}