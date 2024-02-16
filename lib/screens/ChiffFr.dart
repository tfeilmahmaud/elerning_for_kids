import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Retour à la page précédente
          },
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          int number = index + 1;
          return NumberTile(number: number);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => Activite15()));
        },
        child: Icon(Icons.quiz), // Icône pour le bouton de quiz
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
          color: _getTileColor(number),
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
              fontSize: 64,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
              color: Colors.black,
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
    return colors[(number - 1) % colors.length];
  }
}



class Activite15 extends StatefulWidget {
  const Activite15({Key? key}) : super(key: key);

  @override
  _Activite15State createState() => _Activite15State();
}

class _Activite15State extends State<Activite15> {
  late List<String> numberWords = [
    'Un',
    'Deux',
    'Trois',
    'Quatre',
    'Cinq',
    'Six',
    'Sept',
    'Huit',
    'Neuf',
    'Dix',
  ];
  late List<int> numbers = List.generate(10, (index) => index + 1);
  late Map<int, String> numberMap = Map.fromIterables(numbers, numberWords);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quiz : Chiffres en Lettres',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 49, 73, 80),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: numbers.length,
          itemBuilder: (context, index) {
            return buildQuestion(numbers[index]);
          },
        ),
      ),
    );
  }

  Widget buildQuestion(int number) {
    String answer = numberMap[number]!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          showAnswerDialog(number, answer);
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(16.0),
          primary: Colors.blue,
        ),
        child: Text(
          'Quel est le chiffre $answer en chiffres ?',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void showAnswerDialog(int number, String answer) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Quel est le chiffre $answer en chiffres ?',
            textAlign: TextAlign.center,
          ),
          content: TextField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'Entrez votre réponse',
            ),
            onChanged: (input) {
              if (input.isNotEmpty) {
                int parsedInput = int.tryParse(input) ?? -1;
                if (parsedInput == number) {
                  showResultDialog(true);
                } else {
                  showResultDialog(false);
                }
              }
            },
          ),
        );
      },
    );
  }

  void showResultDialog(bool isCorrect) {
    String message = isCorrect ? 'Correct !' : 'Incorrect !';
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            message,
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      home: const Activite15(),
    );
  }
}


