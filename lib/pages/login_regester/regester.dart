import 'dart:convert';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
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

import '../../paths.dart';
import '../Customer/customer.dart';

class Regester extends StatefulWidget {
  const Regester({Key? key}) : super(key: key);

  @override
  State<Regester> createState() => _LoginState();
}

class _LoginState extends State<Regester> {
  Future fetch_location() async {
    //showLoading();
    Uri url = Uri.parse(Login_and_Signin + "get_all_location_name.php");
    final response = await http.get(url);
    var responsebody = jsonDecode(response.body);
    for (int i = 0; i < responsebody.length; i++) {
      list.add(responsebody[i]['Areas_Name']);
    }
  }


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
  Future get_all_location_by_name(String Areas_Name) async {
    Uri url = Uri.parse(Login_and_Signin + "get_all_location_by_name.php");
    showLoadingg();
    var data = {
      "Areas_Name": Areas_Name,
    };

    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    setState(() {
      Areas_ID = responsebody[0]['Areas_ID'];
    });
    print(Areas_ID);
    Get.back();
  }
  Future Sigin() async {
    if (fullname.text.length <5||fullname.text =="") {
      if (fullname.text=="") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "يرجى إضافة أسم المستخدم".toString(),
            textAlign: TextAlign.center,
            style:
            TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Cairo'),
          ),
          backgroundColor: googleColor,
          duration: Duration(milliseconds: 500),
        ));
        return;
      }
      else
        {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "يجب الا يقل أسم المستخدم على خمسة أحرف ".toString(),
              textAlign: TextAlign.center,
              style:
              TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Cairo'),
            ),
            backgroundColor: googleColor,
            duration: Duration(milliseconds: 1000),
          ));
          return;
        }
      return;
    }
    else if (account.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "يرجى أدخال البريد الألكتروني".toString(),
          textAlign: TextAlign.center,
          style:
          TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Cairo'),
        ),
        backgroundColor: googleColor,
        duration: Duration(seconds: 1),
      ));
      return;
    }
    else if (Location.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "يرجى اختيار منطقة لخدماتك المطلوبة".toString(),
          textAlign: TextAlign.center,
          style:
          TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Cairo'),
        ),
        backgroundColor: googleColor,
        duration: Duration(seconds: 3),
      ));
      return;
    }
    else if (password.text != currentpassowrd.text && password.text.length<5) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "يجب ان تتطتبق كلمة السر".toString(),
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
    if (_controller.text.length != 9) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "يرجى التأكد من رقم الهاتف".toString(),
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
    showLoadingg();
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
          "هاذ الحساب موجود".toString(),
          textAlign: TextAlign.center,
          style:
          TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Cairo'),
        ),
        backgroundColor: googleColor,
        duration: Duration(seconds: 3),
      ));
      Get.back();
      return;
    } else {
      get_token();
      showCheckNumberTrue();
    }
  }
  Future Loginforsigin() async {


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
                context, "خطأ", "البريد الالكتروني او كلمة المرور خاطئة");
            print("********Customer************");
          }
        }

// Get.back();

      } else {
        print("*****************Login Account");
        print("login EMAIL" + email.text);
        print("login pass" + password.text);
        Navigator.of(context).pop();
        showDialogAll(context, "خطأ", "البريد الالكتروني او كلمة المرور خاطئة");
      }
    }

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
        showDialogAll(context, "خطأ", " هاذا ابرقم لدية حساب فعلي ");
      }
    }
  }
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
            content: Text(e.message.toString()),
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
  showCheckNumberTrue() {
    verifyPhoneNumber();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Center(child: Text('التأكد من رقم الهاتف')),
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
                                  addCustomer(),
                                  Get.back(),
                                }
                            });

                          } catch (e) {
                            Get.back();
                            FocusScope.of(context).unfocus();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("رقم كود خاطئ"),
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
                                child: Text(" رجوع",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.white),)
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
  void get_token() {
    FirebaseMessaging.instance.getToken().then((value) {
      String? token = value;
      print(token);
      mytoken = token!;
      print(mytoken);
    });
  }

  showLoadingg() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Center(child: Text('جاري التحميل')),
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
  final FocusNode _pinOTPCodeFocus = FocusNode();
  String? varifcationCode;
  String Areas_ID = "";
  final BoxDecoration pinOTPCodeDecoration = BoxDecoration(
      color: Colors.blueAccent,
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: Colors.grey,
      ));
  TextEditingController _controllercheck = TextEditingController();
  List<String> list = [];
  String mytoken = "mohammed";
  static String Domain_Path = "https://fallingtaiz.000webhostapp.com/Madmun/";
  static String Login_and_Signin = Domain_Path + "php_files/Login_and_Signin/";
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController fullname = new TextEditingController();
  TextEditingController account = new TextEditingController();
  TextEditingController currentpassowrd = new TextEditingController();
  TextEditingController Location = new TextEditingController();
  TextEditingController _controller = TextEditingController();
  String dialcodedigital = "+973";
  int radioGroup = 0;
  final TextEditingController _OrderController = new TextEditingController();

  String myorder = "";
  bool male = true;
  bool female = false;
  bool readahyes = true;
  bool readahno = false;
  bool accept = false;
  String orderPrice(String ordirPrice, double deleverPrice) {
    if (ordirPrice.isNotEmpty) {
      double result = double.parse(ordirPrice) * deleverPrice;
      return myorder = "$result";
    } else {
      print("pleace Enter a valid price");

      return myorder = "pleace Enter a valid price";
    }
  }

  @override
  void initState() {
    Location.text = "";
    fetch_location();
    get_token();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double wi = MediaQuery.of(context).size.width;
    double he = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [],
              ),
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: he / 9,
                      ),
                      Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            "مستخدم جديد",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              "قم بالتسجيل كمستخدم جديد",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            )),
                      ),
                      ContainerTextField("أسم المستخدم", fullname, false),
                      ContainerTextField("البريد الالكتروني", account, false),
                      Container(
                        height: he / 20,
                        color: Colors.grey.shade100,
                        margin: EdgeInsets.all(10),
                        child: DropdownSearch<String>(
                            mode: Mode.DIALOG,
                            showSelectedItems: true,
                            maxHeight: 400,
                            label: "المدينة",
                            popupBackgroundColor: Colors.grey.shade100,
                            popupBarrierColor: Colors.white10,
                            showSearchBox: true,
                            items: list,
                            // ["Brazil", "France", "Tunisia", "Canada"],

                            popupItemDisabled: (String s) => s.startsWith('I'),
                            onChanged: (val) {
                              setState(() {
                                Location.text = val!;
                                get_all_location_by_name(val);
                              });
                            },
                            selectedItem: ""),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RadiosReadah(),
                      ContainerTextFieldWithflag("رقم الجوال", _controller),
                      Radios(),
                      ContainerTextField("كلمة المرور", password, true),
                      ContainerTextField(
                          "اعد كلمة المرور", currentpassowrd, true),
                      SizedBox(
                        height: 10,
                      ),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: CheckboxListTile(
                                value: accept,
                                onChanged: (newValue) {
                                  setState(() {
                                    if (accept == true)
                                      accept = false;
                                    else
                                      accept = true;
                                  });
                                },
                                title: new Text("الموافقة على الشروط"),
                                activeColor: kTextColor,
                              ),
                              width: 250,
                            ),
                          ],
                        ),
                      ),
                      Container(margin: EdgeInsets.only(left: 10,right: 10,bottom: 30),
                        width: double.infinity,
                        child: RaisedButton(
                          color: accept?kPrimaryColor2:Colors.grey,
                          elevation: 10,
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 40),
                          onPressed:  (){
                            accept? Sigin():print("cant Sigin");
                          },
                          child:  Text(
                            "تسجيل",
                            style: TextStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Container RadiosReadah() {
    double wi = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("هل انت خريج معهد الريادة"),
          Stack(
            children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  margin: EdgeInsets.only(right: 150),
                  width: 150,
                  child: CheckboxListTile(
                    value: readahyes,
                    onChanged: (newValue) {
                      setState(() {
                        readahyes = true;
                        readahno = false;
                      });
                    },
                    title: new Text("نعم"),
                    activeColor: kTextColor,
                  ),
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  width: 150,
                  child: new CheckboxListTile(
                    value: readahno,
                    onChanged: (newValue) {
                      setState(() {
                        readahno = true;
                        readahyes = false;
                      });
                    },
                    title: new Text("لا"),
                    activeColor: kTextColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container Radios() {
    double wi = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  margin: EdgeInsets.only(right: 150),
                  width: 150,
                  child: CheckboxListTile(
                    value: female,
                    onChanged: (newValue) {
                      setState(() {
                        female = true;
                        male = false;
                      });
                    },
                    title: new Text("أنثى"),
                    activeColor: kTextColor,
                  ),
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  width: 150,
                  child: new CheckboxListTile(
                    value: male,
                    onChanged: (newValue) {
                      setState(() {
                        male = true;
                        female = false;
                      });
                    },
                    title: new Text("ذكر"),
                    activeColor: kTextColor,
                  ),
                ),
              ),
            ],
          ),
        ],
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

  Container ContainerTextFieldWithflag(
      String lable, TextEditingController controller) {
    return Container(
        margin: const EdgeInsets.all(10),
        height: 40.0,
        decoration: new BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: new BorderRadius.all(new Radius.circular(5.7))),
        child: Stack(
          children: [
            Directionality(
                textDirection: TextDirection.rtl,
                child: new TextField(

                  keyboardType: TextInputType.number,
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
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "++966",
                      style: TextStyle(color: Colors.black54),
                    )),
                Container(margin: EdgeInsets.only(left: 10),
                  child: SvgPicture.asset(
                    "images/Flag_of_Saudi_Arabia.svg",
                    width: 20,
                    height: 20,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
