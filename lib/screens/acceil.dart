import 'package:flutter/material.dart';
import 'package:flutter_application_formatiom/screens/appdata.dart';
import 'package:flutter_application_formatiom/screens/catagoryitem.dart';
import 'package:flutter_application_formatiom/screens/catagorylist.dart';
import 'package:flutter_application_formatiom/screens/login_screen.dart';
import 'package:flutter_application_formatiom/screens/loginens.dart';

class MyAppp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Tout apprendre",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Text(
              "Apprenez avec plaisir, où que vous soyez !",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: typeUser
                  .map(
                    (CategoryData) => CategoryItem(CategoryData.id,
                        CategoryData.title, CategoryData.imageUrl, () {
                      if (CategoryData.id == "C1") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      } else if (CategoryData.id == "C2") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen1(),
                          ),
                        );
                      }
                    }),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
