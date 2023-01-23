import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _Tabbar1 extends StatelessWidget {
  const _Tabbar1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Tabbar 1 build");

    return Scaffold(
      appBar: AppBar(title: const Text("Tab bar 1")),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${index + 1}"),
          );
        },
        itemCount: 50,
      ),
    );
  }
}
