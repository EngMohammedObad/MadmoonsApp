import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter_svg/svg.dart';

import '../../colors.dart';
import 'package:http/http.dart' as http;

import '../../paths.dart';
import 'package:madmooon/paths.dart';

import '../chat/chat_home.dart';
import '../sharing.dart';
import 'Customer_home_body.dart';
import 'cancel_requst.dart';
import 'detalis_Customer_Home.dart';
import 'models/requst.dart';

class CustomerCard extends StatefulWidget {
  const CustomerCard({
    required this.Sercice_Provider_ID,
    required this.Service_Provider_Name,
    required this.Cusotmer_Image,
    required this.Customer_Name,
    required this.Areas_Name,
    required this.Requst_DataTime,
    required this.Requst_Service_ID,
    required this.Service_Number,
    required this.Service_Name,
    required this.Service_Image,
    required this.Requst_State,
    required this.Requst_Service_ALL_Details,
    required this.Customer_Phone_Number,
    required this.Sercice_Provider_Phone,
    required this.last_update,
    required this.parent_state,

    //  required this.Requst_Trans_DataTime,
  });
  final String Cusotmer_Image,
      Service_Provider_Name,parent_state,
      Sercice_Provider_ID,
      Sercice_Provider_Phone,
      Customer_Name,
      Areas_Name,
      Requst_DataTime,
      Requst_Service_ID;
  final String Service_Number,
      last_update,
      Service_Name,
      Requst_State,
      Service_Image,
      Requst_Service_ALL_Details,
      Customer_Phone_Number;

  @override
  State<CustomerCard> createState() => _CustomerCardState();
}

class _CustomerCardState extends State<CustomerCard> {
  countMessage() async {
    int i = 0;
    Uri url = Uri.parse(Paths.Message_Chat + "countMessage.php");
    var data = {
      "Requst_Number": widget.Requst_Service_ID,
    };

    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    print(responsebody[0]["Count"] + "*******" + widget.Requst_Service_ID);
    setState(() {
      countmessage = int.parse(responsebody[0]["Count"]);
    });
  }

  Future get_all_offers(String Offer_State, String Requst_ID) async {
    {
      Uri url = Uri.parse(Paths.Requst_Service + "get_all_offers.php");
      var data = {
        "Offer_State": Offer_State,
        "Requst_ID": Requst_ID,
      };

      var response = await http.post(url, body: data);
      var responsebody = jsonDecode(response.body);
      if (responsebody.length > 0) {
        setState(() {
          if (responsebody.length > 0) {
            oferfound = true;
          }
        });

        if (responsebody.length > 0) {
          oferfound = true;
        }
        for (int i = 0; i <= responsebody.length; i++) {
          if (responsebody[i]["Offer_State"] == "نعم") {
            setState(() {
              ofercountyes = ofercountyes + 1;
            });
          } else {
            setState(() {
              ofercountno = ofercountno + 1;
            });
          }
        }
      }
      return responsebody;
    }
  }

  String Sercice_Provider_ID1 = "";
  String Service_Provider_Name1 = "";
  String Cusotmer_Image1 = "";
  String Customer_Name1 = "";
  String Areas_Name1 = "";
  String Requst_DataTime1 = "";
  String Requst_Service_ID1 = "";
  String Service_Number1 = "";
  String Service_Name1 = "";
  String Service_Image1 = "";
  String Requst_State1 = "";
  String Requst_Service_ALL_Details1 = "";
  String Customer_Phone_Number1 = "";
  String Sercice_Provider_Phone1 = "";
  String last_update1 = "";
  bool oferfound = false;
  int ofercountyes = 0;
  int ofercountno = 0;
  bool show = false;
  int countmessage = 0;
  String time = "";
  var formate1;
  var formate2;
  Future get_all_Approval() async {
    Uri url = Uri.parse(Paths.Requst_Service + "get_all_Approval.php");
    var data = {
      "Requst_Service_ID": widget.Requst_Service_ID //widget.Service_Number
    };
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);

    setState(() {
      for (int i = 0; i < responsebody.length; i++) {
        if (responsebody[i]["Accept"] == "نعم") {
          ApprovalAccept = responsebody[i]['Approval_details'];
        }
      }
    });

    //return responsebody;
  }

  String ApprovalAccept = "";
  @override
  void initState() {
    get_all_Approval();
    get_all_offers("", widget.Requst_Service_ID);
    var dateTime = DateTime.parse(widget.Requst_DataTime);

    formate1 = "${dateTime.day}-${dateTime.month}-${dateTime.year}";

    time = widget.Requst_DataTime.substring(10, 16);
    String hour = time.substring(0, 3);
    if (int.parse(hour) > 12) {
      int s = int.parse(hour) - 12;
      time = s.toString() + widget.Requst_DataTime.substring(13, 16) + "  مساء";
    } else
      time = time + widget.Requst_DataTime.substring(13, 16) + " صباحا ";
    countMessage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getxCustomerHomeBody crt = Get.put(getxCustomerHomeBody());

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: (kDefaultPadding / 6),
        ),
        child: InkWell(
          onTap: () {
            Get.to(DetailsScreenpCustomer(
              Cusotmer_Image: widget.Cusotmer_Image,
              Customer_Name: widget.Customer_Name,
              Areas_Name: widget.Areas_Name,
              Requst_DataTime: widget.Requst_DataTime,
              Requst_Service_ID: widget.Requst_Service_ID,
              Service_Number: widget.Service_Number,
              Service_Name: widget.Service_Name,
              Service_Image: widget.Service_Image,
              Requst_State: widget.Requst_State,
              Requst_Service_ALL_Details: widget.Requst_Service_ALL_Details,
              Customer_Phone_Number: widget.Customer_Phone_Number,
              Service_Provider_Name: widget.Service_Provider_Name,
              Sercice_Provider_ID: widget.Sercice_Provider_ID,
              Sercice_Provider_Phone: widget.Sercice_Provider_Phone,
            ));
          },
          child: Column(
            children: [
              // Image.asset("images/Splach_Screen/splash.png"),
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                      color: Colors.grey.shade200,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                        colors: [Colors.white, Colors.white],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    // boxShadow: [
                    //   BoxShadow(
                    //       offset: Offset(0, 15),
                    //       blurRadius: 25,
                    //       color: Colors.black12),
                    // ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.all(5),
                              height: 80.0,
                              width: 80.0,
                              child: FadeInImage.assetNetwork(
                                placeholder:
                                    'images/Splach_Screen/gif_Splashr.gif',
                                image: Paths.Services_Images +
                                    widget.Service_Image,
                                fit: BoxFit.cover,
                              )),
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(top: 3),
                                    child: Text("خدمة " + widget.Service_Name,
                                        style: TextStyle(
                                            color: kPrimaryColor2,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))),
                                Container(
                                    margin: EdgeInsets.only(top: 3),
                                    child: Text(
                                        "المدينة :  " + widget.Areas_Name,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12))),
                                Container(
                                    margin: EdgeInsets.only(top: 3),
                                    child: Text(
                                        "حالة الطلب :  " + widget.Requst_State,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12))),
                                // Container(
                                //   height: 50,
                                //   width: 50,
                                //   color: Colors.yellow,
                                //   child: Obx(() {
                                //     return InkWell(
                                //       child: Image.asset(crt.imag.toString()),
                                //       onTap: () {
                                //
                                //         print(crt.state);
                                //         crt.state!.value = "123";
                                //         crt.state!.value =
                                //             widget.parent_state;
                                //         print("*"+widget.parent_state);
                                //
                                //
                                //       },
                                //     );
                                //   }),
                                // ),
                              ],
                            ),
                          ),
                          widget.Requst_State != "تم الطلب" &&
                                  widget.Requst_State != "انتهت"
                              &&
                              widget.Requst_State != "تم الإلغاء"
                              ? InkWell(
                                  child: Container(
                                      height: 60,
                                      width: 60,
                                      child: SvgPicture.asset(
                                        "images/chat/whatsapp.svg",
                                        color: kPrimaryColor2,
                                      )),
                                  onTap: () {
                                    Get.to(ChatHome(
                                      RequstState: widget.Requst_State,
                                      Requst_Number: widget.Requst_Service_ID,
                                    ));
                                  },
                                )
                              : SizedBox(height: 0,),
                        ],
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5, // 30 px padding
                            vertical: 5, // 5 px padding
                          ),
                          child: Text(
                            widget.last_update == ""
                                ? "لقد طلبت خدمة " +
                                    widget.Service_Name +
                                    " في تاريخ  " +
                                    formate1 +
                                    "  " +
                                    "الساعة " +
                                    time
                                : widget.last_update,
                            style: TextStyle(fontSize: 12),
                          )),
                      Column(
                        children: [
                          widget.Requst_State == "تم الطلب"&&widget.Requst_State !="انتهت"&&widget.Requst_State !="تم الإلغاء"
                              ? Container(
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1.0,
                                      color: Colors.grey.shade200,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                    gradient: LinearGradient(
                                        colors: [Colors.white, Colors.white],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight),
                                  ),
                                  child: Container(
                                      margin: EdgeInsets.all(5),
                                      width: double.infinity / 1.5,
                                      child: Text(
                                          widget.last_update == ""
                                              ? "تم استلام طلبك وسيتم تحويلك الى ممثل الخدمة"
                                              : widget.last_update,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12))),
                                )
                              : SizedBox(
                                  height: 0,
                                ),
                          /// start show message
                          widget.Requst_State == "تم الطلب"||widget.Requst_State == "في المقابلة"
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      child: Cancelit("إلغاء"),
                                      onTap: () {
                                        Get.to(cancelrequst(
                                          Service_Number:
                                              widget.Requst_Service_ID,parent_state: widget.parent_state,
                                        ));
                                      },
                                    ),
                                    countmessage > 0
                                        ? InkWell(
                                            child: Container(
                                                height: 60,
                                                width: 60,
                                                child: SvgPicture.asset(
                                                  "images/chat/whatsapp.svg",
                                                  color: kPrimaryColor2,
                                                )),
                                            onTap: () {
                                              Get.to(ChatHome(
                                                RequstState:
                                                    widget.Requst_State,
                                                Requst_Number:
                                                    widget.Requst_Service_ID,
                                              ));
                                            },
                                          )
                                        : SizedBox(
                                            height: 0,
                                          ),
                                  ],
                                )
                              : SizedBox(
                                  height: 0,
                                ),
                          /// end show message
                        ],
                      ),
                      oferfound == true&&widget.Requst_State !="انتهت"&&widget.Requst_State !="تم الإلغاء"
                          ? Container(
                              margin:
                                  EdgeInsets.only(right: 5, left: 5, bottom: 5),
                              decoration: BoxDecoration(
                                // border: Border.all(
                                //   width: 1.0,
                                //   color: kTextColor,
                                // ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10, // 30 px padding
                                      vertical: 8, // 5 px padding
                                    ),
                                    decoration: BoxDecoration(
                                      // border: Border.all(
                                      //   width: 1.0,
                                      //   color: kTextColor,
                                      // ),
                                      color: show
                                          ? kPrimaryColor2
                                          : Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        widget.Requst_State != "تم الطلب"
                                            ? Text(
                                                "عروض أسعار لهاذة الخدمة" +
                                                    "   " +
                                                    "( " +
                                                    ofercountyes.toString() +
                                                    " )",
                                                style: TextStyle(
                                                    color: show
                                                        ? Colors.white
                                                        : Colors.black87,
                                                    fontSize: 12),
                                              )
                                            : Text(
                                                "عروض أسعار لهاذة الخدمة" +
                                                    "   " +
                                                    "( " +
                                                    ofercountno.toString() +
                                                    " )",
                                                style: TextStyle(
                                                    color: show
                                                        ? Colors.white
                                                        : Colors.black87,
                                                    fontSize: 12),
                                              ),
                                        InkWell(
                                          child: Row(
                                            children: [
                                              Text(
                                                show ? "إخفاء" : "عرض",
                                                style: TextStyle(
                                                    color: show
                                                        ? Colors.white
                                                        : Colors.black54,
                                                    fontSize: 12),
                                              ),
                                              show
                                                  ? Icon(
                                                      Icons.arrow_upward,
                                                      color: Colors.white,
                                                      size: 12,
                                                    )
                                                  : Icon(
                                                      Icons
                                                          .arrow_downward_rounded,
                                                      color: Colors.black54,
                                                      size: 12,
                                                    )
                                            ],
                                          ),
                                          onTap: () {
                                            setState(() {
                                              show = !show;

                                              print("****************");
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(
                              height: 0,
                            ),
                      widget.Requst_State == "تم الطلب" &&
                              oferfound == true &&
                              show == true
                          ? Center(
                              child: Container(
                                  child: Column(
                                children: <Widget>[
                                  Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      child: Liest_Offers_pdf_Customer(
                                        Offer_State: "لا",
                                        Requst_ID: widget.Requst_Service_ID,
                                        Provider_ID: "1",
                                        type_get_offer: "all",
                                        parent_state: widget.parent_state,
                                      )),
                                ],
                              )),
                            )
                          : SizedBox(
                              height: 0,
                            ),
                      widget.Requst_State != "تم الطلب" &&
                              oferfound == true &&
                              show == true
                          ? Center(
                              child: Container(
                                  child: Column(
                                children: <Widget>[
                                  Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      child: Liest_Offers_pdf_Customer(
                                        Offer_State: "نعم",
                                        Requst_ID: widget.Requst_Service_ID,
                                        Provider_ID: "1",
                                        type_get_offer: "all",
                                        parent_state: widget.parent_state,
                                      )),
                                ],
                              )),
                            )
                          : SizedBox(
                              height: 0,
                            ),
                    ],
                  )),

              //
              // Positioned(
              //   top: 0.0,
              //   right: 0.0,
              //   child: Container(
              //     padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              //     height: 120.0,
              //     width: 120.0,
              //     decoration: BoxDecoration(
              //       shape: BoxShape.circle,
              //       // image: DecorationImage(
              //       //     image: NetworkImage(
              //       //         'https://fallingtaiz.000webhostapp.com/upload/usimage/$user_image'),
              //       //     fit: BoxFit.cover),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Container GroundContainer(String text) {
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10, // 30 px padding
          vertical: 8, // 5 px padding
        ),
        decoration: BoxDecoration(
          // border: Border.all(
          //   width: 1.0,
          //   color: kTextColor,
          // ),
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
            child: Center(
          child: Text(text, style: TextStyle(color: Colors.grey, fontSize: 16)),
        )));
  }

  Cancelit(String text) {
    return Container(
        color: Colors.white,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 8),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 1))
                  ]),
              child: Row(
                children: [
                  Container(
                      child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  )),
                  Container(
                      child: Text(
                    text,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ],
              ),
            )
          ],
        ));
  }
}

class getxCustomerHomeBody1 extends GetxController {
  Future get_all_requst(String ID_Customer, String state) async {
    Uri url;
    print("**************************999" + state);
    if (state == "تم الطلب") {
      url = Uri.parse(
          Paths.Requst_Service + "get_requst_on_requst_for_customer.php");
    } else {
      url = Uri.parse(Paths.Requst_Service + "get_requst_customer.php");
    }
    var data = {
      "ID_Customer": ID_Customer,
      "state": state,
    };
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body).obs;
    return responsebody;
  }

  Map myCategoryDynamic = {}.obs;
  change(RxString? Customer, RxBool fo, RxString st) {
    ID_Customer = Customer;
    found = fo;
    state = st;
  }

  fShow(bool shwo) {
    Shwo.value = shwo;
    imag!.value = "";
    Timer.periodic(Duration(seconds: 3), (timer) {
      Shwo.value = true;
    });
  }

  RxBool found = false.obs;
  RxBool Shwo = true.obs;
  RxString? ID_Customer = "".obs;
  RxString? state = "".obs;
  RxString? Customer_Name = "".obs;
  RxString? Cusotmer_Image = "".obs;
  RxString? Customer_Kind_Account = "".obs;
  RxString? Custmer_Account = "".obs;
  RxString? Type = "".obs;
  RxString? mytoken = "".obs;
  RxString? imag = "images/nodatafound.png".obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //ima.value="1";
  }
}
