import 'dart:convert';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:madmooon/pages/provider_service/requst_provider_home.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../colors.dart';
import '../../compount/alert.dart';

import '../paths.dart';
import 'Customer/customer.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

class Forgatepassowrd extends StatefulWidget {
  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends State<Forgatepassowrd> {
  static String Domain_Path = "https://fallingtaiz.000webhostapp.com/Madmun/";
  static String Login_and_Signin = Domain_Path + "php_files/Login_and_Signin/";
  FirebaseMessaging nessage = FirebaseMessaging.instance;
  String dialcodedigital = "+973";
  TextEditingController _controller = TextEditingController();
  TextEditingController _controllercheck = TextEditingController();
  GlobalKey<FormState> LogintFormData = new GlobalKey<FormState>();
  GlobalKey<FormState> SigninFormData = new GlobalKey<FormState>();
  void get_token() {
    FirebaseMessaging.instance.getToken().then((value) {
      String? token = value;
      print(token);
      mytoken = token!;
      print(mytoken);
    });
  }

  List<String> list = [];
  Future fetch_location() async {
    //showLoading();
    Uri url = Uri.parse(Login_and_Signin + "get_all_location_name.php");
    final response = await http.get(url);
    var responsebody = jsonDecode(response.body);
    for (int i = 0; i < responsebody.length; i++) {
      list.add(responsebody[i]['Areas_Name']);
    }
  }

  String Account_Email = "";


  String Areas_ID = "";


  String? Type = "";


  @override
  void initState() {

    Location.text = "";
    fetch_location();
    get_token();

    super.initState();
  }

  savePrefCustomers(
      String ID_Customer,
      String Customer_Name,
      String Cusotmer_Image,
      String Customer_Kind_Account,
      String Custmer_Account,
      String Type,String Customer_Location) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("ID_Customer", ID_Customer);
    preferences.setString("Customer_Name", Customer_Name);
    preferences.setString("Cusotmer_Image", Cusotmer_Image);
    preferences.setString("Customer_Kind_Account", Customer_Kind_Account);
    preferences.setString("Custmer_Account", Custmer_Account);
    preferences.setString("type", Type);
    preferences.setString("mytoken", mytoken);
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
  }

  String mytoken = "mohammed";
  addCustomer() async {
    showLoadingg();
    setState(() {
      email.text = _controller.text;
    });

    Uri url = Uri.parse(Login_and_Signin + "insert_customer.php");

    var data = {
      'Custmer_Account': _controller.text.toString(),
      'Customer_Name': fullname.text.toString(),
      'Cusotmer_Image': 'Mohammed.jpg',
      'Customer_Kind_Account': 'Phone',
      'Custmer_Passowrd': password.text.toString(),
      'Customer_Readh': '1',
      'Customer_Flag': '1',
      'Customer_Token': mytoken,
      'Customer_Location': Areas_ID,
      'Customer_Phone_Number': email.text.toString(),
    };
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    if (responsebody['status'] == "success") {
      print("yes success");
      Loginforsigin();
    } else {
      print(responsebody['status']);

      if (responsebody['status'] == "name already found") {
        showDialogAll(context, "??????", " ???????? ?????????? ???????? ???????? ???????? ");
      }
    }
  }

  Future Sigin() async {
  get_token();
    var formdata = SigninFormData.currentState!;
    if (formdata.validate()) {
      formdata.save();
    } else
      return;


     if (password.text != currentpassowrd.text) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "?????? ???? ???????????? ???????? ????????".toString(),
          textAlign: TextAlign.center,
          style:
          TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Cairo'),
        ),
        backgroundColor: googleColor,
        duration: Duration(seconds: 3),
      ));

      return;
    }
    //chick_account_found();
  showLoadingg();
  Uri url = Uri.parse(Login_and_Signin + "forgate_passowrd.php");

  var data = {
    'Account_Email': _controller.text.toString(),
    'Account_Password': password.text.toString(),
    'mytoken': mytoken,
  };

    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
  print(responsebody['kind']);
  print(responsebody['status']);
  print(responsebody['ID_Customer']);
  print(responsebody['Service_Provider_Name']);
    if (responsebody['status'] == "success") {
      if (responsebody['kind'] == "Customer"){
        print("*******1*******");
        savePrefCustomers(
            responsebody['ID_Customer'],
            responsebody['Customer_Name'],
            responsebody['Cusotmer_Image'],
            responsebody['Customer_Kind_Account'],
            responsebody['Custmer_Account'],
            "Customer"
        ,
          responsebody['Customer_Location'],);
        Get.offAll(Customer());
      }
      else if(responsebody['kind'] == "Sercice_Provider")
        {print("*******2*******");
          savePrefProvider(
              responsebody['Sercice_Provider_ID'],
              responsebody['Service_Provider_Name'],
              responsebody['Service_Provider_ID_NO'],
              responsebody['Service_Provider_Acount'],
              responsebody['Sercice_Provider_Phone'],
              responsebody['Service_Number'],
              responsebody['Sercice_Provider_experience'],
              responsebody['Service_Provider_Image'],
              responsebody['Representatives_ID'],
              responsebody['Sercice_Provider_Account_Type'],
              responsebody['Service_Provider_Token']);
          Get.offAll(Requst_Provider_Home());
        }
      else{
        print("********3******");
      }

    }
    else {

      print("**************");
    }
  }

  Future Loginforsigin() async {
    print("**********email" + email.text);
    print("**********email" + password.text);
    var formdata = SigninFormData.currentState!;
    if (formdata.validate()) {
      formdata.save();
      get_token();

      ///          Login Account
      ///
      print("login EMAIL" + email.text);
      print("login pass" + password.text);
      var data = {
        "Account_Email": email.text,
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
            "Custmer_Account": email.text,
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
                responsebody['Account_Type'],
              responsebody2['Customer_Location'],
            );

            print("********1Customer************");
          } else {
            print("login faild");
            Navigator.of(context).pop();
            showDialogAll(
                context, "??????", "???????????? ???????????????????? ???? ???????? ???????????? ??????????");
            print("********Customer************");
          }
          Get.offAll(Customer());
        } else if (responsebody['Account_Type'] == "Sercice_Provider") {
          var data3 = {
            "Service_Provider_Acount": email.text,
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
                context, "??????", "???????????? ???????????????????? ???? ???????? ???????????? ??????????");
            print("********Customer************");
          }
        }

// Get.back();

      } else {
        print("*****************Login Account");
        print("login EMAIL" + email.text);
        print("login pass" + password.text);
        Navigator.of(context).pop();
        showDialogAll(context, "??????", "???????????? ???????????????????? ???? ???????? ???????????? ??????????");
      }
    } else {
      print("not valid");
    }
  }

  Login() async {
    var formdata = LogintFormData.currentState!;
    if (_controller.text.length != 9) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "???????? ???????????? ???? ?????? ????????????".toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'Cairo'),
          ),
          backgroundColor: googleColor,
          duration: Duration(seconds: 3),
        ),
      );

      return;
    }
    Uri url = Uri.parse(Login_and_Signin + "chick_account_found.php");

    var data = {
      "Account_Email": _controller.text.toString(),
    };

    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    print("email.text.toString()****************");
    print(_controller.text.toString());
    print(responsebody['status']);
    print(responsebody.length);
    if (responsebody['status'] == "success") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "?????? ???????????? ?????????? ???????????? ???????????? ?? ???????????? ????????".toString(),
          textAlign: TextAlign.center,
          style:
          TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Cairo'),
        ),
        backgroundColor: googleColor,
        duration: Duration(seconds: 3),
      ));
      get_token();
      showCheckNumberTrue();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "?????? ???????????? ?????? ?????????? ???????? ???????????? ???? ?????? ?????????? ?????????????????? ?????? ????????".toString(),
          textAlign: TextAlign.center,
          style:
          TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Cairo'),
        ),
        backgroundColor: googleColor,
        duration: Duration(seconds: 3),
      ));

    }

  }


  bool isSignupScreen = false;
  bool isreadah = false;
  bool isRememberMe = false;
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController fullname = new TextEditingController();
  TextEditingController currentpassowrd = new TextEditingController();
  TextEditingController Location = new TextEditingController();

  showLoadingg() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Center(child: Text('???????? ??????????????')),
            actions: <Widget>[
              Center(
                  child: Image.asset(
                    'images/Copper-Loader.gif',
                    width: 250,
                    height: 250,
                  )),
            ],
          ),
        );
      },
    );
  }

  ///                showCheckNumberTrue

  showCheckNumberTrue() {
    verifyPhoneNumber();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Center(child: Text('???????????? ???? ?????? ????????????')),
            actions: <Widget>[
              Directionality(
                textDirection: TextDirection.ltr,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Image.asset(
                        "images/Splach_Screen/splash.png",
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Container(
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            verifyPhoneNumber();
                          },
                          child: Text(
                            "Number :${dialcodedigital}--${_controller.text.toString()}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1.0),
                      child: Pinput(
                        length: 6,
                        focusNode: _pinOTPCodeFocus,
                        controller: _controllercheck,
                        pinAnimationType: PinAnimationType.slide,
                        onCompleted: (pin) async {
                          try {
                            showLoadingg();
                            await FirebaseAuth.instance
                                .signInWithCredential(
                                PhoneAuthProvider.credential(
                                    verificationId: varifcationCode!,
                                    smsCode: pin))
                                .then((value) => {
                              if (value.user != null)
                                {
                                  Get.back(),
                          if (islogin) {
                          setState(() {
                          islogin = false;
                          }),
                          } else {
                          setState(() {
                          islogin = true;
                          }),
                          },

                                  Get.back(),
                                }
                            });

                          } catch (e) {
                            Get.back();
                            FocusScope.of(context).unfocus();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                "?????? ?????? ???????? ???????? ?????? ????????".toString(),
                                textAlign: TextAlign.center,
                                style:
                                TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Cairo'),
                              ),
                              backgroundColor: googleColor,
                              duration: Duration(seconds: 3),
                            ));

                          }
                        },
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Get.back();
                        Get.back();
                      },
                      child: Center(
                        child: Container(
                            height: 55,
                            width: 55,

                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [

                                  BoxShadow(
                                    color: Colors.black.withOpacity(.3),
                                    spreadRadius: 1.5,
                                    blurRadius: 10,
                                  )
                                ]),
                            child:
                            Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          kBlueColor,
                                          Color(0xFF4BB8F4),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight),
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(.3),
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                          offset: Offset(0, 1))
                                    ]),
                                child: Text(" ????????",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.white),)
                            )

                        ),
                      ),
                    )

                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  final FocusNode _pinOTPCodeFocus = FocusNode();
  String? varifcationCode;
  final BoxDecoration pinOTPCodeDecoration = BoxDecoration(
      color: Colors.blueAccent,
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: Colors.grey,
      ));
  verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: dialcodedigital + _controller.text.toString(),
        verificationCompleted: (PhoneAuthCredential crdential) async {
          await FirebaseAuth.instance
              .signInWithCredential(crdential)
              .then((value) => {
            if (value.user != null)
              {
                addCustomer(),
              }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "???? ???????? ?????????? ???????????? ?????? ???????? ???? ?????????? ??????????".toString(),
              textAlign: TextAlign.center,
              style:
              TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Cairo'),
            ),
            backgroundColor: googleColor,
            duration: Duration(seconds: 3),
          ));

        },
        codeSent: (String vID, int? resentToken) {
          setState(() {
            varifcationCode = vID;
          });
        },
        codeAutoRetrievalTimeout: (String vID) {
          setState(() {
            varifcationCode = vID;
          });
        },
        timeout: Duration(seconds: 40));
  }

  ///              End showCheckNumberTrue

  bool islogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: ListView(
          children: [
            Container(
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Color(0xFFDFF8FE)),
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 6,
                          width: 250,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "???????? ???? ???? ??????????",
                                style: GoogleFonts.roboto(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xFF4BB8F4)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "?????????? ?????????? ???????????????? ???????????? ?????? ?????????? \n  ?????? ?????? ",
                                style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF4BB8F4)),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.7,
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Stack(
                            children: [
                              //Making of the Login Part

                              islogin
                                  ? Positioned(
                                  top: 20,
                                  left: 20,
                                  right: 20,
                                  child: Container(
                                    height: 400,
                                    width:
                                    MediaQuery.of(context).size.width *
                                        0.98,
                                    child: Stack(
                                      children: [
                                        //Did for z-index
                                        Container(
                                          child: ClipPath(
                                            //WIll make  a clip Path of the shape as Login
                                            clipper: SignupClipper(),

                                            child: Container(
                                              height: 350,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.92,
                                              decoration: BoxDecoration(
                                                  color: Colors.white
                                                      .withOpacity(0.8)),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                                children: [
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 30,
                                                        top: 20,
                                                        right: 30),
                                                    child: Text(
                                                      "?????????? ???????? ????????",
                                                      style: GoogleFonts
                                                          .roboto(
                                                          fontWeight:
                                                          FontWeight
                                                              .w600,
                                                          fontSize: 40,
                                                          color: Colors
                                                              .grey[
                                                          400]),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),

                                        CustomPaint(
                                          //Shadow for the Box
                                          painter: loginShadowPaint(),
                                          child: ClipPath(
                                            //WIll make  a clip Path of the shape as Login
                                            clipper: loginClipper(),

                                            child: Container(
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                                  1.5,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.92,
                                              decoration: BoxDecoration(
                                                  color: Colors.white),
                                              child: ListView(children: [
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    SizedBox(
                                                      height: 50,
                                                    ),
                                                    Container(
                                                      margin:
                                                      EdgeInsets.only(
                                                          left: 30,
                                                          top: 20),
                                                      child: Text(
                                                        "???????????? ???? ????????????",
                                                        style: GoogleFonts
                                                            .roboto(
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                            fontSize:
                                                            32,
                                                            color: Colors
                                                                .black),
                                                      ),
                                                    ),

                                                    Container(
                                                        width: MediaQuery.of(context).size.width/1.5 ,
                                                        margin:
                                                        EdgeInsets.only(
                                                          left: 30,
                                                        ),
                                                        height: 12,
                                                        child: Card(
                                                            elevation: 2,
                                                            color: Color(
                                                                0xFF4BB8F4))),

                                                    buildSigninSection(),

                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                  ],
                                                ),
                                              ]),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 150,
                                        ),

                                        Positioned(
                                          left: 0,
                                          right: 0,
                                          bottom: 0,
                                          child: Align(
                                            alignment: Alignment(0, 10),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                    child:
                                                    buildBottomHalfContainer(
                                                        false))
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ))
                                  : Container(),

                              //Making of the Signup Part

                              /* Finishing the Singup PArt Now */

                              islogin == false
                                  ? Positioned(
                                  top: 20,
                                  left: 20,
                                  right: 20,
                                  child: Container(
                                    height:
                                    MediaQuery.of(context).size.height /
                                        1.99,
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: Stack(
                                      children: [
                                        CustomPaint(
                                          //Shadow for the Box
                                          painter: signupShadowPaint(),
                                          child: Stack(
                                            children: [
                                              Container(
                                                child: ClipPath(
                                                  //WIll make  a clip Path of the shape as Login
                                                  clipper: loginClipper(),

                                                  child: Container(
                                                    height: MediaQuery.of(context).size.height ,
                                                    width: MediaQuery.of(
                                                        context)
                                                        .size
                                                        .width *
                                                        0.92,
                                                    decoration:
                                                    BoxDecoration(
                                                        color: Colors
                                                            .white
                                                            .withOpacity(
                                                            0.8)),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .start,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets
                                                              .only(
                                                              left: 30,
                                                              top: 20,
                                                              right:
                                                              30),
                                                          child: Text(
                                                            "????????",
                                                            style: GoogleFonts.roboto(
                                                                fontWeight:
                                                                FontWeight
                                                                    .w600,
                                                                fontSize:
                                                                40,
                                                                color: Colors
                                                                    .grey[
                                                                400]),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              ClipPath(
                                                //WIll make  a clip Path of the shape as Login
                                                clipper: SignupClipper(),

                                                child: ListView(
                                                  children: [
                                                    Container(

                                                      decoration:
                                                      BoxDecoration(
                                                          color: Colors
                                                              .white),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .start,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          SizedBox(
                                                            height: 70,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                            children: [
                                                              Spacer(),
                                                              Container(
                                                                margin: EdgeInsets.only(
                                                                    left:
                                                                    30,
                                                                    top: 20,
                                                                    right:
                                                                    20),
                                                                child: Text(
                                                                  "?????????? ???????? ????????",
                                                                  style: GoogleFonts.roboto(
                                                                      fontWeight: FontWeight
                                                                          .w600,
                                                                      fontSize:
                                                                      32,
                                                                      color:
                                                                      Colors.black),
                                                                ),
                                                              ),
                                                            ],
                                                          ),

                                                          Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                            children: [
                                                              Spacer(),
                                                              Container(
                                                                  width: 200,
                                                                  margin: EdgeInsets.only(
                                                                      left:
                                                                      30,
                                                                      right:
                                                                      25),
                                                                  height:
                                                                  12,
                                                                  child: Card(
                                                                      elevation:
                                                                      2,
                                                                      color:
                                                                      Color(0xFF4BB8F4))),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          buildSignupSection(),
                                                        ],
                                                      ),
                                                    ),Positioned(
                                                      left: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                          0.31,
                                                      bottom: 18,
                                                      child:  Align(
                                                        alignment: Alignment(0, 10),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.center,
                                                          children: [
                                                            Container(
                                                                child:
                                                                buildBottomHalfContainer(
                                                                    false))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(

                                                    )
                                                  ],
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                  ))
                                  : Container(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 7.8,
                    right: MediaQuery.of(context).size.width * 0.32,
                    child: Icon(
                      FontAwesomeIcons.cog,
                      color: Color(0xFF4BB8F4),
                      size: 18,
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.2,
                    right: MediaQuery.of(context).size.width * 0.2,
                    child: Icon(
                      FontAwesomeIcons.cog,
                      color: Color(0xFF4BB8F4),
                      size: 12,
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.22,
                    left: MediaQuery.of(context).size.width * 0.21,
                    child: Icon(
                      Icons.close,
                      color: Color(0xFF4BB8F4),
                      size: 24,
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(IconData icon, String hintText, bool isPassword,
      bool isEmail, TextEditingController myController) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        controller: myController,
        obscureText: isPassword,
        keyboardType:
        isEmail == true ? TextInputType.text : TextInputType.number,
        validator: (val) {
          if (hintText == "?????????? ?????????????? ") {
            return validInput(val!, 30, 10, "???????? ?????????? ??????????????");
          }
          if (hintText == "?????????? ???????? ????????") {
            return validInput(val!, 30, 6, "???????? ???????? ????????");
          }
          if (hintText == "???????? ????????") {
            return validInput(val!, 30, 6, "???????? ???????? ????????");
          }
          if (hintText == "?????? ????????????") {
            return validInput(val!, 9, 9, "???????? ?????? ????????????");
          }
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 14, color: textColor1),
            prefixIcon: Icon(
              icon,
              color: iconColor,
            ),
            labelStyle:
            GoogleFonts.lato(fontSize: 16, color: Colors.grey[500])),
      ),
    );
  }

  Widget buildBottomHalfContainer(bool showShadow) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 700),
      curve: Curves.bounceInOut,
      top: 535,
      right: 0,
      left: 0,
      child: InkWell(
        onTap: () {
          if (islogin == true) {
            Login();
          } else {
            Sigin();
          }

          print("*******************************");
        },
        child: Center(
          child: Container(
            height: 90,
            width: 90,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  if (showShadow)
                    BoxShadow(
                      color: Colors.black.withOpacity(.3),
                      spreadRadius: 1.5,
                      blurRadius: 10,
                    )
                ]),
            child: !showShadow
                ? Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        kBlueColor,
                        Color(0xFF4BB8F4),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 1))
                  ]),
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            )
                : Center(),
          ),
        ),
      ),
    );
  }

  Container buildSignupSection() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      margin: EdgeInsets.only(
        left: 30,
      ),
      child: Form(
          key: SigninFormData,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              textDirection: TextDirection.rtl,
              children: [



                // buildTextField(Icons.mail_outline, "???????? ???????? ???? ?????? ????????????", false, true,email),
                buildTextField(
                    Icons.lock_outline, "???????? ???????? ??????????????", true, true, password),
                buildTextField(Icons.lock_outline, "?????????? ???????? ???????? ??????????????", true,
                    true, currentpassowrd),


                /// for add number
              ],
            ),
          )),
    );
  }

  Container buildSigninSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Form(
          key: LogintFormData,
          child: Directionality(
              textDirection: TextDirection.ltr,
              child: Column(
                children: [
                  // Padding(padding: EdgeInsets.only(right: 0.0,left: 0.0)),
                  //  Container(
                  //   // margin: EdgeInsets.only(top: 10),
                  //    child: Center(
                  //      child: Text("???????? ????????",style: TextStyle(color: Colors.orange,fontSize: 20),),
                  //    ),
                  //  ),
                  Container(
                    child: CountryCodePicker(
                      onChanged: (country) {
                        setState(() {
                          dialcodedigital = country.dialCode!;
                        });
                      },
                      initialSelection: "IT",
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      favorite: ["+966", "+967"],
                      countryFilter: [
                        "+966",
                        "+967",
                        "+971",
                        "+974",
                        "+973",
                        "+965"
                      ],
                    ),
                  ),

                  Container(
                    width: 300,
                    height: 100,
                    //margin:EdgeInsets.only(top: 1,right: 0,left: 0) ,
                    child: TextField(
                      maxLines: 9,
                      decoration: InputDecoration(
                          hintText:
                          "          ?????? ????????????                 ",
                          icon: Icon(Icons.phone_android_sharp),
                          iconColor: Colors.orange,
                          prefix: Padding(
                            padding: EdgeInsets.all(0),
                            child: Text(dialcodedigital),
                          )),
                      maxLength: 9,
                      keyboardType: TextInputType.number,
                      controller: _controller,
                    ),
                  ),
                ],
              )),),
    );
  }
}

validInput(String val, int max, int min, String type) {
  if (val.trim().length > max) {
    return "???? ???????? ???? ${type} ???????? ???? ${max} ????????";
  }
  if (val.trim().length < min) {
    return "???? ???????? ???? ${type} ???????? ???? ${min} ????????";
  }
  if (val.trim().isEmpty) {
    return "???? ???????? ???? ${type} ????????";
  }
}

class loginClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clip = new Path();

    clip.moveTo(0, 70);
    clip.lineTo(0, size.height - 70);
    clip.quadraticBezierTo(0, size.height, 70, size.height);

    clip.lineTo(size.width - 70, size.height);
    clip.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 70);

    clip.lineTo(size.width, size.height * 0.3 + 50);
    clip.quadraticBezierTo(
        size.width, size.height * 0.3, size.width - 50, size.height * 0.3 - 50);

    clip.lineTo(70, 0);
    clip.quadraticBezierTo(0, 0, 0, 70);
    clip.close();

    return clip;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class SignupClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clip = new Path();
    clip.moveTo(size.width, 70);
    clip.lineTo(size.width, size.height - 70);
    clip.quadraticBezierTo(
        size.width, size.height, size.width - 70, size.height);

    clip.lineTo(70, size.height);
    clip.quadraticBezierTo(0, size.height, 0, size.height - 70);

    clip.lineTo(0, size.height * 0.3 + 50);
    clip.quadraticBezierTo(0, size.height * 0.3, 50, size.height * 0.3 - 50);
    clip.lineTo(size.width - 70, 0);

    clip.quadraticBezierTo(size.width, 0, size.width, 70);

    clip.close();
    return clip;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class loginShadowPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path clip = new Path();

    clip.moveTo(0, 70);
    clip.lineTo(0, size.height - 70);
    clip.quadraticBezierTo(0, size.height, 70, size.height);

    clip.lineTo(size.width - 70, size.height);
    clip.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 70);

    clip.lineTo(size.width, size.height * 0.3 + 50);
    clip.quadraticBezierTo(
        size.width, size.height * 0.3, size.width - 50, size.height * 0.3 - 50);

    clip.lineTo(70, 0);
    clip.quadraticBezierTo(0, 0, 0, 70);
    clip.close();

    canvas.drawShadow(clip, Color(0xFF4BB8F4), 5, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class signupShadowPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path clip = new Path();
    clip.moveTo(size.width, 70);
    clip.lineTo(size.width, size.height - 70);
    clip.quadraticBezierTo(
        size.width, size.height, size.width - 70, size.height);

    clip.lineTo(70, size.height);
    clip.quadraticBezierTo(0, size.height, 0, size.height - 70);

    clip.lineTo(0, size.height * 0.3 + 50);
    clip.quadraticBezierTo(0, size.height * 0.3, 50, size.height * 0.3 - 50);
    clip.lineTo(size.width - 70, 0);

    clip.quadraticBezierTo(size.width, 0, size.width, 70);

    clip.close();

    canvas.drawShadow(clip, Color(0xFF4BB8F4), 5, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
