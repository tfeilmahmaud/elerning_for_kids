import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Quiz audio',
//       home: QuizPage(),
//     );
//   }
// }

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  AudioPlayer audioPlayer = AudioPlayer();
  List<int> options = [];
  int correctAnswer = 0;
  int score = 0;
  int totalQuestions = 5;
  int currentQuestion = 0;

  @override
  void initState() {
    super.initState();
    _loadQuestion();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void _loadQuestion() async {
    int correctAnswer =
        Random().nextInt(10); // Générer un nombre aléatoire de 0 à 9
    options = _generateOptions(correctAnswer);
    String audioPath =
        'assets/audio/audio.mp3'; // Chemin vers l'enregistrement audio correspondant
    await _playAudio(audioPath);
    setState(() {
      this.correctAnswer = correctAnswer;
    });
  }

  List<int> _generateOptions(int correctAnswer) {
    List<int> options = [correctAnswer];
    while (options.length < 2) {
      int randomNumber =
          Random().nextInt(10); // Générer un autre nombre aléatoire de 0 à 9
      if (!options.contains(randomNumber)) {
        options.add(randomNumber);
      }
    }
    options.shuffle(); // Mélanger les options
    return options;
  }

  Future<void> _playAudio(String audioPath) async {
    ByteData audioData = await rootBundle.load(audioPath);
    Directory tempDir = await getTemporaryDirectory();
    File tempFile = File('${tempDir.path}/temp_audio.mp3');
    await tempFile.writeAsBytes(audioData.buffer.asUint8List(), flush: true);
    await audioPlayer.play(tempFile.path );
  }

  void _checkAnswer(int selectedAnswer) {
    if (selectedAnswer == correctAnswer) {
      setState(() {
        score++;
      });
    }
    currentQuestion++;
    if (currentQuestion < totalQuestions) {
      _loadQuestion();
    } else {
      _showResultDialog();
    }
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Résultat'),
          content: Text('Votre score : $score / $totalQuestions'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  score = 0;
                  currentQuestion = 0;
                });
                _loadQuestion();
              },
              child: Text('Recommencer'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz audio des chiffres en français'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Question ${currentQuestion + 1} / $totalQuestions',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Écoutez l\'audio et sélectionnez le chiffre entendu :',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              itemCount: options.length,
              itemBuilder: (context, index) {
                int option = options[index];
                return ElevatedButton(
                  onPressed: () {
                    _checkAnswer(option);
                  },
                  child: Text(
                    option.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
