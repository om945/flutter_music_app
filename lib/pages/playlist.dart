// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/models/playlist_provider.dart';
// import 'package:flutter_application_1/models/songs.dart';
// import 'package:flutter_application_1/pages/song_page.dart';
// import 'package:provider/provider.dart';

// class Playlist extends StatefulWidget {
//   final Function onSongAdd;
//   const Playlist({
//     super.key, required this.onSongAdd,
//     });
//   @override
//   _PlaylistState createState() => _PlaylistState();
// }

// class _PlaylistState extends State<Playlist> {
//   late final dynamic playlistProvider;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     playlistProvider = Provider.of<PlaylistProvider>(context,listen: false);
//   }

//   void goToSong(int songIndex){
//     print('Going to song index: $songIndex');
//     playlistProvider.currentSongIndex = songIndex;
//     Navigator.push(context, MaterialPageRoute(builder: (context)=> SongPage()));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("P L A Y L I S T"),
//         ),
//         body: Consumer<PlaylistProvider>(builder: (context, value, child) {
//         final List<Songs> playlist1 = value.playlist1;

//         return ListView.builder(
//           itemCount: playlist1.length,
//           itemBuilder: (context, index){
//             final Songs song = playlist1 [index];
//             return ListTile(
//               title: Text(song.songName),
//               subtitle: Text(song.artistName),
//               leading: Image.asset(song.songImage),
//               onTap: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => SongPage()));
//                       },
//                     );       
//                   },  
//         );
//       },),
//     );
//     // Consumer<PlaylistProvider>(builder:(
//     //   context, playlistProvider, child) {
//     //     final playlist1 = playlistProvider.playlist1;
//     //     return Scaffold(
//     //       appBar: AppBar(
//     //         title: Text("P L A Y L I S T"),
//     //       ),
//     //       // ignore: deprecated_member_use
//     //       backgroundColor: Theme.of(context).colorScheme.background,
//     //       bottomNavigationBar: BottomNavigationBar(
//     //       currentIndex: 1,
//     //       selectedItemColor: Theme.of(context).colorScheme.secondary,  
//     //       items:[ 
//     //       BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//     //       BottomNavigationBarItem(icon: Icon(Icons.playlist_play_sharp), 
//     //       label: "Playlist"
//     //       ),],
//     //       onTap: (int index){
//     //         if(index == 1){
//     //           return null;
//     //         }else{
//     //           Navigator.pop(context);
//     //         }
//     //       },
//     //       ),
//     //       body: Column(
//     //         children: [
//     //           SizedBox(height: 10,),
//     //           Expanded(
//     //             child: ListView.builder(
//     //               itemCount: playlist1.length,
//     //               itemBuilder: (context, index) {
//     //                 final song = playlist1[index];
//     //                 return ListTile(
//     //                   title: Text(song.songName),
//     //                   subtitle: Text(song.artistName),
//     //                   leading: Image.asset(song.songImage),
//     //                   trailing: IconButton(
//     //                   onPressed: (){
//     //                     playlistProvider.removeSongFromPlaylist(index);
//     //                   }, 
//     //                   icon: Icon(Icons.delete)),
//     //                   onTap: () {
//     //                     playlistProvider.playSongAtIndex(playlist1.indexWhere((element) {
//     //                       return element.songName == song.songName;
//     //                     },));
//     //                     Navigator.push(
//     //                       context,
//     //                       MaterialPageRoute(
//     //                         builder: (context) => SongPage(),
//     //                       ),
//     //                     );
//     //                   },
//     //                 );
//     //               },
//     //             ),
//     //           ),
//     //         ],
//     //       ),
//     //     );
//     //   });
//   }
// }