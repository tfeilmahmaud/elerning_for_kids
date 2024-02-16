import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

// void main() {
//   runApp(MyApp());
// }

class MyApp9 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alphabet Sounds',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AlphabetListScreen(),
    );
  }
}

class AlphabetListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context)
                .pop(); // Utilisation de Navigator pour revenir en arrière
          },
        ),
        title: Text('Alphabet Sounds'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 tuiles par ligne
          crossAxisSpacing: 8, // Espacement horizontal entre les tuiles
          mainAxisSpacing: 8, // Espacement vertical entre les tuiles
        ),
        itemCount: 28, // Nombre total d'alphabets arabes
        itemBuilder: (context, index) {
          String arabicLetter =
              String.fromCharCode(1575 + index); // Unicode des lettres arabes
          return AlphabetTile(alphabet: arabicLetter);
        },
      ),
    );
  }
}

class AlphabetTile extends StatelessWidget {
  final String alphabet;

  const AlphabetTile({required this.alphabet});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _playSound(
          context, alphabet), // Passer l'alphabet à la méthode _playSound
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _getTileColor(
              alphabet), // Couleur de la carte en fonction de l'alphabet
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
            alphabet,
            style: const TextStyle(
              fontSize: 64, // Taille de la police agrandie
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic, // Police italique
              color: Colors.white, // Couleur du texte noire
              letterSpacing: 4.0,
            ),
          ),
        ),
      ),
    );
  }

  void _playSound(BuildContext context, String alphabet) {
    AudioCache player = AudioCache();
    String soundPath =
        'assets/Ar/$alphabet.mp3'; // Chemin correct vers votre fichier audio
    player.play(soundPath);
  }

  Color _getTileColor(String alphabet) {
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
    return colors[alphabet.codeUnitAt(0) %
        colors.length]; // Associer chaque alphabet à une couleur de la liste
  }
}
