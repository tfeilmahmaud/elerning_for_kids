// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_import

import 'package:flutter_application_formatiom/screens/level.dart';

import 'catagory.dart';
import 'appdata.dart';
import 'catagoryitem.dart';
import 'package:flutter/material.dart';

class HomScreen extends StatefulWidget {
  const HomScreen({Key? key}) : super(key: key);

  @override
  State<HomScreen> createState() => _HomScreenState();
}

class _HomScreenState extends State<HomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Level "),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: Category_data.map(
          (CategoryData) => CategoryItem(
              CategoryData.id, CategoryData.title, CategoryData.imageUrl, () {
            if (CategoryData.id == "C1") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoriesPage(),
                ),
              );
            }
          }),
        ).toList(),
      ),
    );
  }
}
