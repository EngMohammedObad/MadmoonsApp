import 'package:flutter/material.dart';

class Splach_Screen extends StatefulWidget {
  const Splach_Screen({Key? key}) : super(key: key);

  @override
  _Splach_ScreenState createState() => _Splach_ScreenState();
}

class _Splach_ScreenState extends State<Splach_Screen> {

  @override
  void initState() {

    First_page();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(5),
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image:AssetImage('images/Splach_Screen/splash.png'),
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }

  Future<void> First_page() async {
    Future<void>content = Future.delayed(Duration(seconds: 1), () {
      return Navigator.of(context).pushNamedAndRemoveUntil(
          "Home", (Route<dynamic>route) => false);

    });
  }
}
