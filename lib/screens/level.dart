import 'package:flutter/material.dart';
import 'package:flutter_application_formatiom/screens/ChiffAr.dart';
import 'package:flutter_application_formatiom/screens/ChiffFr.dart';
import 'package:flutter_application_formatiom/screens/LettreFr.dart';
import 'package:flutter_application_formatiom/screens/lettreAr.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Category Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CategoriesPage(),
    );
  }
}

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catégories'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CategoryCard(
                  title: 'Lettres en Français',
                  subTitle: 'A, B, C, ...',
                  backgroundImage: 'assets/images/jiji.jpg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyApp7(), // Corrected class name
                      ),
                    );
                  },
                ),

                SizedBox(width: 20), // Espacement entre les catégories
                CategoryCard(
                  title: 'Chiffres en Français',
                  subTitle: '1, 2, ...',
                  backgroundImage: 'assets/images/lettrefr.jpg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp5()),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20), // Espacement entre les lignes
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CategoryCard(
                  title: 'Lettres en Arabe',
                  subTitle: 'ا, ب, ت, ...',
                  backgroundImage: 'assets/images/7uruv.jpg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp9()),
                    );
                  },
                ),
                SizedBox(width: 20), // Espacement entre les catégories
                CategoryCard(
                  title: 'Chiffres en Arabe',
                  subTitle: '٠, ١, ٢, ...',
                  backgroundImage: 'assets/images/er9am.jpg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChiffAr()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String backgroundImage;
  final Function()? onTap;

  const CategoryCard({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.backgroundImage,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              width: 150, // Largeur fixe pour chaque catégorie
              height: 150, // Hauteur fixe pour chaque catégorie
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(backgroundImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10), // Espacement entre l'image et le titre
            Text(
              title,
              style: TextStyle(
                color: Colors.black, // Couleur du texte en noir
                fontWeight: FontWeight.bold,
                fontSize: 16, // Taille de la police
              ),
            ),
            SizedBox(height: 5), // Espacement entre le titre et le sous-titre
            Text(
              subTitle,
              style: TextStyle(color: Colors.black), // Couleur du texte en noir
            ),
          ],
        ),
      ),
    );
  }
}

// Définissez vos autres pages ici (FrenchLettersPage, FrenchNumbersPage, ArabicLettersPage, ArabicNumbersPage)
