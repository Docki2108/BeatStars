// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';

// class Player extends StatefulWidget {
//   @override
//   _PlayerState createState() => _PlayerState();
// }

// class _PlayerState extends State<Player> {
//   var _audioPlayer;

//   @override
//   void initState() {
//     super.initState();
//     _audioPlayer = AudioPlayer();

//     // Set a sequence of audio sources that will be played by the audio player.
//     _audioPlayer
//         .setAudioSource(ConcatenatingAudioSource(children: [
//       AudioSource.uri(Uri.parse(
//           "https://archive.org/download/IGM-V7/IGM%20-%20Vol.%207/25%20Diablo%20-%20Tristram%20%28Blizzard%29.mp3")),
//       AudioSource.uri(Uri.parse(
//           "https://archive.org/download/igm-v8_202101/IGM%20-%20Vol.%208/15%20Pokemon%20Red%20-%20Cerulean%20City%20%28Game%20Freak%29.mp3")),
//       AudioSource.uri(Uri.parse(
//           "https://scummbar.com/mi2/MI1-CD/01%20-%20Opening%20Themes%20-%20Introduction.mp3")),
//     ]))
//         .catchError((error) {
//       // catch load errors: 404, invalid url ...
//       print("An error occured $error");
//     });
//   }

//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: StreamBuilder<PlayerState>(
//           stream: _audioPlayer.playerStateStream,
//           builder: (context, snapshot) {
//             final playerState = snapshot.data;
//             return _playerButton(playerState!);
//           },
//         ),
//       ),
//     );
//   }

//   Widget _playerButton(PlayerState playerState) {
//     // 1
//     final processingState = playerState.processingState;
//     if (processingState == ProcessingState.loading ||
//         processingState == ProcessingState.buffering) {
//       // 2
//       return Container(
//         margin: EdgeInsets.all(8.0),
//         width: 64.0,
//         height: 64.0,
//         child: CircularProgressIndicator(),
//       );
//     } else if (_audioPlayer.playing != true) {
//       // 3
//       return IconButton(
//         icon: Icon(Icons.play_arrow),
//         iconSize: 64.0,
//         onPressed: _audioPlayer.play,
//       );
//     } else if (processingState != ProcessingState.completed) {
//       // 4
//       return IconButton(
//         icon: Icon(Icons.pause),
//         iconSize: 64.0,
//         onPressed: _audioPlayer.pause,
//       );
//     } else {
//       // 5
//       return IconButton(
//         icon: Icon(Icons.replay),
//         iconSize: 64.0,
//         onPressed: () => _audioPlayer.seek(Duration.zero,
//             index: _audioPlayer.effectiveIndices.first),
//       );
//     }
//   }
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Player(),
//     );
//   }
// }
