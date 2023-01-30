import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:receipies/models/category.dart';
import 'package:receipies/ui/restaurantPage.dart';

import 'categoryFilterPage.dart';
import '../home_main/homePage.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  TextEditingController textController = TextEditingController();
  List<CategoryModel> category = [];

  final categoryRef = FirebaseFirestore.instance
      .collection("category")
      .limit(30)
      .withConverter<CategoryModel>(
    fromFirestore: (data, snap) {
      return CategoryModel.fromMap(data.data()!);
    },
    toFirestore: (data, snap) {
      return data.toMap();
    },
  );

  void listenData() async {
    categoryRef.snapshots().listen((event) {
      category.clear();
      for (var element in event.docs) {
        category.add(element.data());
      }
      setState(() {});
    });
    // log("firestoreResult: ${firestoreResult.docs.length}");
  }

  void readData() async {
    final firestoreResult = await categoryRef.get();
    log("firestoreResult: ${firestoreResult.docs.length}");
    for (var element in firestoreResult.docs) {
      category.add(element.data());
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
    // t
    //
    //ah hian initial data fetch nan hman ani thin
      // Bottom Navbar
 
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CategoryPage(),

  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: const Text(
            ' Categories',
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
            itemCount: category.length,
            itemBuilder: (context, index) {
              var item = category[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CategoryFilterPage()),
                  );
                },
                child: Card(
                  elevation: 3,
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                item.categoryName,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                item.categoryDescription,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Image.network(
                              item.categoryImage,
                              scale: 1.5,
                              width: 150,
                              height: 100,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
            
      ),
    );
  }
}
