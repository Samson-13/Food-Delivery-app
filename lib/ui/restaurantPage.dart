import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:receipies/models/imageModel.dart';

import '../models/restaurant.dart';

class RestaurantPage extends StatefulWidget {
  final RestaurantModel restaurantInfo;
  const RestaurantPage({required this.restaurantInfo, super.key});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {

  List<ImageModel> imageslider = [];

  final imagesliderRef = FirebaseFirestore.instance
      .collection("imageslider")
      .limit(30)
      .withConverter<ImageModel>(
    fromFirestore: (data, snap) {
      return ImageModel.fromMap(data.data()!);
    },
    toFirestore: (data, snap) {
      return data.toMap();
    },
  );

  void listenData() async {
    imagesliderRef.snapshots().listen((event) {
      imageslider.clear();
      for (var element in event.docs) {
        imageslider.add(element.data());
      }
      setState(() {});
    });
    // log("firestoreResult: ${firestoreResult.docs.length}");
  }

  void readData() async {
    final firestoreResult = await imagesliderRef.get();
    log("firestoreResult: ${firestoreResult.docs.length}");
    for (var element in firestoreResult.docs) {
      imageslider.add(element.data());
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
          title:  Text(
            widget.restaurantInfo.restaurantName,
            style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.black87),
          ),
          foregroundColor: Colors.black,
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 3,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(17)
            
          ),
          
          child: Column(
            children: <Widget>[
              Text(
                  widget.restaurantInfo.restaurantName, 
                  style: const TextStyle(
              fontSize: 24, 
              fontWeight: FontWeight.w500
              ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(   
                ),
                child: CarouselSlider(
                options: CarouselOptions(height: 400.0),
                items: ["https://img-global.cpcdn.com/recipes/da3ff92027142076/1200x630cq70/photo.jpg",
                "https://img-global.cpcdn.com/recipes/da3ff92027142076/1200x630cq70/photo.jpg",
                "https://img-global.cpcdn.com/recipes/da3ff92027142076/1200x630cq70/photo.jpg"].map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.amber
                        ),
                        child:Image.network(item)
        );
      },
    );
}).toList(),
)
              ),
            ],
          ),
        ),
        
    );
  }
}
