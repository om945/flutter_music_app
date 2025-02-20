import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/songs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Songs> _playlist = [
    Songs(
    songName: "song 1", 
    artistName: "Yo1", 
    songImage: "assets/images/Heat_Waves.png", 
    audioPath: "assets/audio/1.mp3"
    ),
    Songs(
    songName: "song 2", 
    artistName: "Yo2", 
    songImage: "assets/images/matsuka.jpg", 
    audioPath: "assets/audio/2.mp3"
    ),
    Songs(
    songName: "song 3", 
    artistName: "Yo3", 
    songImage: "assets/images/let_me_love_u.jpg", 
    audioPath: "assets/audio/3.mp3"
    ),
  ];
  List<Songs> _playlist1 = [];
  //current song playing index
  int? _currentSongIndex;
  /*
  Audio player
  */
  //duration
  final AudioPlayer _audioPlayer = AudioPlayer();
  
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  //constructor
  PlaylistProvider(){
    _loadPlaylist();
    listenToDuration();
    }
  void _loadPlaylist() async {
  final prefs = await SharedPreferences.getInstance();
  final playlistJson = prefs.getStringList('playlist1');

  if (playlistJson != null) {
    _playlist1 = playlistJson.map((json) => Songs.fromJson(jsonDecode(json))).toList();
    notifyListeners();
  }
}

    //initially not playing
  bool _isPlaying = false;

  // play audio

  void play() async{
    final String path = _playlist[_currentSongIndex!].audioPath.replaceAll('assets/', '');
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    notifyListeners();
  }

  // pause song
  void pause() async{
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  // resume song
  void resume() async{
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  // pause or resume song
  void pauseORresume() async{
    if(_isPlaying){
      pause();
  } else{
    resume();
  }
  }

  // seek to specific
  void seekTo(Duration position) async{
    await _audioPlayer.seek(position);
  }

  // play next song
  void playNextSong(){
    if(_currentSongIndex != null){
      if(_currentSongIndex!<playlist.length - 1){
        //go to next song if it's not the last 
        _currentSongIndex = _currentSongIndex! + 1;
      }else{
        //if it is last song loop back to the first
        _currentSongIndex = 0;
      }
    }
    play();
  }

  // play previous song
  void playPreviousSong()async{
    //if more than 2 sec have passed, restart curent song
    if(_currentDuration.inSeconds>2){
        seekTo(Duration.zero);
    }
    // if it's within 2 sec of song go to previous song
    else{
      if(_currentSongIndex != 0){
        currentSongIndex=_currentSongIndex! - 1;
      }else{
        // if it's the first song loop back to the last
        currentSongIndex = playlist.length - 1;
      }
    }
  }

  // listen to Duration
  void listenToDuration(){
    //total duration 
  _audioPlayer.onDurationChanged.listen((newDuration){
    _totalDuration = newDuration;
    notifyListeners();
  });
    //current duration
  _audioPlayer.onPositionChanged.listen((newPosition){
    _currentDuration = newPosition;
    notifyListeners();
  });
    //song completed
  _audioPlayer.onPlayerComplete.listen((event) {
    playNextSong();
  });
  }
  /*
  Getters
  */
  List<Songs> get playlist => _playlist;
  List<Songs> get playlist1 => _playlist1;
  int? get currentSongIndex => _currentSongIndex;
  bool get playing => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;
  /*
  Setters
  */

  set currentSongIndex(int? newIndex){
    //update current song index
    _currentSongIndex = newIndex;
    if(newIndex != null){
      play();// play the song at the new index
    }
    
    notifyListeners();
  }
  void addSongToPlaylist(Songs song)  async{
    _playlist1.add(song);
    notifyListeners();
     // Store the playlist in shared preferences
  final prefs = await SharedPreferences.getInstance();
  prefs.setStringList('playlist1', _playlist1.map((
    song) => jsonEncode(song.toJson())).toList());
  }
}