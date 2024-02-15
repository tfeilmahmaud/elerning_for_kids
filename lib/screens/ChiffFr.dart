import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

// void main() {
//   runApp(MyApp());
// }

class MyApp5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Number Sounds',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NumberListScreen(),
    );
  }
}

class NumberListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Sounds'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 tuiles par ligne
          crossAxisSpacing: 8, // Espacement horizontal entre les tuiles
          mainAxisSpacing: 8, // Espacement vertical entre les tuiles
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          int number = index + 1;
          return NumberTile(number: number);
        },
      ),
    );
  }
}

class NumberTile extends StatelessWidget {
  final int number;

  const NumberTile({required this.number});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _playSound(context),
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _getTileColor(
              number), // Couleur de la carte en fonction du numéro
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            '$number',
            style: TextStyle(
              fontSize: 64, // Taille de la police agrandie
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic, // Police italique
              color: Colors.black, // Couleur du texte noire
              letterSpacing: 4.0,
            ),
          ),
        ),
      ),
    );
  }

  void _playSound(BuildContext context) {
    AudioCache player = AudioCache();
    String soundPath = 'audio/kid-$number.mp3';
    player.play(soundPath);
  }

  Color _getTileColor(int number) {
    // Liste de couleurs pour les cartes
    List<Color> colors = [
      Colors.blue,
      Colors.green,
      Colors.red,
      Colors.orange,
      Colors.purple,
      Colors.yellow,
      Colors.teal,
      Colors.pink,
      Colors.indigo,
      Colors.cyan,
      Colors.amber,
      Colors.brown,
      Colors.lime,
      Colors.deepOrange,
      Colors.lightBlue,
      Colors.deepPurple,
      Colors.lightGreen,
      Colors.grey,
      Colors.blueGrey,
      Colors.black,
    ];
    return colors[(number - 1) %
        colors.length]; // Associer chaque nombre à une couleur de la liste
  }
}
