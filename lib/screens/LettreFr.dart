import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

// void main() {
//   runApp(MyApp());
// }

class MyApp7 extends StatelessWidget {
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
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 tuiles par ligne
          crossAxisSpacing: 8, // Espacement horizontal entre les tuiles
          mainAxisSpacing: 8, // Espacement vertical entre les tuiles
        ),
        itemCount: 26, // Nombre total d'alphabets
        itemBuilder: (context, index) {
          String alphabet = String.fromCharCode(index + 65); // Convertir l'index en alphabet ASCII
          return AlphabetTile(alphabet: alphabet);

        },
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => MyApp()));
        },
        child: Icon(Icons.quiz), // Icône pour le bouton de quiz
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
      onTap: () => _playSound(context),
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _getTileColor(alphabet), // Couleur de la carte en fonction de l'alphabet
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
    // Vous devrez ajouter les fichiers audio correspondant aux alphabets dans votre dossier audio
    AudioCache player = AudioCache();
    String soundPath = 'Fr/kid-$alphabet.mp3';
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
    return colors[alphabet.codeUnitAt(0) % colors.length]; // Associer chaque alphabet à une couleur de la liste
  }
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercice de Mots',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WordExercise(),
    );
  }
}

class WordExercise extends StatefulWidget {
  @override
  _WordExerciseState createState() => _WordExerciseState();
}

class _WordExerciseState extends State<WordExercise> {
  final String targetWord = "FLUTTER";
  List<String> selectedLetters = List.filled(7, '');
  List<String> availableLetters = ['F', 'L', 'U', 'T', 'T', 'E', 'R'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice de Mots'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Reliez les lettres pour former le mot correct :',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                targetWord.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedLetters[index] = '';
                    });
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      border: Border.all(),
                    ),
                    alignment: Alignment.center,
                    child: Text(selectedLetters[index]),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: availableLetters
                  .map(
                    (letter) => GestureDetector(
                      onTap: () {
                        setState(() {
                          final emptyIndex = selectedLetters.indexOf('');
                          if (emptyIndex != -1) {
                            selectedLetters[emptyIndex] = letter;
                          }
                        });
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          border: Border.all(),
                        ),
                        alignment: Alignment.center,
                        child: Text(letter),
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String selectedWord = selectedLetters.join();
                if (selectedWord == targetWord) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Félicitations!'),
                        content: Text(
                            'Vous avez correctement formé le mot $targetWord.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Essayez à nouveau!'),
                        content: Text(
                            'Le mot que vous avez formé n\'est pas correct. Veuillez réessayer.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Vérifier'),
            ),
          ],
        ),
      ),
    );
  }
}