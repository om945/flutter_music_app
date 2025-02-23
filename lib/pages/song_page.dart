import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/playlist_provider.dart';
import 'package:flutter_application_1/models/songs.dart';
import 'package:flutter_application_1/pages/theme_box.dart';
import 'package:provider/provider.dart';

class SongPage extends StatefulWidget {
  late final Function(Songs) onSongAdd;

  SongPage({super.key});

  String formatTime(Duration duration){
    String twoDigitSecond = duration.inSeconds.remainder(60).toString();
    String formattedTime = "${duration.inMinutes}:$twoDigitSecond";
    return formattedTime;
  }

  @override
  State<SongPage> createState() => _SongPageState();
  
}
class _SongPageState extends State<SongPage> {

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(builder: (
      context, playlistProvider, child) {
        //get playlist
        // final playlist = playlistProvider.playlist;
        //get song index
        final currentSong = playlistProvider.playlist[playlistProvider.currentSongIndex ?? 0];
        //return scaffold UI
        return Scaffold(

      // ignore: deprecated_member_use
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        // ignore: deprecated_member_use
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        title: Text("A L B U M"),
        forceMaterialTransparency: true,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
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
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Text(
                                    currentSong.songName,
                                    style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    ),
                                    overflow: TextOverflow.visible,
                                  ),
                                  Text(
                                    currentSong.artistName,
                                    overflow: TextOverflow.visible,
                                  ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 50,),
                              //heart icon
                              IconButton(onPressed: (){}, 
                              icon: Icon(Icons.favorite, 
                              color: Colors.red,
                              ))
                            ],
                          ),
                        )
                    ],
                  )),
                  SizedBox(height: 20,),
                  //progress bar
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          //start time and end time
                          Text(widget.formatTime(
                            playlistProvider.currentDuration
                            )),
                            GestureDetector(
                              onTap: () {
                                playlistProvider.backward5Seconds();
                              },
                              child: Icon(Icons.replay_5,
                              size: 30,
                              ),
                            ),
                          GestureDetector(
                            onTap: () {
                              playlistProvider.toggleShuffle();
                            },
                            child: Icon(playlistProvider.shuffle
                            ? Icons.shuffle
                            : Icons. repeat
                            )
                            ),
                            GestureDetector(
                              onTap: () {
                                playlistProvider.forward5Seconds();
                              },
                              child: Icon(Icons.forward_5,
                              size: 30,
                              ),
                            ),
                          
                          Text(widget.formatTime(playlistProvider.totalDuration)),
                        ],),
                      ),
                    //duration progress
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0),
                        ),
                        child: Slider(
                          min: 0,
                          max: playlistProvider.totalDuration.inSeconds.toDouble(),
                          value: playlistProvider.currentDuration.inSeconds.
                          toDouble().clamp(0, playlistProvider.totalDuration.
                          inSeconds.toDouble()),
                          activeColor: Colors.green,
                          onChanged: (double value){
                            //duraing when the user is sliding around
                          },
                          onChangeEnd: (double double) {
                            //duraing when the user is done sliding, go to position in song duration
                            playlistProvider.seekTo(Duration(seconds: double.toInt()));
                          },
                          ),
                      )
                    ],
                  ),
                  SizedBox(height: 15,),
          
                  Row(
                    children: [
                    //skip privious 
                    Expanded(
                      child: GestureDetector(
                        onTap: playlistProvider.playPreviousSong,
                        child: NewBox(
                          child: Icon(Icons.skip_previous)),
                      ),
                    ),
                    SizedBox(width: 20,),
          
                    //play puse
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: playlistProvider.pauseORresume,
                        child: NewBox(
                          child: Icon(playlistProvider.playing
                          ? Icons.pause
                          : Icons.play_arrow
                          )),
                      ),
                    ),
                    SizedBox(width: 20,),
          
                    //skip forward
                    Expanded(
                      child: GestureDetector(
                        onTap: playlistProvider.playNextSong,
                        child: NewBox(
                          child: Icon(Icons.skip_next)),
                      ),
                    ),
                  ],)
                ],
              ),
            ),
          ),
        )
    );
  } );
  }
  
}