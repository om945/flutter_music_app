import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/playlist_provider.dart';
import 'package:flutter_application_1/models/songs.dart';
import 'package:flutter_application_1/pages/theme_box.dart';
import 'package:provider/provider.dart';

class SongPage extends StatefulWidget {
  late final Function(Songs) onSongAdd;

  SongPage({super.key, required this.onSongAdd});

  String formatTime(Duration duration){
    String twoDigitSecond = duration.inSeconds.remainder(60).toString();
    String formattedTime = "${duration.inMinutes}:$twoDigitSecond";
    return formattedTime;
  }

  @override
  State<SongPage> createState() => _SongPageState();
  
}
class _SongPageState extends State<SongPage> {
  Color _color = Colors.white;

  void changeColor(){
    setState(() {
      _color = _color == Colors.white ? Colors.red : Colors.white ;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(builder: (
      context, value, child) {
        //get playlist
        final playlist = value.playlist;
        //get song index
        final currentSong = playlist[value.currentSongIndex ?? 0];
        //return scaffold UI
        return Scaffold(
         
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        title: Text("A L B U M"),
      ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                //album artwork
                NewBox(child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(currentSong.songImage)),

                      //song name and artist name
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //song and artist name
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(currentSong.songName,style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                                ),),
                                Text(currentSong.artistName),
                              ],
                            ),
                            SizedBox(width: 50,),
                            //heart icon
                            IconButton(onPressed: (){
                            changeColor();
                            }, icon: Icon(Icons.favorite, 
                            color: _color,

                            ))
                          ],
                        ),
                      )
                  ],
                )),
                //progress bar
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        //start time and end time
                        Text(widget.formatTime(value.currentDuration)),
                        Icon(Icons.shuffle),
                        GestureDetector(
                          onTap: (){
                            Songs song = Songs(songName: currentSong.songName, 
                            artistName: currentSong.artistName, 
                            songImage:currentSong.songImage, 
                            audioPath:currentSong.audioPath);
                            widget.onSongAdd(song);
                          },
                          child: Icon(Icons.playlist_play_sharp),
                        ),
                        Icon(Icons.repeat),
                        Text(widget.formatTime(value.totalDuration)),
                      ],),
                    ),

                  //duration progress
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0),
                      ),
                      child: Slider(
                        min: 0,
                        max: value.totalDuration.inSeconds.toDouble(),
                        value: value.currentDuration.inSeconds.toDouble(), 
                        activeColor: Colors.green,
                        onChanged: (double double){
                          //duraing when the user is sliding around

                        },
                        onChangeEnd: (double double) {
                          //duraing when the user is done sliding, go to position in song duration
                          value.seekTo(Duration(seconds: double.toInt()));
                        },
                        ),
                    )
                  ],
                ),
                SizedBox(height: 25,),

                Row(
                  children: [
                  //skip privious 
                  Expanded(
                    child: GestureDetector(
                      onTap: value.playPreviousSong,
                      child: NewBox(
                        child: Icon(Icons.skip_previous)),
                    ),
                  ),
                  SizedBox(width: 20,),

                  //play puse
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: value.pauseORresume,
                      child: NewBox(
                        child: Icon(value.playing
                        ? Icons.pause
                        : Icons.play_arrow
                        )),
                    ),
                  ),
                  SizedBox(width: 20,),

                  //skip forward
                  Expanded(
                    child: GestureDetector(
                      onTap: value.playNextSong,
                      child: NewBox(
                        child: Icon(Icons.skip_next)),
                    ),
                  ),
                ],)
              ],
            ),
          ),
        )
    );
      } );
  }
}