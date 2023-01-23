import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: Colors.red.shade400,
        centerTitle: true,
        toolbarHeight: 60,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(7),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    hintText: 'Search for item...',
                    suffixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Color.fromARGB(204, 214, 221, 221),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none)),
              ),
              SizedBox(
                height: 13,
              ),
              Row(
                children: <Widget>[
                  Text(''),
                  Container(
                    child: Image.asset(
                      'assets/images/one.png',
                      height: 100,
                      scale: 2.5,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
