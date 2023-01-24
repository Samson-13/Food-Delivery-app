import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:receipies/models/restaurant.dart';
import 'package:receipies/ui/settingsPage.dart';
import 'package:receipies/ui/timerPage.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
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
        body: ListView.builder(
            itemCount: restaurant.length,
            itemBuilder: (context, index) {
              var item = restaurant[index];
              return Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Row(children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          item.restaurantName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(item.restaurantDescription),
                        Text("3.0 K.M")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.network(
                          item.restauranImage!,
                          width: 200,
                          height: 100,
                        ),
                      ],
                    )
                  ]),
                ),
              );
            }));
  }
}