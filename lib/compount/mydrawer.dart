import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:madmooon/pages/home.dart';
import 'package:madmooon/pages/requst_service/requst_home.dart';
import 'package:madmooon/pages/services/service_home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../colors.dart';
import '../pages/map/home_screen.dart';
import '../pages/packgefluttre.dart';
import 'close .dart';
class Mydrawer extends StatefulWidget {
  const Mydrawer({Key? key}) : super(key: key);

  @override
  _MydrawerState createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  bool x = false;
  var username;
  var email;
  var UserType;
  var user_image;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString("username");
      email = preferences.getString("email");
      user_image=preferences.getString("user_image");
      UserType=preferences.getString("user_image");
      if (username != null) {
        x = !x;
      }
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      backgroundColor: Colors.transparent,
      child: Container(
        child: Container(
          width: 343.0,
          height: 66.0,
          decoration: BoxDecoration(color: kBackgroundColor,
            borderRadius: BorderRadius.circular(8.0),
           // color: Colors.teal,
            border: Border.all(
              width: 3.0,
              color: kTextColor,
            ),
          ),
          child: List(),
        ),
        width: 270.0,
        height: 815.0,

      ),

    );
  }

ListView List(){
    return ListView(
      children: <Widget>[

        Container(
          margin: EdgeInsets.all(5),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage('images/Splach_Screen/splash.png'),
                fit: BoxFit.contain),
          ),
        ),
       x? UserAccountsDrawerHeader(
          accountName: Text(x ? username : ""),
          accountEmail: Text(x ? email : ""),
          currentAccountPicture: CircleAvatar(child:user_image!=""?
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(
                      "https://fallingtaiz.000webhostapp.com/upload/usimage/$user_image"),
                  fit: BoxFit.cover),
            ),
          )
              :Icon(Icons.person)),
          decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                  image: AssetImage("images/drawer.jpg"), fit: BoxFit.cover)),
        ):Text(""),
        ListTile(
          title: Text(
            "Home",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          leading: Icon(
            Icons.home,
            color: kTextColor,
            size: 25,
          ),
          onTap: () {
            Get.offAll(Home());

          },
        ),
        ListTile(
          title: Text(
            "تسجيل خروج",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          leading: Icon(
            Icons.home,
            color: kTextColor,
            size: 25,
          ),
          onTap: () {
            Get.offAll(showLexit(context));

          },
        ),

        ListTile(
          title: Text(
            "الخدمـات",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          leading: Icon(
            Icons.miscellaneous_services_outlined,
            color: kTextColor,
            size: 25,
          ),
          onTap: () {
            Get.to(Service_Home());
          },
        ),

        ListTile(
            title: Text(
              "الطلبات",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            leading: Icon(
              Icons.remove_from_queue_outlined,
              color: kTextColor,
              size: 25,
            ),
            onTap: () {
              Get.to(Requst_Home());
            }
        ),
        ListTile(
            title: Text(
              "عملأنـا",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            leading: Icon(
              Icons.people_alt_sharp,
              color: kTextColor,
              size: 25,
            ),
            onTap: () {
              Get.to(packgeflutter());
            }
        ),

        ListTile(
            title: Text(
              " الشكاوي والإستفسارات",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            leading: Icon(
              Icons.messenger,
              color: kTextColor,
              size: 25,
            ),
            onTap: () {
              // Get.to(Locationn());
            }
        )
        , ListTile(
          title: Text(
            "الشروط و الأحكام",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          leading: Icon(
            Icons.book_outlined,
            color: kTextColor,
            size: 25,
          ),
          onTap: ()  {
           // Get.to(Send_Requst());


          },
        )
           ,
        ListTile(
          title: Text(
            "سياسة الخصوصية",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          leading: Icon(
            Icons.security,
            color: kTextColor,
            size: 25,
          ),
          onTap: () {
            Navigator.of(context).pushNamed("buzzingText");
          },
        ),
        ListTile(
          title: Text(
            "إتصل بنا",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          leading: Icon(
            Icons.call,
            color: kTextColor,
            size: 25,
          ),
          onTap: () {
            Navigator.of(context).pushNamed("buzzingText");
          },
        ),
        ListTile(
          title: Text(
            "الأعدادات",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          leading: Icon(
            Icons.settings,
            color: kTextColor,
            size: 25,
          ),
          onTap: () {},
        ),
        ListTile(
          title: Text(
            "للمزيد من المعلومات زورونا على",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          leading: Icon(
            Icons.perm_device_information,
            color: kTextColor,
            size: 25,
          ),
          onTap: () {
            Navigator.of(context).pushNamed("buzzingText");
          },
        ),
        ListTile(
          title: Text(
            "fallinggreek95@gmail.coom",
            style: TextStyle(color: Colors.blue, fontSize: 12),
          ),
          leading: Icon(
            Icons.email,
            color: Colors.blue,
            size: 25,
          ),
          onTap: () {
            Navigator.of(context).pushNamed("buzzingText");
          },
        ),
        SizedBox(height: 20,)


      ],
    );
}
  ListTile sigin() {
    return ListTile(
      title: Text("تسجيل الدخول",
          style: TextStyle(color: Colors.black, fontSize: 18)),
      leading: Icon(
        Icons.exit_to_app,
        color: kTextColor,
        size: 25,
      ),
      onTap: () {
        Navigator.of(context).pushNamed("login");
      },
    );
  }

  ListTile add_category() {
    return ListTile(
      title: Text(" الأصنـاف",
          style: TextStyle(color: Colors.black, fontSize: 18)),
      leading: Icon(
        Icons.pending_actions_rounded,
        color: kTextColor,
        size: 25,
      ),
      onTap: () {
        Navigator.of(context).pushNamed("categories");
      },
    );
  }


}
