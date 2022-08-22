import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:madmooon/pages/Customer/details/stages_details.dart';
import 'package:readmore/readmore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../colors.dart';
import '../../../paths.dart';
import 'package:http/http.dart' as http;

import '../../sharing.dart';
import '../cancel_requst.dart';
import '../models/requst.dart';

class DetailsBodyCustomer extends StatefulWidget {
  const DetailsBodyCustomer({
    required this.Service_Provider_Name,
    required this.Sercice_Provider_Phone,
    required this.Sercice_Provider_ID,
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
  });
  final String Cusotmer_Image,
      Customer_Name,
      Areas_Name,
      Requst_DataTime,
      Requst_Service_ID,
      Customer_Phone_Number;
  final String Service_Number,
      Service_Provider_Name,
      Sercice_Provider_ID,
      Service_Name,
      Requst_State,
      Service_Image,
      Requst_Service_ALL_Details,
      Sercice_Provider_Phone;

  @override
  _DetailsBodyCustomer createState() => _DetailsBodyCustomer();
}

class _DetailsBodyCustomer extends State<DetailsBodyCustomer> {
  var x = null;
  int y = 0;
  bool isfound = false;
  @override
  Future getCOUTNT(String Requst_Service_ID) async {
    Uri url =
    Uri.parse(Paths.Stages_Server + "get_all_stages_for_one_requst.php");
    var data = {"Requst_Service_ID": Requst_Service_ID};
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    for (int i = 0; i < responsebody.length; i++) {
      y++;
    }

    if (y > 0) {
      setState(() {
        isfound = true;
      });
    } else
      setState(() {
        isfound = false;
      });
  }

  double height = 40;
  double width = 192;
  Color colorbutoon = Colors.white;
  String? datet = "";
  String? StateRequst;
  String? selectedadd;

  String? provider_name = "";
  String? provider_number = "";
  String noApproval = "";
  String Approval_ID = "";
  Future get_all_Approval() async {
    Uri url = Uri.parse(Paths.Requst_Service + "get_all_Approval.php");
    var data = {
      "Requst_Service_ID": widget.Requst_Service_ID //widget.Service_Number
    };
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    print(responsebody[0]["Accept"] + "***************************");
    setState(() {
      for (int i = 0; i < responsebody.length; i++) {
        if (responsebody[i]["NotAgree"] == "لا" &&
            responsebody[i]["Accept"] == "لا") {
          noApproval = responsebody[i]['Approval_details'];
          Approval_ID= responsebody[i]['Approval_ID'];
        }
      }
      print("**********789");
      print(responsebody);
    });

    //return responsebody;
  }
  Future update_requst_for_share(String Approval_State) async {

    Uri url = Uri.parse(Paths.Requst_Service + "update_requst_for_share.php");
    var data = {
      "Requst_Service_ID": widget.Requst_Service_ID ,
      "Approval_ID": Approval_ID ,
      "Approval_State": Approval_State ,
    };
    var response = await http.post(url, body: data);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'تم ارسال ملاحضتك بنجاح',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontFamily: 'Cairo'),
        ),
        backgroundColor: kPrimaryColor2,
      ),
    );
    Get.back();

    //return responsebody;
  }
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.getString("ID_Customer");
    preferences.getString("Customer_Name");
    return preferences.getString("ID_Customer");
  }

  Future getSearch_Name_Provider() async {
    Uri url = Uri.parse(Paths.Requst_Service + "searh_provider.php");
    var data = {
      "Service_Provider_Name": searsh_name.text,
      "Representatives_ID": "1",
      "Service_Number": widget.Service_Number //widget.Service_Number
    };
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    print(responsebody);
    return responsebody;
  }

  Future get_cancel_details() async {
    print(widget.Requst_Service_ID + "*****");
    Uri url = Uri.parse(Paths.Requst_Service + "get_cancel_details.php");
    var data = {
      "Requst_Service_ID": widget.Requst_Service_ID //widget.Service_Number
    };
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    print("********");
    setState(() {
      cancel_reason = responsebody[0]["cancel_reason"];
      cancel_date = responsebody[0]["cancel_date"];
      another_reason = responsebody[0]["another_reason"];
    });
  }

  String cancel_reason = "";
  String cancel_date = "";
  String another_reason = "";
  @override
  TextEditingController searsh_name = new TextEditingController();
  TextEditingController _adddiscription = new TextEditingController();
  bool show = false;
  String choese_name = "";
  int choese_number = 0;
  String reason = "";
  String Cancel = "";
  void initState() {
    getCOUTNT(
      widget.Requst_Service_ID,
    );
    x = get_all_stages_for_requst(
      widget.Requst_Service_ID,
    );
    widget.Requst_State;
    super.initState();
    searsh_name;
    show;
    provider_name = "";
    provider_number = "";

    height = 40;
    width = 192;
    if (widget.Requst_State == "تم الطلب" ||
        widget.Requst_State == "في المقابلة" && widget.Customer_Name != "") {
      setState(() {
        reason = "إالغاء الطلب";
      });
    }
    if (widget.Requst_State == "تم الإلغاء") {
      setState(() {
        get_cancel_details();
      });
    }
    get_all_Approval();
  }

  final format = DateFormat("yyyy-MM-dd HH:mm");
  @override
  Widget build(BuildContext context) {
    // to provide us the height and the width of the sceen
    Size size = MediaQuery.of(context).size;
    return Container(
      // textDirection: TextDirection.rtl,
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
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

                      //ContainerText(widget.Customer_Name, Colors.white),
                      Center(
                        child: ContainerNEW(
                          widget.Customer_Name,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
                        height: size.width * 0.8,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            FadeInImage.assetNetwork(
                              placeholder: 'images/Splach_Screen/gif_Splashr.gif',
                              image: Paths.Services_Images + widget.Service_Image,
                              height: size.width * 0.75,
                              width: size.width * 0.75,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      ContainerTitle("نوع الخدمة", Colors.white),
                      SizedBox(
                        height: 3,
                      ),
                      Center(
                        child: ContainerNEW(
                          widget.Service_Name,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),

                      // SizedBox(height: kDefaultPadding),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),

                ContainerTitle("تفاصيل طلب خدمة العميل" + " : ", Colors.white),
                SizedBox(
                  height: 3,
                ),
                Center(
                  child: ContainerNEW(
                    widget.Requst_Service_ALL_Details,
                  ),
                ),
                // ContainerText(widget.Requst_Service_ALL_Details, Colors.white),
                SizedBox(
                  height: 5,
                ),
                ContainerTitle("موقع الطلب" + " : ", Colors.white),
                SizedBox(
                  height: 3,
                ),
                Center(
                  child: ContainerNEW(
                    widget.Areas_Name,
                  ),
                ),
                // C

                SizedBox(
                  height: 3,
                ),
                ContainerTitle("حالة الخدمة" + " : ", Colors.white),
                SizedBox(
                  height: 3,
                ),
                Center(
                  child: widget.Requst_State == "في المقابلة"
                      ? ContainerNEW("أنتضار المقابلة")
                      : ContainerNEW(widget.Requst_State),
                ),
                widget.Requst_State == "تم الإلغاء"
                    ? ContainerNEW("السبب الرئيسي" +
                    " " +
                    cancel_reason +
                    "  " +
                    another_reason +
                    " " +
                    " وقت الإلغاء " +
                    cancel_date)
                    : Text(""),
                SizedBox(
                  height: 10,
                ),
                widget.Requst_State!="تم الطلب"?
                Column(
                  children: [
                    ContainerTitle(" أسم مقدم الخدمة" + " : ", Colors.white),
                    SizedBox(
                      height: 3,
                    ),
                    ContainerNEW(widget.Service_Provider_Name),
                    // SizedBox(
                    //   height: 10,
                    // ),  ContainerTitle(" الرقم التعريفي لمقدم الخدمة" + " : ", Colors.white),
                    // SizedBox(
                    //   height: 3,),
                    // ContainerNEW(widget.Sercice_Provider_ID),
                  ],
                ):

                widget.Requst_State!="تم الطلب"?
                Column(
                  children: [
                    ContainerTitle(" رقم هاتف مقدم الخدمة" + " : ", Colors.white),
                    SizedBox(
                      height: 3,
                    ),
                    ContainerNumberPhone(widget.Sercice_Provider_Phone),
                  ],
                ):
                Text(""),

                reason == ""
                    ? Text("")
                    : InkWell(
                  child: Cancelit(reason),
                  onTap: () {
                    Get.to(cancelrequst(
                      Service_Number: widget.Requst_Service_ID,parent_state: widget.Requst_State,
                    ));
                  },
                ),
                SizedBox(height: 8,),
                widget.Requst_State == "تم الطلب" && noApproval != ""
                    ? ContainerForAgreeOrNotAgree()
                    : Text(""),

                isfound == true
                    ? Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "المراحل",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                )
                    : Text(""),
                isfound == true
                    ? Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(1),
                  height: 300,
                  child: FutureBuilder(
                      future: get_all_stages_for_requst(
                        widget.Requst_Service_ID,
                      ),
                      builder:
                          (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          dynamic snap = snapshot.data;
                          return GridView.builder(

                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                              itemCount: snap.length,
                              itemBuilder: (BuildContext context, index) {
                                print("lpost[index].cat_name");

                                return Stages_Details(
                                    Service_Stages_ID: snapshot.data[index]
                                    ["Service_Stages_ID"],
                                    Requst_Service_State: snapshot.data[index]
                                    ["Requst_Service_State"],
                                    Date_Start: snapshot.data[index]
                                    ["Date_Start"],
                                    Date_Finsh: snapshot.data[index]
                                    ["Date_Finsh"],
                                    Stages_Cost: snapshot.data[index]
                                    ["Stages_Cost"],
                                    Stage_Details: snapshot.data[index]
                                    ["Stages_Details"],
                                    Index: (index + 1).toString(),
                                    Service_Name: widget.Service_Name);
                              });
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                )
                    : Text(""),
              ],
            )
          ],
        ));
  }

  Container ContainerForAgreeOrNotAgree() {
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 1.5, // 30 px padding
          vertical: kDefaultPadding / 5, // 5 px padding
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [activeColor, kBlueColor],
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
        // decoration: BoxDecoration(
        //   color: color,
        //   borderRadius: BorderRadius.circular(22),
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Divider(),
            Container(
              padding: EdgeInsets.all(8),
              child: ReadMoreText(
                noApproval,
                trimLines: 2,
                colorClickableText: Colors.pink,
                style: TextStyle(color: Colors.white, fontSize: 18),
                trimMode: TrimMode.Line,
                trimCollapsedText: ' مشاهدة المزيد',
                trimExpandedText: 'مشاهدة أقل',
                lessStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber),
                moreStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
                child: ContainerTitle("موافق",Colors.white),
                onTap:(){
                  update_requst_for_share("نعم");

                }
            ),

            SizedBox(width: 20,),
            InkWell(
                child: ContainerTitle("غير موافق",Colors.white),
                onTap:(){
                  update_requst_for_share("لا");

                }
            ),

            SizedBox(height: 20,)
            // Row(
            //
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     InkWell(
            //         child: ContainerTitle("موافق",Colors.white),
            //         onTap:(){
            //           update_requst_for_share("نعم");
            //
            //         }
            //     ),
            //
            //     SizedBox(width: 20,),
            //     InkWell(
            //         child: ContainerTitle("غير موافق",Colors.white),
            //         onTap:(){
            //           update_requst_for_share("لا");
            //
            //         }
            //     ),
            //
            //     SizedBox(height: 20,)
            //   ],
            // )
          ],
        )
    ,);
  }

  ContainerNEW(String text) {
    return Container(
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, // 30 px padding
          vertical: kDefaultPadding / 3, // 5 px padding
        ),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [iconColor, kBlueColor],
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
        // decoration: BoxDecoration(
        //   color: color,
        //   borderRadius: BorderRadius.circular(22),
        // ),
        child: Center(
          child: InkWell(
            child: ReadMoreText(
              text,
              trimLines: 2,
              colorClickableText: Colors.pink,
              style: TextStyle(
                  color: Colors.white, fontSize: 18),
              trimMode: TrimMode.Line,
              trimCollapsedText: ' مشاهدة المزيد',
              trimExpandedText: 'مشاهدة أقل',
              lessStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber),
              moreStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber),
            ),
          ),
        ));
  }

  Cancelit(String text) {
    return Container(
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, // 30 px padding
          vertical: kDefaultPadding / 3, // 5 px padding
        ),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.yellow, Colors.red],
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
        // decoration: BoxDecoration(
        //   color: color,
        //   borderRadius: BorderRadius.circular(22),
        // ),
        child: Center(
          child: InkWell(
              child: RichText(
                text: TextSpan(
                    style: //Theme.of(context).textTheme.headline6,
                    TextStyle(color: Colors.white, fontSize: 15),
                    children: [
                      TextSpan(
                        text: text,
                      ),
                    ]),
              )),
        ));
  }

  ContainerTitle(String text, Color color) {
    return Container(
        padding: EdgeInsets.symmetric(
          // horizontal: kDefaultPadding * 1.5, // 30 px padding
          // vertical: kDefaultPadding / 5, // 5 px padding
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [activeColor, kBlueColor],
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
        // decoration: BoxDecoration(
        //   color: color,
        //   borderRadius: BorderRadius.circular(22),
        // ),
        child: InkWell(
          child: ReadMoreText(
            text,
            trimLines: 2,
            colorClickableText: Colors.pink,
            style: TextStyle(
                color: Colors.white, fontSize: 18),
            trimMode: TrimMode.Line,
            trimCollapsedText: ' مشاهدة المزيد',
            trimExpandedText: 'مشاهدة أقل',
            lessStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.amber),
            moreStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.amber),
          ),

        ));
  }

  Card_Search_Provider(String Sercice_Provider_ID, String Service_Provider_Name,
      String Service_Provider_Image, String Areas_Name) {
    return Container(
      // margin: EdgeInsets.symmetric(
      //   horizontal: kDefaultPadding,
      //   vertical: kDefaultPadding / 2,
      // ),
      //height: 30.0,
      margin: EdgeInsets.only(top: 6),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [activeColor, kBlueColor],
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
      child: InkWell(
        onTap: () {
          setState(() {
            provider_name = Service_Provider_Name;
            provider_number = Sercice_Provider_ID;
            searsh_name.text = provider_name.toString();
          });
        },
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 10.0,
              left: 70.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Container(
                  margin: EdgeInsets.all(5),
                  // width: 45,
                  // height: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                          Service_Provider_Image != "null"
                              ? Paths.Provider_Images + Service_Provider_Image
                              : Paths.Customer_Images + "Mohammed.jpg",
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [activeColor, kBlueColor],
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
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: //Theme.of(context).textTheme.headline6,
                      TextStyle(color: backgroundColor, fontSize: 18),
                      children: [
                        TextSpan(
                            text: Sercice_Provider_ID +
                                "- " +
                                Service_Provider_Name +
                                " " +
                                Areas_Name),
                      ]),
                ))
          ],
        ),
      ),
    );
  }

///  searsh provider  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
}

mySpec(context, String picture, String name, var cat_id, var Date_Finsh,
    var Stages_Cost, var Stages_Details) {
  return Container(
      height: 100,
      width: 100,
      child: InkWell(
        child: ListTile(
          title: FadeInImage.assetNetwork(
            placeholder: 'images/Copper-Loader.gif',
            image:
            "https://fallingtaiz.000webhostapp.com/upload/categories_images/$picture",
            width: 80,
            height: 80,
            fit: BoxFit.fill,
          ),
          subtitle: Container(
            child: Text(
              "$name",
              textAlign: TextAlign.center,
            ),
          ),
        ),
        onTap: () {},
      ));
}
