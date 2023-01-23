import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:receipies/models/restaurant.dart';
import 'package:receipies/ui/settingsPage.dart';
import 'package:receipies/ui/timerPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textController = TextEditingController();
  List<RestaurantModel> restaurant = [];

  final restaurantRef = FirebaseFirestore.instance
      .collection("restaurant")
      .limit(30)
      .withConverter<RestaurantModel>(
    fromFirestore: (data, snap) {
      return RestaurantModel.fromMap(data.data()!);
    },
    toFirestore: (data, snap) {
      return data.toMap();
    },
  );

  void listenData() async {
    restaurantRef.snapshots().listen((event) {
      restaurant.clear();
      for (var element in event.docs) {
        restaurant.add(element.data());
      }
      setState(() {});
    });
    // log("firestoreResult: ${firestoreResult.docs.length}");
  }

  void readData() async {
    final firestoreResult = await restaurantRef.get();
    log("firestoreResult: ${firestoreResult.docs.length}");
    for (var element in firestoreResult.docs) {
      restaurant.add(element.data());
    }
    setState(() {});
    // final result = await box.read("todos");
    // if (result != null) {
    //   List data = result;
    //   for (var element in data) {
    //     Map<String, dynamic> js = element;
    //     TodoModel model = TodoModel.fromMap(js);
    //     todos.add(model);
    //   }
    //   setState(() {});
    // }
  }

  @override
  void initState() {
    super.initState();
    // readData();
    listenData();
    //page a in create thar veleh a in call a, page in refresh pangai ah a in call nawn lo
    // tah hian initial data fetch nan hman ani thin
  }

 

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
        body: Container(
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
        ));
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
