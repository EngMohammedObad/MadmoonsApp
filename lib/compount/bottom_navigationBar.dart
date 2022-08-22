import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madmooon/pages/login_regester/login.dart';

import '../pages/Customer/customer.dart';
import 'package:madmooon/pages/home.dart';
import 'package:madmooon/pages/provider_service/requst_provider_home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../colors.dart';


import '../pages/chat/chat_home.dart';
import '../pages/login_regester/regester.dart';
import '../pages/requst_service/requst_home.dart';
import '../pages/setings_user/seting_customer.dart';
import '../pages/user.dart';

class bottom_NavigationBar extends StatefulWidget {
  const bottom_NavigationBar({required this.home }) ;
  final int home;

  @override
  State<bottom_NavigationBar> createState() => _bottom_NavigationBarState();
}

class _bottom_NavigationBarState extends State<bottom_NavigationBar> {
  getPref() async {
    String? Type;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      Type=preferences.getString("type");
    });
    print("************$Type******************");

    if(Type!=null||Type!="")
    {
      if(Type=="Customer")
      {
        Get.offAll(Customer());
      }

      else if(Type=="Sercice_Provider")
      {
        Get.offAll(Requst_Provider_Home());
      }
      else Get.to(
            Login()
            //Create_New_User()
        );
    }


  }
  void initState(){
    setState(() {
      indexes=widget.home;
    });
    super.initState();
  }




  int indexes=0;

  @override
  Widget build(BuildContext context) {

    return Container(

      color: Colors.white,
      child: CurvedNavigationBar(
        color: Colors.white,
        index: widget.home,
        height: 35,
        backgroundColor: Colors.white,
        items: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                child:Icon(Icons.home, size: 30,color:indexes==0? Colors.white: Colors.grey),
                backgroundColor:indexes==0? kPrimaryColor2: Colors.white,
              ),
              Text("الرئيسية",style: TextStyle(color: Colors.grey,fontWeight:FontWeight.bold ),),

            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                child:Icon(Icons.person, size: 30,color:indexes==1? Colors.white: Colors.grey),
                backgroundColor:indexes==1? kPrimaryColor2: Colors.white,
              ),

              Text("حسابي",style: TextStyle(color: Colors.grey,fontWeight:FontWeight.bold ),),


            ],

          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                child:Icon(Icons.people_alt_outlined, size: 30,color:indexes==2? Colors.white: Colors.grey),
                backgroundColor:indexes==2? kPrimaryColor2: Colors.white,
              ),

              Text("عملائنا",style: TextStyle(color: Colors.grey,fontWeight:FontWeight.bold ),),


            ],

          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                child:Icon(Icons.settings_sharp, size: 30,color:indexes==3? Colors.white: Colors.grey),
                backgroundColor:indexes==3? kPrimaryColor2: Colors.white,
              ),


              Text("الاعدادات",style: TextStyle(color: Colors.grey,fontWeight:FontWeight.bold ),),


            ],

          ),
        ],
        onTap: (index) {
          setState(() {
            indexes=index;
          });

          if(index==0)
          {Get.offAll(Home());}
          else if(index==1)
          {getPref();}
          else if(index==2)
          {Get.to(SetingCustomer());}
          else if(index==3)
          {Get.to(Requst_Home());}
        },
      ),
    );
  }
}
