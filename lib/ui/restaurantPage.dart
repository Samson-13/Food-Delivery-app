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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text(
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
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(17)),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(),
                child: CarouselSlider(
                  options: CarouselOptions(height: 400.0),
                  items: [
                    "https://images.unsplash.com/photo-1585937421612-70a008356fbe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=736&q=80",
                    "https://images.unsplash.com/photo-1623689045624-997891833bf7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=689&q=80",
                    "https://images.unsplash.com/photo-1596797038530-2c107229654b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80",
                    "https://images.unsplash.com/photo-1526318896980-cf78c088247c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                    "https://images.unsplash.com/photo-1552611052-33e04de081de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80",
                    "https://images.unsplash.com/photo-1511910849309-0dffb8785146?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
                  ].map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: Image.network(item));
                      },
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                height: 13,
                thickness: 3,
              ),
              Text(
                widget.restaurantInfo.restaurantDetails,
                style: const TextStyle(fontSize: 19),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  const Text('Dishes: ',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
                  Text(
                    widget.restaurantInfo.restaurantDescription,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                height: 13,
                thickness: 1,
              ),
              Row(
                children: const [
                  Text(
                    'Details:',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              Row(children: <Widget>[
                const Text(
                  'Location: ',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                ),
                Text(
                  widget.restaurantInfo.restaurantLocation,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w500),
                )
              ]),
              const SizedBox(
                height: 4,
              ),
              Row(children: <Widget>[
                const Text(
                  'Phone number: ',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                ),
                Text(
                  widget.restaurantInfo.restaurantPhone,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ]),
              const SizedBox(
                height: 26,
              ),
              const Divider(
                height: 12,
                thickness: 3,
              ),
              const Text(
                'Items:',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
              Container(
                margin: EdgeInsets.zero,
                child: Column(
                  children: <Widget>[
                    Text(widget.restaurantInfo.menu1),
                    Text(widget.restaurantInfo.menu2),
                    Text(widget.restaurantInfo.menu3),
                    Text(widget.restaurantInfo.menu4),
                    Text(widget.restaurantInfo.menu5),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('table')),
            ],
          ),
        ),
      ),
    );
  }
}
