import 'package:flutter/material.dart';
import 'package:madmooon/compount/appBar.dart';
import 'package:madmooon/compount/mydrawer.dart';
import '../../colors.dart';
import 'home_types.dart';
import 'requst_home_body.dart';



class Requst_Home extends StatefulWidget {
  const Requst_Home({Key? key}) : super(key: key);

  @override
  _Requst_HomeState createState() => _Requst_HomeState();
}

class _Requst_HomeState extends State<Requst_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTextColor ,

      appBar: homeAppBar("الطلبات"),
      body: HomeType(),
      drawer:  Mydrawer(),

    );
  }
}

