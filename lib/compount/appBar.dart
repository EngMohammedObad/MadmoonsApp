import 'package:flutter/material.dart';

import '../colors.dart';
import 'mydrawer.dart';

AppBar homeAppBar(String title) {
  return AppBar(
    backgroundColor:colorparent,
    elevation: 0,
    title: Text(
      title,style: TextStyle(fontSize: 24),


    ),
    centerTitle: true,
    actions: [
      IconButton(
        icon: Icon(Icons.notifications),
        onPressed: () {

        },
      ),
    ],
  );
}
SliverAppBar sliverAppBar(String title) {
  return SliverAppBar(
    expandedHeight: 150.0,
    flexibleSpace: const FlexibleSpaceBar(
      title: Text('Available seats'),
    ),
    backgroundColor:colorparent,
    elevation: 0,
    title: Text(
      title,style: TextStyle(fontSize: 24),


    ),
    centerTitle: true,
    actions: [
      IconButton(
        icon: Icon(Icons.notifications),
        onPressed: () {

        },
      ),
    ],
  );
}