import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';



class Animal {
  final String name;
  final String imageUrl;
  final String soundUrl;

  Animal({
    required this.name,
    required this.imageUrl,
    required this.soundUrl,
  });
}

class ChiffAr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Animal Sounds',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimalListScreen(),
    );
  }
}

class AnimalListScreen extends StatelessWidget {
  final List<Animal> animals = [
    Animal(
      name: 'Bald Eagle',
      imageUrl:
          'https://seaworld.org/-/media/seaworld-dotorg/images/animal-bytes/listing-images/bgt-animals/2017_buschgardenstampabay_animals_baldeagle_357x229.ashx?version=1_201811131406R',
      soundUrl:
          'https://seaworld.org/-/media/seaworld-dotorg/audio-files/sound-library/bald-eagle_2.ashx?version=1_201811134821&la=en&hash=858BD7D49FB66CE64C20E9AD26F308C2840CD4DDRR',
    ),
    Animal(
      name: 'Bear',
      imageUrl:
          'https://seaworld.org/-/media/seaworld-dotorg/images/landing-pages/animal-sounds/cinnamon_bear_357x229.ashx?version=1_201811282449',
      soundUrl: 'https://example.com/dog_sound.mp3',
    ),
    Animal(
      name: 'African Lion',
      imageUrl:
          'https://seaworld.org/-/media/seaworld-dotorg/images/animal-bytes/listing-images/mammals/african_lion_357x229.ashx?version=1_201811273259',
      soundUrl:
          'https://seaworld.org/-/media/seaworld-dotorg/audio-files/sound-library/bald-eagle_2.ashx?version=1_201811134821&la=en&hash=858BD7D49FB66CE64C20E9AD26F308C2840CD4DDRR',
    ),
    Animal(
      name: 'Cat (Domestic)',
      imageUrl:
          'https://seaworld.org/-/media/seaworld-dotorg/images/landing-pages/animal-sounds/cat_357x229.ashx?version=1_201811282450',
      soundUrl: 'https://example.com/dog_sound.mp3',
    ),
    Animal(
      name: 'Dog (Domestic)',
      imageUrl:
          'https://seaworld.org/-/media/seaworld-dotorg/images/landing-pages/animal-sounds/dog_357x229.ashx?version=1_201811282450',
      soundUrl: 'https://example.com/dog_sound.mp3',
    ),
    Animal(
      name: 'Bengal Tiger',
      imageUrl:
          'https://seaworld.org/-/media/seaworld-dotorg/images/animal-bytes/listing-images/mammals/bengal_tiger_357x229.ashx?version=1_201811273254',
      soundUrl: 'https://example.com/dog_sound.mp3',
    ),
    Animal(
      name: 'Lowland Gorilla',
      imageUrl:
          'https://seaworld.org/-/media/seaworld-dotorg/images/animal-bytes/listing-images/bgt-animals/2017_buschgardenstampabay_animals_gorillas4_357x229.ashx?version=1_201811131400',
      soundUrl: 'https://example.com/dog_sound.mp3',
    ),
    Animal(
      name: 'Falcon',
      imageUrl:
          'https://seaworld.org/-/media/seaworld-dotorg/images/landing-pages/animal-sounds/falcon_357x229.ashx?version=1_201811282450',
      soundUrl: 'https://example.com/dog_sound.mp3',
    ),
     Animal(
      name: 'Frog',
      imageUrl:
          'https://seaworld.org/-/media/seaworld-dotorg/images/landing-pages/animal-sounds/frog_357x229.ashx?version=1_201811282450',
      soundUrl: 'https://example.com/dog_sound.mp3',
    ),
    // Ajoutez autant d'animaux que vous le souhaitez avec leurs URL d'image et de son correspondantes
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animal Sounds'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 tuiles par ligne
          crossAxisSpacing: 8, // Espacement horizontal entre les tuiles
          mainAxisSpacing: 8, // Espacement vertical entre les tuiles
        ),
        itemCount: animals.length,
        itemBuilder: (context, index) {
          Animal animal = animals[index];
          return AnimalTile(animal: animal);
        },
      ),
    );
  }
}

class AnimalTile extends StatelessWidget {
  final Animal animal;

  const AnimalTile({required this.animal});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _playSound(context, animal.soundUrl),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.network(
                  animal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              color: Colors.blue, // Couleur de fond pour le titre
              child: Text(
                animal.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Couleur du texte
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _playSound(BuildContext context, String soundUrl) {
    AudioCache player = AudioCache();
    player.play(soundUrl);
  }
}
