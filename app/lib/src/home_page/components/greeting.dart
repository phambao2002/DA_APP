import 'package:flutter/material.dart';

class GreetingSection extends SliverFixedExtentList {
  GreetingSection(double height, {Key? key})
      : super(
          key: key,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, index) {
              return Scaffold(
                appBar: AppBar(
                  title: Row(
                    children: [
                      Icon(
                        Icons.energy_savings_leaf,
                        size: 60,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        "Camera",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                  centerTitle: true,
                  toolbarHeight: 600,
                ),
              );
            },
            childCount: 1,
          ),
          itemExtent: height,
        );
}
