// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   final player = AudioPlayer();
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('AudioPlayer Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             playSound();
//           },
//           child: Text("Play Sound"),
//         ),
//       ),
//     );
//   }

//   AudioPlayer audioPlayer = AudioPlayer();

//   Future<void> playSound() async {
//     String soundPath =
//         'audio/audio.mp3'; //You don't need to include assets/ because AssetSource assume that you have sound in your assets folder.
//     await player.play(AssetSource(soundPath));
//   }
// }
