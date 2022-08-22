import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:madmooon/compount/bottom_navigationBar.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../colors.dart';
import '../../paths.dart';

class SetingCustomer extends StatefulWidget {
  const SetingCustomer({Key? key}) : super(key: key);

  @override
  State<SetingCustomer> createState() => _SetingCustomerState();
}

class _SetingCustomerState extends State<SetingCustomer> {
  String? Type;
  String? ID_Customer;
  String? Customer_Name;
  String? Cusotmer_Image;
  String? Custmer_Account;
  String? mytoken;
  String? Sercice_Provider_ID;
  String? Service_Provider_Name;
  String? Service_Provider_Image;
  String? Service_Provider_Acount;
  String? Customer_Location;
  TextEditingController username = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      Type = preferences.getString("type");
      mytoken = preferences.getString("mytoken");
      ID_Customer = preferences.getString("ID_Customer");
      Customer_Name = preferences.getString("Customer_Name");
      Cusotmer_Image = preferences.getString("Cusotmer_Image");
      Custmer_Account = preferences.getString("Custmer_Account");
      Sercice_Provider_ID = preferences.getString("Sercice_Provider_ID");
      Service_Provider_Name = preferences.getString("Service_Provider_Name");
      Service_Provider_Image = preferences.getString("Service_Provider_Image");
      Service_Provider_Acount =
          preferences.getString("Service_Provider_Acount");
      Customer_Location = preferences.getString("Customer_Location");

      username.text = Customer_Name!;
      area.text = "الرياض";
      gender.text = "ذكر";
      email.text = Custmer_Account!;
      phone.text = Custmer_Account!;
    });
  }

  updateImage() async {
    showLoading("جاري تعديل البروفايل");
    Uri url = Uri.parse(Paths.Domain_Global+"edit_user_image.php");

    //create new  category with image
    String base64 = base64Encode(file!.readAsBytesSync());
    String cat_img = file!.path.split("/").last;
print(ID_Customer);
    print(Cusotmer_Image);
    print(cat_img);
    print(base64);
    var data = {
      "ID_Customer": ID_Customer,
      "Old_Cusotmer_Image": Cusotmer_Image,
      'Cusotmer_Image': cat_img,
      "image64": base64
    };
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    if (responsebody['status'] == "success") {
      print("yes success");
      setState(
              () {
        Cusotmer_Image = cat_img;
        savePrefProvider();
        file = null;
      }
      );
    }
    else {
      print("not valid");
    }
Get.back();
  }
  showLoading(String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Center(child: Text(message,style: TextStyle(fontSize: 16),)),
            content: JumpingDotsProgressIndicator(
              fontSize: 20.0,
            ),
            actions: <Widget>[

            ],
          ),
        );
      },
    );
  }
  savePrefProvider() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("Cusotmer_Image", Cusotmer_Image!);
  }

  File? file;
  Future pickercamera() async {
    final myfil = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      file = File(myfil!.path);
    });
    if (file != null)
    {
      updateImage();
    }
  }

  @override
  void initState() {
    getPref();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double wi = MediaQuery.of(context).size.width;
    double he = MediaQuery.of(context).size.height;
    return Scaffold(
        bottomNavigationBar: bottom_NavigationBar(home: 2),
        body: Stack(
          children: [
            Container(
              height: he / 4.5,
              child: Column(
                children: [
                  Container(
                    height: he / 5,
                    child: Container(
                        margin: EdgeInsets.only(bottom: 30),
                        decoration: BoxDecoration(
                          color: kTextColor,
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(
                            width: 1.0,
                            color: kTextColor,
                          ),
                        ),
                        child: Container(
                          height: 50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 0,
                                  ),
                                  Text(
                                    "الملف الشخصي",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  Container(
                                      child: Row(
                                    children: [
                                      InkWell(
                                        child: Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      )
                                    ],
                                  )),
                                ],
                              ),
                              SizedBox(
                                height: he / 30,
                              )
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ),
            Positioned(
              top: he / 7.5,
              right: wi / 2.5,
              child: InkWell(
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                      color: Colors.white,
                    ),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            Paths.Images_Customer + Cusotmer_Image!),
                        fit: BoxFit.cover),
                  ),
                ),
                onTap: () => pickercamera(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: he / 4, left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        child: Column(
                      children: [
                        NewTextField(
                            "أسم المستخدم",
                            "أسم المستخدم",
                            username,
                            Icon(
                              Icons.person,
                              color: kTextColor,
                            ),
                            true),
                        NewTextField(
                            "المدينة",
                            "المدينة",
                            area,
                            Icon(
                              Icons.location_city,
                              color: kTextColor,
                            ),
                            false),
                        InkWell(
                          child: NewTextField(
                              "الجنس",
                              "الجنس",
                              gender,
                              Icon(
                                Icons.female,
                                color: kTextColor,
                              ),
                              false),
                          onTap: () {
                            setState(() {
                              if (gender.text.toString() == "ذكر") {
                                gender.text = "انثى";
                              } else {
                                gender.text = "ذكر";
                              }
                            });
                          },
                        ),
                        NewTextField(
                            "البريد ألالكتروني",
                            "البريد ألالكتروني",
                            email,
                            Icon(
                              Icons.email_outlined,
                              color: kTextColor,
                            ),
                            false),
                        NewTextField(
                            "رقم الهاتف",
                            "رقم الهاتف",
                            phone,
                            Icon(
                              Icons.phone_android_outlined,
                              color: kTextColor,
                            ),
                            false),
                      ],
                    )),
                    Row(
                      children: [],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }

  TextField NewTextField(String lable, String hint,
      TextEditingController controller, Icon icon, bool enabled) {
    return TextField(
      enabled: enabled,
      style: TextStyle(fontSize: 15.0, height: 1.0, color: Colors.black),
      maxLines: 1,
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        labelText: lable,
        labelStyle: TextStyle(color: Colors.grey),
        hintText: hint,
        icon: icon,
        iconColor: Colors.orange,
      ),
      keyboardType: TextInputType.streetAddress,
      controller: controller,
    );
  }
}
