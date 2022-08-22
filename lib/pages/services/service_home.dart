import 'package:flutter/material.dart';
import 'package:madmooon/compount/appBar.dart';
import '../../colors.dart';
import 'Service_Home_Body.dart';



class Service_Home extends StatefulWidget {
  const Service_Home({Key? key}) : super(key: key);

  @override
  _Service_HomeState createState() => _Service_HomeState();
}

class _Service_HomeState extends State<Service_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTextColor ,

      appBar: homeAppBar("الخدمات"),
      body: Service_Home_Body(),

    );
  }
}

