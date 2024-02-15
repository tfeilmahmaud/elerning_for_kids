import 'package:flutter/material.dart';
import 'package:flutter_application_formatiom/screens/acceil.dart';
import 'package:flutter_application_formatiom/screens/ChiffFr.dart';
import 'package:flutter_application_formatiom/screens/first_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_formatiom/screens/home_screen.dart';
import 'package:flutter_application_formatiom/screens/level.dart';
import 'package:flutter_application_formatiom/screens/main_screen.dart';
import 'package:flutter_application_formatiom/screens/profileEns.dart';
import 'package:flutter_application_formatiom/screens/quize.dart';
import 'package:flutter_application_formatiom/screens/ChiffAr.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false, home: MyAppp());
  }
}
