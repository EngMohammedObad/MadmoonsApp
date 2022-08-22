
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_launch/flutter_launch.dart';


class packgeflutter extends StatefulWidget {




  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<packgeflutter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextButton(onPressed: () {calling();}, child: Text(" Phone call")),
                TextButton(onPressed: () {sms();}, child: Text(" Send sms")),
                TextButton(onPressed: () {email();}, child: Text(" Send Email")),
                TextButton(onPressed: () {whatsappp();}, child: Icon(Icons.whatsapp)),
                TextButton(onPressed: () {messenger();}, child: Text(" Facebook messenger")),
              ],
            ),
          )),
    );
  }

  calling()async{
    const url = 'tel:+966544140910';
    if( await canLaunch(url)){
      await launch(url);
    }else{
      throw 'Could not launch $url';
    }
  }
  // void whatsAppOpen() async {
  //   bool whatsapp = await FlutterLaunch.hasApp(name: "whatsapp");
  //
  //   if (whatsapp) {
  //     await FlutterLaunch.launchWhatsapp(
  //         phone: "+966544140910", message: "Hello, flutter_launch");
  //   } else {
  //
  //   }
  // }
  //https://wa.me/+966544140910
  //whatsapp://send?phone=+966544140910


  messenger()async{
    const url = "http://m.me/xyzchannelxyz";
    if( await canLaunch(url)){
      await launch(url);
    }else{
      throw 'Could not launch $url';
    }
  }
  whatsappp()async{

    const url ="whatsapp://send?phone=+967775372937";
    if( await canLaunch(url)){
      await launch(url);
    }else{
      throw 'Could not launch $url';
    }
  }

  sms()async{
    const url = 'sms:+966544140910';

    if( await canLaunch(url)){
      await launch(url);
    }else{
      throw 'Could not launch $url';
    }
  }

  email()async{
    final Uri _emailurl = Uri(
        scheme: 'maito',
        path: 'xyzmohamedchannelalsaee@gmail.com',
        queryParameters: { 'subject': 'hello xyz مرحباً محمد' }
    );

    if( await canLaunch(_emailurl.toString())){
      await launch(_emailurl.toString());
    }else{
      throw 'Could not launch $_emailurl';
    }
  }

}