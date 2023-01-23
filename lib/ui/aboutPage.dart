import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text(
          ' About the app',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 3,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Delivering your Foods with Love..',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
