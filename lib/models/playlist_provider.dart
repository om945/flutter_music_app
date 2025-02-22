import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/songs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

class PlaylistProvider extends ChangeNotifier {
  final List<Songs> _playlist = [
    Songs(
    songName: "7 Years feat Lukas Graham Sped Up", 
    artistName: "Lukas Graham", 
    songImage: "assets/images/bg_img.jpg", 
    audioPath: "assets/audio/7 Years feat Lukas Graham Sped Up Version.mp3"
    ),
    Songs(
    songName: "Ainsi bas la vida", 
    artistName: "Indila", 
    songImage: "assets/images/bg_img2.jpg", 
    audioPath: "assets/audio/Ainsi bas la vida.mp3"
    ),
    Songs(
    songName: "Alan Walker", 
    artistName: "Alan Walker", 
    songImage: "assets/images/bg_img3.jpg", 
    audioPath: "assets/audio/Alan_Walker.mp3"
    ),
    Songs(
    songName: "Apa Fer Milaange", 
    artistName: "Savi Kahlon", 
    songImage: "assets/images/bg_img3.jpg", 
    audioPath: "assets/audio/Apa Fer Milaange.mp3"
    ),
    Songs(
    songName: "BADTAMEEZ DIL", 
    artistName: "Benny Dayal", 
    songImage: "assets/images/bg_img.jpg", 
    audioPath: "assets/audio/BADTAMEEZ DIL.mp3"
    ),
    Songs(
    songName: "Besharmi Ki Height", 
    artistName: "Benny Dayal", 
    songImage: "assets/images/bg_img.jpg", 
    audioPath: "assets/audio/Besharmi Ki Height.mp3"
    ),
    Songs(
    songName: "Bhool Bhulaiyaa 2 Title Track", 
    artistName: "Neeraj Shridhar", 
    songImage: "assets/images/bg_img.jpg", 
    audioPath: "assets/audio/Bhool Bhulaiyaa 2 Title Track.mp3"
    ),
    Songs(
    songName: "Brown Rang", 
    artistName: "Yo Yo Honey Singh", 
    songImage: "assets/images/bg_img.jpg", 
    audioPath: "assets/audio/Brown Rang.mp3"
    ),
    Songs(
    songName: "Closer", 
    artistName: "The Chainsmokers", 
    songImage: "assets/images/bg_img3.jpg", 
    audioPath: "assets/audio/The Chainsmokers - Closer Lyric ft Halsey.mp3"
    ),
    Songs(
    songName: "Counting Stars", 
    artistName: "OneRepublic", 
    songImage: "assets/images/bg_img3.jpg", 
    audioPath: "assets/audio/Counting Stars.mp3"
    ),
    Songs(
    songName: "COWBELL WARRIOR_", 
    artistName: "Unknown", 
    songImage: "assets/images/bg_img2.jpg", 
    audioPath: "assets/audio/COWBELL WARRIOR_.mp3"
    ),
    Songs(
    songName: "Dernière danse", 
    artistName: "Indila", 
    songImage: "assets/images/bg_img2.jpg", 
    audioPath: "assets/audio/Dernire danse.mp3"
    ),
    Songs(
    songName: "Die With A Smile", 
    artistName: "Lady Gara & Bruno Mars", 
    songImage: "assets/images/bg_img3.jpg", 
    audioPath: "assets/audio/Die With A Smile.mp3"
    ),
    Songs(
    songName: "Dope Shope", 
    artistName: "Yo Yo Honey Singh", 
    songImage: "assets/images/bg_img2.jpg", 
    audioPath: "assets/audio/Dope Shope.mp3"
    ),
    Songs(
    songName: "Eastside", 
    artistName: "Benny Blanco, Halsey & Khalid", 
    songImage: "assets/images/bg_img3.jpg", 
    audioPath: "assets/audio/Eastside.mp3"
    ),
    Songs(
    songName: "End of Beginning", 
    artistName: "Unknown", 
    songImage: "assets/images/bg_img3.jpg", 
    audioPath: "assets/audio/End of Beginning.mp3"
    ),
    Songs(
    songName: "Excuses", 
    artistName: "AP Dhillon", 
    songImage: "assets/images/bg_img.jpg", 
    audioPath: "assets/audio/Excuses.mp3"
    ),
    Songs(
    songName: "Fairytale", 
    artistName: "Alexander Rybak", 
    songImage: "assets/images/bg_img3.jpg", 
    audioPath: "assets/audio/Fairytale.mp3"
    ),
    Songs(
    songName: "GALAT BAAT HAI", 
    artistName: "Neeti Mohan", 
    songImage: "assets/images/bg_img.jpg", 
    audioPath: "assets/audio/GALAT BAAT HAI.mp3"
    ),
    Songs(
    songName: "GigaChad Theme Phonk House Version", 
    artistName: "Phonk House", 
    songImage: "assets/images/bg_img2.jpg", 
    audioPath: "assets/audio/GigaChad Theme Phonk House Version.mp3"
    ),
    Songs(
    songName: "Hass Hass", 
    artistName: "Diljit Dosanjh", 
    songImage: "assets/images/bg_img3.jpg", 
    audioPath: "assets/audio/Hass Hass.mp3"
    ),
    Songs(
    songName: "Heat Waves", 
    artistName: "Glass Animals", 
    songImage: "assets/images/Heat_Waves.png", 
    audioPath: "assets/audio/Heat Waves.mp3"
    ),
    Songs(
    songName: "Hymn for the Weekend", 
    artistName: "Coldplay", 
    songImage: "assets/images/bg_img3.jpg", 
    audioPath: "assets/audio/Hymn for the Weekend.mp3"
    ),
    Songs(
    songName: "Jannatein Kahan", 
    artistName: "KK", 
    songImage: "assets/images/bg_img3.jpg", 
    audioPath: "assets/audio/Jannatein Kahan.mp3"
    ),
    Songs(
    songName: "Lean On feat M  DJ Snake", 
    artistName: "DJ Snake", 
    songImage: "assets/images/bg_img3.jpg", 
    audioPath: "assets/audio/Lean On feat M  DJ Snake.mp3"
    ),
    Songs(
    songName: "Let Me Down Slowly", 
    artistName: "Alec Benjamin", 
    songImage: "assets/images/bg_img3.jpg", 
    audioPath: "assets/audio/Let Me Down Slowly.mp3"
    ),
    Songs(
    songName: "Let Me Love You", 
    artistName: "DJ Snake ft. Justin Bieber", 
    songImage: "assets/images/bg_img3.jpg", 
    audioPath: "assets/audio/Let Me Love You.mp3"
    ),
    Songs(
    songName: "NITRO", 
    artistName: "LXNGVX", 
    songImage: "assets/images/bg_img2.jpg", 
    audioPath: "assets/audio/LXNGVX - NITRO AMV.mp3"
    ),
    Songs(
    songName: "Matsuka UltraPhonk", 
    artistName: "Unknown", 
    songImage: "assets/images/matsuka.jpg", 
    audioPath: "assets/audio/M U.mp3"
    ),
    Songs(
    songName: "Main Rang Sharbaton Ka", 
    artistName: "Atif Aslam", 
    songImage: "assets/images/bg_img3.jpg", 
    audioPath: "assets/audio/Main Rang Sharbaton Ka.mp3"
    ),
    Songs(
    songName: "MIDDLE OF THE NIGHT", 
    artistName: "Elley Duhe", 
    songImage: "assets/images/bg_img3.jpg", 
    audioPath: "assets/audio/MIDDLE OF THE NIGHT.mp3"
    ),
    Songs(
    songName: "Murder In My Mind", 
    artistName: "Kordhell", 
    songImage: "assets/images/bg_img2.jpg", 
    audioPath: "assets/audio/Murder In My Mind.mp3"
    ),
    Songs(
    songName: "NEXT", 
    artistName: "Unknown", 
    songImage: "assets/images/bg_img2.jpg", 
    audioPath: "assets/audio/NEXT_.mp3"
    ),
    Songs(
    songName: "Night Changes", 
    artistName: "One Direction", 
    songImage: "assets/images/bg_img3.jpg", 
    audioPath: "assets/audio/Night Changes.mp3"
    ),
    Songs(
    songName: "On My Way", 
    artistName: "Alan Walker", 
    songImage: "assets/images/bg_img3.jpg", 
    audioPath: "assets/audio/On My Way.mp3"
    ),
    Songs(
    songName: "ovg_ - Hoes No Jutsu", 
    artistName: "ovg_", 
    songImage: "assets/images/bg_img2.jpg", 
    audioPath: "assets/audio/ovg_ - Hoes No Jutsu.mp3"
    ),
    Songs(
    songName: "RAAT BHAR", 
    artistName: "Arijit Singh", 
    songImage: "assets/images/bg_img.jpg", 
    audioPath: "assets/audio/RAAT BHAR.mp3"
    ),
    Songs(
    songName: "Rani Majhya Malyamandi", 
    artistName: "Unknown", 
    songImage: "assets/images/bg_img.jpg", 
    audioPath: "assets/audio/Rani Majhya Malyamandi.mp3"
    ),
    Songs(
    songName: "Dandelions", 
    artistName: "Ruth B", 
    songImage: "assets/images/bg_img3.jpg", 
    audioPath: "assets/audio/Ruth B - Dandelions Audio.mp3"
    ),
    Songs(
    songName: "Somewhere Only We Know", 
    artistName: "Keane", 
    songImage: "assets/images/bg_img3.jpg", 
    audioPath: "assets/audio/Somewhere Only We Know.mp3"
    ),
    Songs(
    songName: "SOORAJ DOOBA HAIN", 
    artistName: "Arijit Singh", 
    songImage: "assets/images/bg_img.jpg", 
    audioPath: "assets/audio/SOORAJ DOOBA HAIN.mp3"
    ),
    Songs(
    songName: "Step Back", 
    artistName: "Unknown", 
    songImage: "assets/images/bg_img2.jpg", 
    audioPath: "assets/audio/Step Back_.mp3"
    ),
    Songs(
    songName: "Stereo Hearts feat Adam Levine", 
    artistName: "Gym Class Heroes", 
    songImage: "assets/images/bg_img3.jpg", 
    audioPath: "assets/audio/Stereo Hearts feat Adam Levine.mp3"
    ),
    Songs(
    songName: "Stereo Love Extended Mix", 
    artistName: "Edward Maya", 
    songImage: "assets/images/bg_img3.jpg", 
    audioPath: "assets/audio/Stereo Love Extended Mix.mp3"
    ),
    Songs(
    songName: "Stereo_Hearts_x_Zaalima", 
    artistName: "Unknown", 
    songImage: "assets/images/bg_img.jpg", 
    audioPath: "assets/audio/Stereo_Hearts_x_Zaalima.mp3"
    ),
    Songs(
    songName: "Sweater Weather Sped Up", 
    artistName: "The Neighbourhood", 
    songImage: "assets/images/bg_img3.jpg", 
    audioPath: "assets/audio/Sweater Weather Sped Up.mp3"
    ),
    Songs(
    songName: "The Nights", 
    artistName: "Avicii", 
    songImage: "assets/images/bg_img.jpg", 
    audioPath: "assets/audio/The Nights.mp3"
    ),
    Songs(
    songName: "The Search", 
    artistName: "NF", 
    songImage: "assets/images/bg_img2.jpg", 
    audioPath: "assets/audio/The Search.mp3"
    ),
    Songs(
    songName: "There's Nothing Holdin' Me Back", 
    artistName: "Shawn Mendes", 
    songImage: "assets/images/bg_img.jpg", 
    audioPath: "assets/audio/Theres Nothing Holdin Me Back.mp3"
    ),
    Songs(
    songName: "Tu Aake Dekhle", 
    artistName: "King", 
    songImage: "assets/images/bg_img3.jpg", 
    audioPath: "assets/audio/Tu Aake Dekhle.mp3"
    ),
    Songs(
    songName: "Tu hai kahan", 
    artistName: "Unknown", 
    songImage: "assets/images/bg_img3.jpg", 
    audioPath: "assets/audio/Tu hai kahan.mp3"
    ),
    Songs(
    songName: "Ud-daa Punjab", 
    artistName: "Vishal Dadlani", 
    songImage: "assets/images/bg_img3.jpg", 
    audioPath: "assets/audio/Ud-daa Punjab.mp3"
    ),
    Songs(
    songName: "Ye Go Ye Ye Maina", 
    artistName: "Unknown", 
    songImage: "assets/images/bg_img.jpg", 
    audioPath: "assets/audio/Ye Go Ye Ye Maina.mp3"
    ),
    Songs(
    songName: "YE TUNE KYA KIYA", 
    artistName: "Javed Bashir", 
    songImage: "assets/images/bg_img3.jpg", 
    audioPath: "assets/audio/YE TUNE KYA KIYA.mp3"
    ),
    Songs(
    songName: "Zaalima", 
    artistName: "Arijit Singh", 
    songImage: "assets/images/bg_img3.jpg", 
    audioPath: "assets/audio/Zaalima.mp3"
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
  bool _isShuffle = false;

  // play audio

  void play(PlaylistProvider playlistProvider) async{
     print('Playing song at index: ${playlistProvider.currentSongIndex}');
    final String path = _playlist[_currentSongIndex ?? 0].audioPath.replaceAll('assets/', '');
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

  //Shuffle song 
  void toggleShuffle(){
    _isShuffle = !_isShuffle;
    notifyListeners();
  }

  // play next song
  void playNextSong(){
    if (_isShuffle){
      _currentSongIndex = Random().nextInt(_playlist.length);
    } else{
      
    if(_currentSongIndex != null){
      if(_currentSongIndex!<playlist.length - 1){
        //go to next song if it's not the last 
        _currentSongIndex = _currentSongIndex! + 1;
      }else{
        //if it is last song loop back to the first
        _currentSongIndex = 0;
      }
    }
    }
    play(PlaylistProvider());
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
  bool get shuffle => _isShuffle;
  /*
  Setters
  */

  set currentSongIndex(int? newIndex){
    //update current song index
    _currentSongIndex = newIndex;
    if(newIndex != null){
      play(PlaylistProvider());// play the song at the new index
    }
    
    notifyListeners();
  }
  void addSongToPlaylist(Songs currentSongIndex)  async{
    _playlist1.add(currentSongIndex);
    notifyListeners();
     // Store the playlist in shared preferences
  final prefs = await SharedPreferences.getInstance();
  prefs.setStringList('playlist1', _playlist1.map(
    (song) => jsonEncode(song.toJson())).toList());
  }
  void removeSongFromPlaylist(int index) async {
    if (index >= 0 && index < _playlist1.length) {
      _playlist1.removeAt(index);
      notifyListeners();
  
      // Update the playlist in shared preferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setStringList('playlist1', _playlist1.map(
        (song) => jsonEncode(song.toJson())).toList());
    }
  }
  void playSongAtIndex(int index) {
    if (index >= 0 && index < _playlist.length) {
      _currentSongIndex = index;
      play(PlaylistProvider());
    } else {
      print('Invalid index');
    }
  }
  
}