import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:receipies/ui/settingsPage.dart';
import 'package:receipies/ui/timerPage.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textController = TextEditingController();

  // Bottom Navbar
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    TimerPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: const Text(
            ' Home',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.black87),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 3,
        ),
        body: Center(
            child: Container(
          margin: const EdgeInsets.all(7),
          child: Column(
            children: [
              const SizedBox(
                height: 13,
              ),
              _buildSearchbarAnimation(),
              const SizedBox(
                height: 13,
              ),
              const Divider(
                height: 12,
                thickness: 2,
              ),
              Row(
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Momos corner',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text('Snacks, Chinese, Biryani'),
                      Text('Aizawl - 3.0 K.M')
                    ],
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 94.3),
                      child: Image.asset(
                        'assets/images/one.jpg',
                        height: 100,
                        scale: 2.5,
                      ),
                    ),
                  )
                ],
              ),
              const Divider(
                height: 12,
                thickness: 2,
              ),
            ],
          ),
        )));
  }
}

Widget _buildSearchbarAnimation() {
  return SafeArea(
      child: TextField(
    decoration: InputDecoration(
        hintText: 'Search for item...',
        suffixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Color.fromARGB(204, 230, 233, 233),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none)),
  ));
}
