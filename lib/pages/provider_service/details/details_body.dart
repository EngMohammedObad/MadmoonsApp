import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:madmooon/pages/Offer/add_new_offer.dart';
import 'package:madmooon/pages/stages/add_stages.dart';
import 'package:readmore/readmore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../colors.dart';
import '../../../paths.dart';
import 'package:http/http.dart' as http;

import '../../sharing.dart';


class DetailsBodyProvider extends StatefulWidget {
  const DetailsBodyProvider({
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
    required this.Interview_DateAndTime,
    required this.Location_Interview,
  });
  final String Cusotmer_Image,
      Customer_Name,
      Areas_Name,
      Requst_DataTime,
      Requst_Service_ID,
      Customer_Phone_Number;
  final String Service_Number,
      Location_Interview,
      Service_Name,
      Requst_State,
      Service_Image,
      Requst_Service_ALL_Details,
      Interview_DateAndTime;

  @override
  _DetailsBodyState createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBodyProvider> {

  Future get_cancel_details() async {print(widget.Requst_Service_ID+"*****");
  Uri url = Uri.parse(Paths.Requst_Service + "get_cancel_details.php");
  var data = {
    "Requst_Service_ID": widget.Requst_Service_ID //widget.Service_Number
  };
  var response = await http.post(url, body: data);
  var responsebody = jsonDecode(response.body);
  print("********");
  setState(() {
    cancel_reason=responsebody[0]["cancel_reason"];
    cancel_date=responsebody[0]["cancel_date"];
    another_reason=responsebody[0]["another_reason"];

  });

  }
  String cancel_reason="";
  String cancel_date="";
  String another_reason="";
  double  height= 40;
  double width= 192;
  Color colorbutoon=Colors.white;
  String? datet = "";
  String? StateRequst;
  String? selectedadd;
  List<String> list = [];
  String? provider_name = "";
  String? provider_number = "";
  String? Sercice_Provider_Phone = "";
  var Provider_ID;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.getString("Sercice_Provider_Phone");

    setState(() {
      Provider_ID =preferences.getString("Sercice_Provider_ID") ;
      Sercice_Provider_Phone=preferences.getString("Sercice_Provider_Phone");
      provider_number=preferences.getString("Sercice_Provider_ID");
    });
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
        if (responsebody[i]["Accept"] == "نعم") {
          ApprovalAccept=responsebody[i]['Approval_details'];

        }

      }
      print(responsebody);
    });

    //return responsebody;
  }
  String ApprovalAccept="";
  @override
  TextEditingController searsh_name = new TextEditingController();
  TextEditingController _adddiscription = new TextEditingController();
  bool show = false;
  String choese_name = "";
  int choese_number = 0;

  void initState() {
    widget.Requst_State;
    super.initState();
    searsh_name;
    show;
    provider_name = "";
    provider_number = "";
    getPref();
    height= 40;
    width= 192;
    if(widget.Requst_State=="تم الإلغاء"){
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
       widget.Requst_State!="تم الطلب"?
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

                  ContainerTitle("إسم العميل", Colors.white),
                  SizedBox(
                    height: 3,
                  ),
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
            ContainerTitle("موقع العميل" + " : ", Colors.white),
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
            ContainerTitle("رقم العميل" + " : ", Colors.white),
            SizedBox(
              height: 3,
            ),
            InkWell(
              child:
                  // ContainerTitle(
                  //    "رقم العميل" + " : " + widget.Customer_Phone_Number,
                  //    Colors.white),
                  Center(
                child: ContainerNEW(
                  widget.Customer_Phone_Number,
                ),
              ),
              onTap: () {
                setState(() {
                  // _callNumber(widget.Customer_Phone_Number);
                });
              },
            ),
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
                  : ContainerNEWred(widget.Requst_State),
            ),
            SizedBox(
              height: 10,
            ),widget.Requst_State=="تم الإلغاء"?
            ContainerNEWred("السبب الرئيسي"+" "+cancel_reason+"  "+another_reason+" "+" وقت الإلغاء "+cancel_date)

                :Text(""),SizedBox(
              height: 10,
            ),
            ContainerTitle("تفاصيل ومكان المقابلة" + " : ", Colors.white),
            SizedBox(
              height: 3,
            ),

            Center(
              child: ContainerNEW(
                widget.Location_Interview,
              ),
            ),
            SizedBox(
              height: 3,
            ),

            ContainerTitle("وقت وتاريخ  المقابلة" + " : ", Colors.white),
            SizedBox(
              height: 3,
            ),

            Center(
              child: ContainerNEW(
                widget.Interview_DateAndTime,
              ),
            ),

            SizedBox(
              height: 10,
            ),
            ContainerTitle("قام العميل بطلب الخدمة بتاريخ" + " : ", Colors.white),
            SizedBox(
              height: 3,
            ),

            Center(
              child: ContainerNEW(
                widget.Requst_DataTime,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            widget.Requst_State=="في المقابلة"?
            ContainerNotifaction():
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            widget.Requst_State!="تم الإلغاء"?
            Center(
              child: ContainerText(),
            ):Text(""),

            SizedBox(
              height: 40,
            ),
          ],
        )
           :
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

           ApprovalAccept==""?Text(""):
           Column(
             children: [

               ContainerTitle("تفاصيل طلب خدمة العميل" + " : ", Colors.white),
               SizedBox(
                 height: 3,
               ),
               Center(
                 child: ContainerNEW(
                   ApprovalAccept,
                 ),
               ),
               // ContainerText(widget.Requst_Service_ALL_Details, Colors.white),
               SizedBox(
                 height: 5,
               ),
             ],
           ),





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
                 : ContainerNEWred(widget.Requst_State=="تم الطلب"?"تم الطلب وتحتاج عروض سعر":widget.Requst_State),
           ),

           SizedBox(
             height: 3,
           ),

           ContainerTitle("قام العميل بطلب الخدمة بتاريخ" + " : ", Colors.white),
           SizedBox(
             height: 3,
           ),

           Center(
             child: ContainerNEW(
               widget.Requst_DataTime,
             ),
           ),
           ApprovalAccept!=""? Center(
             child: Container(
                 margin: EdgeInsets.only(top: 20),
                 child: Column(
                   children: <Widget>[
                     Obx((){

                       return Container(height: 200,width: 300,
                           child: Liest_Offers_pdf_Provider(Offer_State:"لا",Requst_ID: widget.Requst_Service_ID,Provider_ID: Provider_ID,type_get_offer: "hopro",));
             }),
                     RaisedButton(
                       color: Colors.brown[700],
                       elevation: 10,
                       padding: EdgeInsets.symmetric(
                           vertical: 10, horizontal: 40),
                       onPressed:  (){
                         Get.to(Add_New_Offer(Service_Number: widget.Requst_Service_ID,ApprovalAccept:ApprovalAccept,Requst_ID: widget.Requst_Service_ID));
                       },
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         mainAxisSize: MainAxisSize.min,
                         children: <Widget>[
                           Text(
                             "إضافة عرض سعر",
                             style: TextStyle(
                                 color: Colors.white, fontSize: 18),
                           ),
                           Container(
                               margin: EdgeInsets.only(top: 4),
                               padding: EdgeInsets.only(right: 10),
                               child: Icon(
                                 Icons.add,
                                 color: Colors.white,
                               ))
                         ],
                       ),
                     ),

                   ],
                 )),
           ):Text(""),

           SizedBox(
             height: 10,
           ),
         ],
       )
      ],
    ));
  }


  ContainerNotifaction() {
    return Container(
       // margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, // 30 px padding
          vertical: kDefaultPadding / 3, // 5 px padding
        ),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [ Colors.pink,Colors.red],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: Colors.white.withOpacity(.3),
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
                    TextStyle(color: Colors.white, fontSize: 18),
                    children: [
                      TextSpan(
                        text: "عزيزي مقدم الخدمة إد كنت قد قمت بالأتفاق مع العميل او قمت بمقابلتة والاتفاق على خطة العمل يرجى الضغط على زر اضافة مراحل خدمة واضافة مراحل خدمة العميل لمباشرة العمل وشكراٌ. ",
                      ),
                    ]),
              )),
        ));
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
  ContainerNEWred(String text) {
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
  ContainerText() {
    return Container(
      height: height,
        width: width,
        //margin: EdgeInsets.only(right: 20),
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 1.5, // 30 px padding
          vertical: kDefaultPadding / 5, // 5 px padding
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.purpleAccent, Colors.deepPurple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: colorbutoon.withOpacity(.3),
                  spreadRadius: 5,
                  blurRadius: 2,
                  offset: Offset(0, 1))
            ]),
        // decoration: BoxDecoration(
        //   color: color,
        //   borderRadius: BorderRadius.circular(22),
        // ),
        child: InkWell(
            child: RichText(
          text: TextSpan(
              style: //Theme.of(context).textTheme.headline6,
                  TextStyle(color: backgroundColor, fontSize: 18),
              children: [
                TextSpan(text: "أضافه مرحلة خدمة"),
              ]),
        ),
          onTap: (){
              setState(() {
                colorbutoon=Colors.black;
                  height= 37;
                 width= 197;

                 Get.to(Add_Stages(Requst_Service_ID:widget.Requst_Service_ID,
                   Service_Provider_Name: widget.Service_Name,
                   Sercice_Provider_Phone: Sercice_Provider_Phone!,
                   Sercice_Provider_ID:provider_number!,
                   Cusotmer_Image:widget.Cusotmer_Image,
                   Customer_Name:widget.Customer_Name,
                   Areas_Name:widget.Areas_Name,
                   Requst_DataTime:widget.Requst_DataTime,

                   Service_Number:widget.Service_Number,
                   Service_Name:widget.Service_Name,
                   Service_Image:widget.Service_Image,
                   Requst_State:widget.Requst_State,
                   Requst_Service_ALL_Details:widget.Requst_Service_ALL_Details,
                   Customer_Phone_Number:widget.Customer_Phone_Number,
                   provider_name: provider_name!,



                 ));

              });
          }
        ));
  }

  ContainerTitle(String text, Color color) {
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

// class Card_Search_Provider extends StatefulWidget {
//   const Card_Search_Provider({
//     required this.Sercice_Provider_ID,
//     required this.Service_Provider_Name,
//     required this.Service_Provider_Image,
//     required this.Areas_Name,
//   });
//   final String Sercice_Provider_ID,
//       Service_Provider_Name,
//       Service_Provider_Image,
//       Areas_Name;
//
//   @override
//   _MEWState createState() => _MEWState();
// }
//
// class _MEWState extends State<Card_Search_Provider> {
//   void initState() {
//     super.initState();
//
//     provider_name;
//     provider_number;
//   }
//   @override
//
//   Widget build(BuildContext context) {
//     bool image = true;
//
//     Size size = MediaQuery.of(context).size;
//     return Directionality(
//         textDirection: TextDirection.rtl,
//         child: Container(
//           // margin: EdgeInsets.symmetric(
//           //   horizontal: kDefaultPadding,
//           //   vertical: kDefaultPadding / 2,
//           // ),
//           //height: 30.0,
//           child: InkWell(
//             onTap: () {
// setState(() {
//
//   provider_name = widget.Service_Provider_Name;
//   provider_number=widget.Areas_Name;
//
//
//
//
// });
//
//
//             },
//             child: Stack(
//               alignment: Alignment.topCenter,
//               children: [
//                 Positioned(
//                   top: 10.0,
//                   left: 70.0,
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
//                     height: 120.0,
//                     width: 120.0,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       // image: DecorationImage(
//                       //     image: NetworkImage(
//                       //         'https://fallingtaiz.000webhostapp.com/upload/usimage/$user_image'),
//                       //     fit: BoxFit.cover),
//                     ),
//                     child: Container(
//                       margin: EdgeInsets.all(5),
//                       // width: 45,
//                       // height: 45,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                             image: NetworkImage(
//                               image
//                                   ? Path.Provider_Images +
//                                       widget.Service_Provider_Image
//                                   : Path.Customer_Images + "Mohammed.jpg",
//                             ),
//                             fit: BoxFit.cover),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                     // padding: EdgeInsets.symmetric(
//                     //   // horizontal: kDefaultPadding * 1.5, // 30 px padding
//                     //   // vertical: kDefaultPadding / 5, // 5 px padding
//                     // ),
//                     decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                             colors: [activeColor, kBlueColor],
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight),
//                         borderRadius: BorderRadius.circular(30),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.black.withOpacity(.3),
//                               spreadRadius: 1,
//                               blurRadius: 2,
//                               offset: Offset(0, 1))
//                         ]),
//                     child: RichText(
//                       textAlign: TextAlign.center,
//                       text: TextSpan(
//                           style: //Theme.of(context).textTheme.headline6,
//                               TextStyle(color: backgroundColor, fontSize: 18),
//                           children: [
//                             TextSpan(
//                                 text: widget.Sercice_Provider_ID +"- "+
//                                     widget.Service_Provider_Name +" "+
//                                     widget.Areas_Name),
//                           ]),
//                     ))
//               ],
//             ),
//           ),
//         ));
//   } }
}
