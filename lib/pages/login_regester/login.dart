import 'dart:convert';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:madmooon/pages/login.dart';
import 'package:madmooon/pages/login_regester/regester.dart';
import 'package:madmooon/pages/provider_service/requst_provider_home.dart';

import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../colors.dart';
import '../../compount/alert.dart';


import '../Customer/customer.dart';
import 'login.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  savePrefCustomers(
      String ID_Customer,
      String Customer_Name,
      String Cusotmer_Image,
      String Customer_Kind_Account,
      String Custmer_Account,
      String Type) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("ID_Customer", ID_Customer);
    preferences.setString("Customer_Name", Customer_Name);
    preferences.setString("Cusotmer_Image", Cusotmer_Image);
    preferences.setString("Customer_Kind_Account", Customer_Kind_Account);
    preferences.setString("Custmer_Account", Custmer_Account);
    preferences.setString("type", Type);
    preferences.setString("mytoken", mytoken);
    preferences.setString("CountNotification", "0");
  }

  savePrefProvider(
      String Sercice_Provider_ID,
      String Service_Provider_Name,
      String Service_Provider_ID_NO,
      String Service_Provider_Acount,
      String Sercice_Provider_Phone,
      String Service_Number,
      String Sercice_Provider_experience,
      String Service_Provider_Image,
      String Representatives_ID,
      String Sercice_Provider_Account_Type,
      String Service_Provider_Token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("Sercice_Provider_ID", Sercice_Provider_ID);
    preferences.setString("Service_Provider_Name", Service_Provider_Name);
    preferences.setString("Service_Provider_ID_NO", Service_Provider_ID_NO);
    preferences.setString("Service_Provider_Acount", Service_Provider_Acount);
    preferences.setString("Sercice_Provider_Phone", Sercice_Provider_Phone);
    preferences.setString("Service_Number", Service_Number);
    preferences.setString(
        "Sercice_Provider_experience", Sercice_Provider_experience);
    preferences.setString("Service_Provider_Image", Service_Provider_Image);
    preferences.setString("Representatives_ID", Representatives_ID);
    preferences.setString("type", 'Sercice_Provider');
    preferences.setString("mytoken", Service_Provider_Token);
    preferences.setString("CountNotification", "0");
  }
  Login() async {

    if (fullname.text.length <5||fullname.text =="") {
      if (fullname.text=="") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "يرجى إدخال أسم المستخدم".toString(),
            textAlign: TextAlign.center,
            style:
            TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Cairo'),
          ),
          backgroundColor: kPrimaryColor2,
          duration: Duration(milliseconds: 500),
        ));
        return;
      }
      else
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "أسم المستخدم ليس اقل من خمسة أحرف ".toString(),
            textAlign: TextAlign.center,
            style:
            TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Cairo'),
          ),
          backgroundColor: kPrimaryColor2,
          duration: Duration(milliseconds: 1000),
        ));
        return;
      }

    }
    else if (password.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "كلمة السر".toString(),
          textAlign: TextAlign.center,
          style:
          TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Cairo'),
        ),
        backgroundColor: kPrimaryColor2,
        duration: Duration(seconds: 1),
      ));
      return;
    }
      get_token();
      showLoading(context);

      ///          Login Account
      ///
      print("login EMAIL" + fullname.text);
      print("login pass" + password.text);
      var data = {
        "Account_Email": fullname.text,
        "Account_Password": password.text
      };
      Uri url = Uri.parse(Login_and_Signin + "Login_Account.php");
      var response = await http.post(url, body: data);
      var responsebody = jsonDecode(response.body);
      print(responsebody['status']);
      if (responsebody['status'] == "success") {
        ///                Login Customer
        ///
        if (responsebody['Account_Type'] == "Customer") {
          var data2 = {
            "Custmer_Account": fullname.text,
            "Custmer_Passowrd": password.text,
            "mytoken": mytoken
          };
          Uri url2 = Uri.parse(Login_and_Signin + "Login_Customer.php");
          var response2 = await http.post(url2, body: data2);
          var responsebody2 = jsonDecode(response2.body);
          if (responsebody2['status'] == "success") {
            savePrefCustomers(
                responsebody2['ID_Customer'],
                responsebody2['Customer_Name'],
                responsebody2['Cusotmer_Image'],
                responsebody2['Customer_Kind_Account'],
                responsebody2['Custmer_Account'],
                responsebody['Account_Type']);
            print("********1Customer************");
          } else {
            print("login faild");
            Navigator.of(context).pop();
            showDialogAll(
                context, "خطأ", "البريد الالكتروني او كلمة المرور خاطئة");
            print("********Customer************");
          }
          Get.offAll(Customer());
        } else if (responsebody['Account_Type'] == "Sercice_Provider") {
          var data3 = {
            "Service_Provider_Acount": fullname.text,
            "Sercice_Provider_Passowrd": password.text,
            "Service_Provider_Token": mytoken
          };
          print(mytoken);
          Uri url3 = Uri.parse(Login_and_Signin + "Login_provider.php");
          var response3 = await http.post(url3, body: data3);
          var responsebody3 = jsonDecode(response3.body);
          if (responsebody3['status'] == "success") {
            savePrefProvider(
                responsebody3['Sercice_Provider_ID'],
                responsebody3['Service_Provider_Name'],
                responsebody3['Service_Provider_ID_NO'],
                responsebody3['Service_Provider_Acount'],
                responsebody3['Sercice_Provider_Phone'],
                responsebody3['Service_Number'],
                responsebody3['Sercice_Provider_experience'],
                responsebody3['Service_Provider_Image'],
                responsebody3['Representatives_ID'],
                responsebody3['Sercice_Provider_Account_Type'],
                responsebody3['Service_Provider_Token']);
            Get.offAll(Requst_Provider_Home());
          } else {
            print("login faild");
            Navigator.of(context).pop();
            showDialogAll(
                context, "خطأ", "البريد الالكتروني او كلمة المرور خاطئة");
            print("********Customer************");
          }
        }

// Get.back();

      } else {
        print("*****************Login Account");
        print("login EMAIL" + fullname.text);
        print("login pass" + password.text);
        Navigator.of(context).pop();
        showDialogAll(context, "خطأ", "البريد الالكتروني او كلمة المرور خاطئة");
      }
    }

  void get_token() {
    FirebaseMessaging.instance.getToken().then((value) {
      String? token = value;
      print(token);
      mytoken = token!;
      print(mytoken);
    });
  }
  @override
  void initState() {

    get_token();

    super.initState();
  }

  String mytoken = "mohammed";
  TextEditingController password = new TextEditingController();
  TextEditingController fullname = new TextEditingController();
  static String Domain_Path = "https://madmooon.com/Madmun/";
  static String Login_and_Signin = Domain_Path + "php_files/Login_and_Signin/";
  @override
  Widget build(BuildContext context) {
    double wi = MediaQuery.of(context).size.width;
    double he = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: he / 4,
              color: Colors.white,
             child: Stack(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     SizedBox(width: 0.1,),
                     Container(
                       width: wi/2,
                       height: he /3,
                       child: Image.asset(
                         "images/Splach_Screen/splash.png",
                         width: wi,
                         height: he ,
                         fit: BoxFit.contain,
                       ),
                     ),
                   ],
                 ),
                 Container(
                   height: he / 4,
                   width: double.infinity,
                   color: Colors.white.withOpacity(0.95),
                 )
               ],
             )
            ),
            Container(
              width: wi,
              height: he /7,
              child: Image.asset(
                "images/Splach_Screen/splash.png",
                width: wi,
                height: he ,
                fit: BoxFit.contain,
              ),
            ),
            ContainerTextField("أسم المستخدم", fullname, false),

            ContainerTextField("كلمة المرور", password, true),
            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Get.to(Forgatepassowrd());
                  },
                  child: Text("هل نسيت كلمة المرور ؟",
                      style: TextStyle(fontSize: 12, color: textColor1)),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(margin: EdgeInsets.only(right: 10,bottom: 30),
                  padding: EdgeInsets.all(10),
                  width: wi/1.3,
                  child: RaisedButton(
                    color: kPrimaryColor2,
                    elevation: 10,
                    padding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: 40),
                    onPressed:  ()=>Login(),
                    child:  Text(
                      "تسجيل",
                      style: TextStyle(
                          color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
                Container(margin: EdgeInsets.only(left: 10,right: 5,bottom: 30),
                  width: wi/7,
                    padding: EdgeInsets.all(7),
                    color: kPrimaryColor2,
                  child:Center(
                    child:  InkWell(
                      child: Icon(Icons.fingerprint_outlined,color: Colors.white,),
                    )
                  )
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(right: 10,bottom: 30),
                    padding: EdgeInsets.all(10),

            decoration: BoxDecoration(
                color: kPrimaryColor2,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [

            BoxShadow(
            color: Colors.black.withOpacity(.3),
        spreadRadius: 0.5,
        blurRadius: 5,
  )]
    ),
                  child: Icon(Icons.lightbulb,color: Colors.white,)
                ),
                Container(
                  margin: EdgeInsets.only(right: 10,bottom: 30),
                  padding: EdgeInsets.all(10),
                  child: InkWell(
                    child: Text("استكشف التطبيق",style: TextStyle(color:kPrimaryColor2,),),
                  ),
                )

              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.all(8),


                    child: Text("ليس لديك حساب ؟",style: TextStyle(color:Colors.grey,),),
                ),
                InkWell(
                  child: Text("انشاء حساب",style: TextStyle(color:kPrimaryColor2,),),
                  onTap: ()=>Get.to(Regester()),
                )

              ],
            ),
          ],
        ),
      ),
    );
  }
  Container ContainerTextField(
      String lable, TextEditingController controller, bool isnumber) {
    return Container(
        margin: const EdgeInsets.all(10),
        height: 40.0,
        decoration: new BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: new BorderRadius.all(new Radius.circular(5.7))),
        child: new Directionality(
            textDirection: TextDirection.rtl,
            child: new TextField(
              keyboardType:
              isnumber ? TextInputType.number : TextInputType.name,
              obscureText: isnumber, //
              controller: controller,
              autofocus: false,

              style: new TextStyle(fontSize: 14.0),
              decoration: new InputDecoration(
                filled: true,
                hintText: lable,
                contentPadding: const EdgeInsets.all(10),
                focusedBorder: OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.white),
                  borderRadius: new BorderRadius.circular(25.7),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: new BorderSide(color: Colors.white),
                ),
              ),
            )));
  }
}