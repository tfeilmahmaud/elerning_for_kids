import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  final MainController controller = Get.put(MainController());

  List<Item> items = [
    Item("Home", Icons.home),
    Item("Search", Icons.search),
    Item("Profile", Icons.person),
  ];

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 5,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(fontSize: 32, color: Colors.pink),
          title: Text(items[controller.selectedIndex.value].title),
        ),
        body: controller.pages[controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: controller.onItemTapped,
            items: items
                .map((item) => BottomNavigationBarItem(
                      icon: Icon(item.icon),
                      label: item.title,
                    ))
                .toList()),
      ),
    );
  }
}

class Item {
  String title;
  IconData icon;
  Item(this.title, this.icon);
}
