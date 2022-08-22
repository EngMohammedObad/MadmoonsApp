import 'dart:async';
import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madmooon/pages/login_regester/login.dart';
import 'package:madmooon/pages/services/models/Services.dart';
import 'package:progress_indicators/progress_indicators.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../colors.dart';
import '../../../paths.dart';
import 'package:http/http.dart' as http;

import '../../user.dart';

String? STATEREQUST = "";
String? checkrequst;
String? WorkerNmae;

class DetailsBody extends StatefulWidget {
  const DetailsBody({
    required this.Service_Number,
    required this.Service_Name,
    required this.Servise_Sub_Title,
    required this.Service_Detailes,
    required this.Service_Image,
    required this.ID_Customer,
    required this.Customer_Name,
  });
  final String Service_Number;
  final String Service_Name,
      Service_Detailes,
      Servise_Sub_Title,
      Customer_Name,
      ID_Customer,
      Service_Image;

  @override
  _DetailsBodyState createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  ///       start Function for add NEW Requst
  static String Domain_Path = "https://madmooon.com/Madmun/";
  static String Login_and_Signin = Domain_Path + "php_files/Login_and_Signin/";
  TextEditingController details = new TextEditingController();
  TextEditingController Location = new TextEditingController();
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

  String? CustomerID = "";
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      CustomerID = preferences.getString("ID_Customer");
    });
  }



  String Areas_ID = "";
  Future get_all_location_by_name(String Areas_Name) async {
    Uri url = Uri.parse(Login_and_Signin + "get_all_location_by_name.php");
    showLoading ("من فضلك انتضر ثواني فقط");
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

  Add_new_requst() async {
    var now = DateTime.now();
    if (Areas_ID == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'يرجى أختيار منطقه لنخدمك فيها',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'Cairo'),
          ),
          backgroundColor: kTextColor,
        ),
      );
      return;
    }

    var data = {
      "Requst_DataTime": now.toString(),
      "Service_Number": widget.Service_Number,
      "ID_Customer": CustomerID, //getPref(),//widget.ID_Customer,
      "Area": Areas_ID.toString(),
      "Requst_Service_ALL_Details": details.text.toString(),
      "Requst_Videw": "لايوجد",
      "Requst_State": "تم الطلب",
      // "additional": ListAddin,
    };
    showLoading("جاري طلب الخدمة");
    Uri url = Uri.parse(Paths.Requst_Service + "add_new_requst.php");
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    print(responsebody);
    if (responsebody['status'] == "success") {

      for (int index = 0; index < ListAddin.length; index++) {
        var data2 = {
          "Additional_Service_ID": ListAddin[index],
          "Additional_Requst_ID": responsebody['id']
        };

        Uri url2 = Uri.parse(Paths.Requst_Service + "Additional_Requst.php");
        var response2 = await http.post(url2, body: data2);
        var responsebody2 = jsonDecode(response2.body);

      }
Get.back();
      setState(() {
        STATEREQUST = "تم الطلب";
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'تم طلب الخدمه‘ سنقوم بالتواصل معك في اقرب وقت',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'Cairo'),
          ),
          backgroundColor: kTextColor,
        ),
      );
      //Get.offAll(Home());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'هناك مشكله في طلب الخدمة',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'Cairo'),
          ),
          backgroundColor: kTextColor,
        ),
      );
    }
    Get.back();
  }

  ///       End Function for add NEW Requst
  String? ID_Customer = "";
  List ListAddin = [];
  getPref2() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      ID_Customer = preferences.getString("ID_Customer");
      print("*********************" + ID_Customer! + "#####################p");
      check();
    });
  }

  List<Additional> additional = [];
  List<AdditionalRequst> additionalRequst = [];
  @override
  void initState() {
    setState((){
      STATEREQUST="";
      checkrequst="";
    });
    getPref2();

    ID_Customer;
    fetch_location();
    getPref();


    get_Additional_by_service();
    // Timer.periodic(Duration(seconds: 2), (timer) {
    //   setState(() {
    //     get_Additional_by_service();
    //   });
    //
    //   print("*");
    // });

    super.initState();
  }

  Future get_Additional_by_service() async {
    Uri url = Uri.parse(Paths.Requst_Service + "get_Additional_by_service.php");
    var data = {"Additional_Service_Number": widget.Service_Number};
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    if (responsebody.length > 0) {
      for (int i = 0; i < responsebody.length; i++) {
        additional.add(Additional(
            Additional_Number: responsebody[i]["Additional_Number"],
            Additional_Service_Number: responsebody[i]
                ["Additional_Service_Number"],
            Additional_Details: responsebody[i]["Additional_Details"]));
      }
    }
  }

  check() async {
    print("*********************" + ID_Customer! + "#####################c");
    // print( widget.ID_Customer+"6666666666666666666666666666666666666666666");
    // print( widget.Service_Number+"9999999999999999999999999999999999999999");
    var data = {
      "ID_Customer": ID_Customer //widget.ID_Customer
      ,
      "Service_Number": widget.Service_Number
    };
    Uri url = Uri.parse(Paths.Requst_Service + "check_requst_found.php");
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    print(responsebody);
    if (responsebody['status'] == "success") {
      checkrequst = responsebody['Requst_State'];

      if (checkrequst == "تم الطلب") {
        setState(() {
          STATEREQUST = "تم الطلب";
        });
      }
      if (checkrequst == "في المقابلة") {
        setState(() {
          STATEREQUST = "في المقابلة";
        });
      }
    } else {
      setState(() {
        STATEREQUST = "طلب الخدمة";
      });
    }
    print(responsebody['status']);
  }

  @override
  Widget build(BuildContext context) {
    // to provide us the height and the width of the sceen
    double wi = MediaQuery.of(context).size.width;
    double he = MediaQuery.of(context).size.width;
    var mdw = MediaQuery.of(context).size.width;
    var mhe = MediaQuery.of(context).size.height;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
                  decoration: BoxDecoration(
                    color: kPrimaryColor2,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Center(
                      //   child: Image.network(
                      //
                      //     Path.Services_Images+Service_Image,
                      //
                      //   ),
                      // ),
                      ////////
                      Container(
                        child: Column(
                          // alignment: Alignment.bottomCenter,
                          children: [
                            // Container(
                            //   height: size.width * 0.7,
                            //   width: size.width * 0.7,
                            //   decoration: BoxDecoration(
                            //     color: Colors.white,
                            //     shape: BoxShape.circle,
                            //   ),
                            // ),

                            Center(
                              child: Hero(
                                tag: Paths.Services_Images +
                                    widget.Service_Image,
                                child: FadeInImage.assetNetwork(
                                  placeholder:
                                      'images/Splach_Screen/gif_Splashr.gif',
                                  image: Paths.Services_Images +
                                      widget.Service_Image,
                                  height: he / 2.75,
                                  width: wi / 2.75,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // Image.network(
                            //   Path.Services_Images+Service_Image,
                            //
                            // ),
                            Text(
                              widget.Service_Name,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )
                          ],
                        ),
                      ),

                      // SizedBox(height: kDefaultPadding),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 10,
                    ),
                    Text(
                      widget.Service_Name,
                      style: TextStyle(color: kPrimaryColor2, fontSize: 18),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding * 1.5,
                    vertical: kDefaultPadding / 2,
                  ),
                  child: Text(
                    widget.Service_Detailes,
                    style: TextStyle(color: Colors.black54, fontSize: 16.0),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: wi / 10, right: wi / 10),
                    child: Divider(
                      color: Colors.black54,
                    )),
                STATEREQUST != "في المقابلة" &&
                        STATEREQUST != "تم الطلب" &&
                        ID_Customer != null &&
                        ID_Customer != "" &&
                        additional.length > 0
                    ? Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: kDefaultPadding * 1.5,
                          vertical: kDefaultPadding / 2,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "أختر نوع الخدمات التي تريدها",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              width: wi / 1.1,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(22),
                                border: Border.all(
                                  width: 1.0,
                                  color: kTextColor,
                                ),
                              ),
                              child: Container(
                                child: SingleChildScrollView(
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      children: additional.map((additionals) {
                                        return Container(
                                          child: Column(
                                            children: [
                                              additinallist(additionals)
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),

                          ],
                        ),
                      )
                    : SizedBox(
                        height: 0,
                      ),
                additionalRequst.length>0?   Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding * 1.5,
                    vertical: kDefaultPadding / 2,
                  ),
                  child: Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "الخدمات المضافة",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: wi / 1.1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(
                            width: 1.0,
                            color: kTextColor,
                          ),
                        ),
                        child: Container(
                          child: SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: additionalRequst.map((add) {
                                  return Container(
                                    child: Column(
                                      children: [additionalReq(add)],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ):SizedBox(height: 0,),
                ID_Customer == null || ID_Customer == ""
                    ? Center(
                        child: InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(kDefaultPadding),
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      kDefaultPadding * 1.5, // 30 px padding
                                  vertical: kDefaultPadding / 5, // 5 px padding
                                ),
                                decoration: BoxDecoration(
                                  //color: kTextLightColor,
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                child: InkWell(
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(right: 15, left: 15),
                                    decoration: BoxDecoration(
                                        color: kPrimaryColor2,
                                        borderRadius: BorderRadius.circular(30),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.white.withOpacity(.3),
                                              spreadRadius: 1,
                                              blurRadius: 2,
                                              offset: Offset(0, 1))
                                        ]),
                                    child: Text('تسجيل الدخول لطلب الخدمة',
                                        style: TextStyle(
                                            fontSize: 24, color: Colors.white),
                                        textAlign: TextAlign.center),
                                  ),
                                )),
                          ),
                          onTap: () {
                            Get.to(Login());
                          },
                        ),
                      )
                    :

                    /// ////////////////////////////////////////////////////
                    Center(
                        child: InkWell(
                          child: Container(
                              decoration: BoxDecoration(
                                //color: kTextLightColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: InkWell(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.01,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor2,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black.withOpacity(.3),
                                            spreadRadius: 1,
                                            blurRadius: 2,
                                            offset: Offset(0, 1))
                                      ]),
                                  child: Center(
                                    child: Text(
                                      STATEREQUST!,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                ),
                              )),
                          onTap: () {
                            setState(() {
                              if (STATEREQUST == "طلب الخدمة") {
                                buildShowModalBottomSheet(context, mhe, mdw);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'تم طلب الخدمه مسبقا‘ سنقوم بالتواصل معك خلال 24 ساعة',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: 'Cairo'),
                                    ),
                                    backgroundColor: kTextColor,
                                  ),
                                );
                              }
                              //  if(checkrequst=="في المقابلة")
                              // {
                              //
                              // ScaffoldMessenger.of(context).showSnackBar(
                              // const SnackBar(content: Text('تم طلب الخدمه مسبقا‘ سنقوم بالتواصل معك خلال 24 ساعة',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,
                              // fontSize: 20,
                              // fontFamily: 'Cairo'),),backgroundColor:kTextColor,),
                              // );
                              // //Add_new_requst();
                              // setState(() {
                              //   STATEREQUST="تم طلب الخدمة";
                              // });
                              //
                              // }
                              // else  if(STATEREQUST=="قيد التنفيد"){
                              //
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     const SnackBar(content:
                              //
                              //     Text('عمليتك قيد التنفيد',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,
                              //         fontSize: 20,
                              //         fontFamily: 'Cairo'),),backgroundColor: kTextColor,),
                              //   );
                              //   STATEREQUST="قيد التنفيد";
                              // }
                              // else if(STATEREQUST==" انتهت")
                              // {
                              //   Get.to(Send_Requst(ID_Customer: widget.ID_Customer,Service_Number: widget.Service_Number,));
                              //
                              // }
                              // else if(STATEREQUST=="تم الطلب")
                              // {
                              //
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     const SnackBar(content: Text('تم طلب الخدمه مسبقا‘ سنقوم بالتواصل معك خلال 24 ساعة',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,
                              //         fontSize: 20,
                              //         fontFamily: 'Cairo'),),backgroundColor:kTextColor,),
                              //   );
                              //   //Add_new_requst();
                              //   STATEREQUST="تم طلب الخدمة";
                              // }
                            });
                          },
                        ),
                      ),
                SizedBox(height: kDefaultPadding),

              ],
            ),
          ],
        ));
  }

  Future<void> buildShowModalBottomSheet(
      BuildContext context, double mhe, double mdw) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            height: mhe / 1.3,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                        child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 5),
                              height: 10,
                              width: 150,
                              decoration: BoxDecoration(
                                color: kPrimaryColor2,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          Center(
                              child: Container(
                                  margin: EdgeInsets.only(top: 50),
                                  child: Text(
                                    "طلب الخدمة",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 25),
                                  ))),
                          buildFormUpdateCategory(mdw),
                          Container(
                              child: Column(
                            children: <Widget>[
                              SizedBox(height: 5),
                              RaisedButton(
                                color: Colors.grey[700],
                                elevation: 10,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 40),
                                onPressed: () {
                                  Add_new_requst();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      "طلب الخدمة ",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 4),
                                        padding: EdgeInsets.only(right: 10),
                                        child: Icon(
                                          Icons.add_circle,
                                          color: Colors.white,
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          )),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ),
        );
        //   Container(
        //   height: 200,
        //   color: Colors.amber,
        //   child: Center(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       mainAxisSize: MainAxisSize.min,
        //       children: <Widget>[
        //         const Text('Modal BottomSheet'),
        //         ElevatedButton(
        //           child: const Text('Close BottomSheet'),
        //           onPressed: () => Navigator.pop(context),
        //         )
        //       ],
        //     ),
        //   ),
        // );
      },
    );
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
  Container additinallist(Additional additionals) {
    return Container(
      child: Card(
        child: ListTile(
          title: Text(additionals.Additional_Details),
          //subtitle: Text(personone.phone + "\n" + personone.address),
          leading: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: kPrimaryColor2),
            child: Icon(Icons.add),
            onPressed: () {
              setState(() {
                ListAddin.add(additionals.Additional_Number);
                print(ListAddin);
                additionalRequst.add(AdditionalRequst(
                    Additional_Number: additionals.Additional_Number,
                    Additional_Service_Number:
                        additionals.Additional_Service_Number,
                    Additional_Details: additionals.Additional_Details));
                additional.removeWhere((element) {
                  return element.Additional_Number ==
                      additionals.Additional_Number;
                  //refresh UI after deleting element from list
                });
              });
              //go through the loop and match content to delete from list
            },
          ),
        ),
      ),
    );
  }

  Container additionalReqBack(AdditionalRequst additionalRequsts) {
    var mdw = MediaQuery.of(context).size.width;
    var mhe = MediaQuery.of(context).size.height;
    return Container(
      child: Container(
        child: Card(
          child: ListTile(
            title: Text(additionalRequsts.Additional_Details),
            //subtitle: Text(personone.phone + "\n" + personone.address),
            leading: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: kPrimaryColor2),
              child: Icon(Icons.delete_forever_outlined),
              onPressed: () {
                setState(() {
                  ListAddin.remove(additionalRequsts.Additional_Number);
                  print(ListAddin);
                  additional.add(Additional(
                      Additional_Number: additionalRequsts.Additional_Number,
                      Additional_Service_Number:
                          additionalRequsts.Additional_Service_Number,
                      Additional_Details:
                          additionalRequsts.Additional_Details));
                  additionalRequst.removeWhere((element) {
                    return element.Additional_Number ==
                        additionalRequsts.Additional_Number;
                    //refresh UI after deleting element from list
                  });
                  Get.back();
                  buildShowModalBottomSheet(context, mhe, mdw);
                });
                //go through the loop and match content to delete from list
              },
            ),
          ),
        ),
      ),
    );
  }

  Container additionalReq(AdditionalRequst additionalRequsts) {
    return Container(
      child: Card(
        child: ListTile(
          title: Text(additionalRequsts.Additional_Details),
          //subtitle: Text(personone.phone + "\n" + personone.address),
          leading: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: kPrimaryColor2),
            child: Icon(Icons.delete_forever_outlined),
            onPressed: () {
              setState(() {
                ListAddin.remove(additionalRequsts.Additional_Number);
                print(ListAddin);
                additional.add(Additional(
                    Additional_Number: additionalRequsts.Additional_Number,
                    Additional_Service_Number:
                        additionalRequsts.Additional_Service_Number,
                    Additional_Details: additionalRequsts.Additional_Details));
                additionalRequst.removeWhere((element) {
                  return element.Additional_Number ==
                      additionalRequsts.Additional_Number;
                  //refresh UI after deleting element from list
                });
              });
              //go through the loop and match content to delete from list
            },
          ),
        ),
      ),
    );
  }

  Center buildFormUpdateCategory(double mdw) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInOutBack,
        margin: EdgeInsets.only(top: 20),
        //height: 700,
        width: mdw / 1.2,
        decoration: BoxDecoration(color: Colors.transparent, boxShadow: [
          BoxShadow(
              color: Colors.white10,
              spreadRadius: .1,
              blurRadius: 1,
              offset: Offset(1, 1))
        ]),
        child: Form(
            child: Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
            additionalRequst.length>0
                        ? Container(
                            margin: EdgeInsets.only(top: 10, bottom: 15),
                            width: mdw / 1.1,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(
                                width: 1.0,
                                color: kTextColor,
                              ),
                            ),
                            child: Container(
                              width: double.infinity,
                              child: SingleChildScrollView(
                                child: Container(
                                  width: 300,
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: additionalRequst.map((add) {
                                      return Container(
                                        child: Column(
                                          children: [additionalReqBack(add)],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : SizedBox(
                            height: 0,
                          ),
                    DropdownSearch<String>(
                      validator: (val) => val == null ? 'Bir şehir seçiniz' : null,
                      mode: Mode.BOTTOM_SHEET,
                      showSelectedItems: true,

                      maxHeight: 400,
                      // showClearButton: true,
                      popupBackgroundColor: Colors.white,
                      // popupBarrierColor: Colors.grey[100],
                      showSearchBox: true,

                      items: list,
                      // ["Brazil", "France", "Tunisia", "Canada"],
                      label: "مناطق الخدمة",
                      hint: "أختر منطقة لنخدمك فيها",

                      popupItemDisabled: (String s) => s.startsWith('I'),

                      onChanged: (val) {
                        Location.text = val!;
                        get_all_location_by_name(val);
                      },
                      //selectedItem: selectedItem
                    ),
                  ],
                )

                // Start Text Username
                ,
                SizedBox(
                  height: 20,
                ),
                Text(
                  "كيف تريد ان تكون خدمتنا لك",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 3,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: details,
                    minLines: 2,
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        hintText: 'كيف تريد ان نخدمك بأختصار',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        )),
                  ),
                ),

                // End Text username

                // End Text username
              ],
            ),
          ),
        )),
      ),
    );
  }

  Positioned buildPositionedtop(double mdw) {
    return Positioned(
        child: Transform.scale(
      scale: 1.3,
      child: Transform.translate(
        offset: Offset(0, -mdw / 1.7),
        child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            height: mdw,
            width: mdw,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(mdw), color: Colors.blue)),
      ),
    ));
  }

  Positioned buildPositionedBottom(double mdw) {
    return Positioned(
        top: 300,
        right: mdw / 1.5,
        child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            height: mdw,
            width: mdw,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(mdw),
                color: Colors.grey[800]!.withOpacity(0.3))));
  }
}

class Additional {
  //modal class for Person object
  String Additional_Number, Additional_Service_Number, Additional_Details;

  Additional(
      {required this.Additional_Number,
      required this.Additional_Service_Number,
      required this.Additional_Details});
}

class AdditionalRequst {
  //modal class for Person object
  String Additional_Number, Additional_Service_Number, Additional_Details;
  AdditionalRequst(
      {required this.Additional_Number,
      required this.Additional_Service_Number,
      required this.Additional_Details});
}



// showDialogAll(context, String mytitle, String mycontent) {
//   return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text(mytitle),
//           content: Text(mycontent),
//           actions: <Widget>[
//             FlatButton(
//               child: Text("done"),
//               onPressed: () {
//                 Get.back();
//               },
//             ),
//           ],
//         );
//       });
// }

