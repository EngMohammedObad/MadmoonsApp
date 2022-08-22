
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madmooon/pages/Offer/model/customer.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../colors.dart';
import '../paths.dart';
import 'Customer/Customer_home_body.dart';
import 'Offer/api/pdf_api.dart';
import 'Offer/api/pdf_invoice_api.dart';
import 'Offer/model/invoice.dart';
import 'Offer/model/supplier.dart';
import 'package:intl/intl.dart';
update_requst_lastupdate(String Requst_Number,String last_update ) async {


  Uri url =Uri.parse(Paths.Requst_Service+"update_requst_lastupdate.php");
  var data = {
    "Requst_Number":Requst_Number,
    "last_update":last_update
  };
  print(Requst_Number);
  var response = await http.post(url, body: data);
  var responsebody = jsonDecode(response.body);

  if (responsebody['status'] == "success") {
    print("yes success");

  } else {
    print(responsebody['status']);

  }

}
calling(String phone)async{
  String url = "tel:+966"+phone;
  if( await canLaunch(url)){
    await launch(url);
  }else{
    throw 'Could not launch $url';
  }
}
whatsappp(String phone)async{

  String url ="whatsapp://send?phone=+966"+phone;
  if( await canLaunch(url)){
    await launch(url);
  }else{
    throw 'Could not launch $url';
  }
}
ContainerNumberPhone(String text) {
  return Container(
      margin: EdgeInsets.only(right: 15),
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding, // 30 px padding
        vertical: kDefaultPadding / 3, // 5 px padding
      ),
      //width: MediaQuery.of(context).size.width,
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
      child: Column(
          children:[InkWell(
              child: RichText(
                text: TextSpan(
                    style: //Theme.of(context).textTheme.headline6,
                    TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: text,
                      ),
                    ]),
              )),
            Row(crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                InkWell(onTap: () {calling(text);},child: Icon(Icons.call,size: 50,color: Colors.white)),
                SizedBox(width: 20,),
                InkWell(onTap: () {sms(text);}, child: Icon(Icons.sms,size: 50,color: Colors.white)),
                SizedBox(width: 20,),
                InkWell(onTap: () {whatsappp(text);}, child: Icon(Icons.whatsapp,size: 50,color: Colors.white,)),
              ],
            ),]
      ));
}
sms(String phone)async{
  String url = 'sms:+966'+phone;

  if( await canLaunch(url)){
    await launch(url);
  }else{
    throw 'Could not launch $url';
  }
}
class Liest_Offers_pdf_Customer extends StatefulWidget {
  const Liest_Offers_pdf_Customer({
    required this.Offer_State,
    required this.Requst_ID,
    required this.Provider_ID,
    required this.type_get_offer,
     required this.parent_state,

});
  final String Offer_State;
  final String Requst_ID;
  final String Provider_ID;
  final String type_get_offer;
  final String parent_state;
  @override
  State<Liest_Offers_pdf_Customer> createState() => _Liest_Offers_pdf_Customer();
}

class _Liest_Offers_pdf_Customer extends State<Liest_Offers_pdf_Customer> {
@override
void initState(){
  super.initState();
}
bool overfound=false;
int ofercount=0;
int count=0;
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
  Future get_all_offers(String Offer_State,String Requst_ID,String Provider_ID) async {

    if(widget.type_get_offer== "hopro")
      {
        print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    Uri url =Uri.parse(Paths.Requst_Service+"get_all_offers_by_provider.php");
    var data = {
      "Offer_State":Offer_State,
    "Requst_ID":Requst_ID,
    "Provider_ID":Provider_ID,
    };
    var response = await http.post(url , body: data ) ;
    var responsebody = jsonDecode(response.body) ;
        setState(() {
          ofercount=responsebody.length;
          if(responsebody.length!=0){
            overfound=true;
          }
        });
    return responsebody ;
  }
    else
      {
        Uri url =Uri.parse(Paths.Requst_Service+"get_all_offers.php");
        var data = {
          "Offer_State":Offer_State,
          "Requst_ID":Requst_ID,

        };
        print("yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy1");
        var response = await http.post(url , body: data ) ;
        var responsebody = jsonDecode(response.body) ;
      print("yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy");
        print(responsebody[0]["responsebody"]);
      print(responsebody[0]["offer_details"]);
      print(Requst_ID);
      print("yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy");
        return responsebody ;
      }
  }
Future accept_offer(String Offer_ID,String Provider_ID,String Requst_ID) async {
  showLoading("جاري قبول عرض السعر");
  Uri url =Uri.parse(Paths.Requst_Service+"accept_offer.php");
  var data = {
    "Offer_ID":Offer_ID,
    "Provider_ID":Provider_ID,
  "Requst_ID":Requst_ID,
    "Interview_DateAndTime":DateTime.now().toString(),
  };
    var response = await http.post(url , body: data ) ;
    var responsebody = jsonDecode(response.body) ;
  update_requst_lastupdate(Requst_ID,"تم قبول عرض السعر");
Get.back();

}
  @override
  Widget build(BuildContext context) {
    getxCustomerHomeBody crt = Get.put(getxCustomerHomeBody());
    return

       Container(
         child: Container(
          margin: EdgeInsets.only(top: 5,bottom: 5),
            decoration: BoxDecoration(
              // border: Border.all(
              //   width: 1.0,
              //   color: kTextColor,
              // ),
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(5),
            ),
          height: 20,

          child: Center(
            child: FutureBuilder(
                future: get_all_offers(
                    widget.Offer_State,
                    widget.Requst_ID,
                    widget.Provider_ID
                ),
                builder:
                    (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    dynamic snap = snapshot.data;
                    return ListView.builder(
                        scrollDirection: Axis.vertical,

                        shrinkWrap: true,
                        itemCount: snap.length,
                        itemBuilder: (BuildContext context, index) {

                          count=index;
count++;
                          return Container(
                            child: Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "images/mashroaak_image/pdf.png",
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.contain,
                                      ),

                                      Container(
                                        child:widget.Offer_State=="لا"? Text("عرض سعر رقم "+"( "+count.toString()+" )",style: TextStyle(color: kPrimaryColor2,fontSize: 12)

                                          ,textAlign: TextAlign.center,
                                        ):Text("عرض السعر المقبول",style: TextStyle(color: kPrimaryColor2,fontSize: 12)

                                        ,textAlign: TextAlign.center,
                                      )
                                      ),
                                    ],
                                  ),
                                  Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RaisedButton(
                                        color: kPrimaryColor2,
                                        elevation: 10,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 40),
                                        onPressed:  () async
                                        {
                                          final invoice = Invoice(

                                            supplier: Supplier(
                                              name: 'مضمون لريادة الأعمال',
                                              address: 'Bataha Street 9, Suadia, Reathd',
                                              paymentInfo: 'https://paypal.me/sarahfieldzz',
                                              date:snapshot.data[index]["Offer_Date"],
                                              body: snapshot.data[index]["offer_details"],
                                              offernumber: snapshot.data[index]["Offer_ID"],
                                              Vat: snapshot.data[index]["Vat"],
                                              offer_price:  snapshot.data[index]["offer_price"]
                                            ),


                                          );

                                          final pdfFile = await PdfInvoiceApi.generate(invoice);

                                          PdfApi.openFile(pdfFile);
                                        },
                                        child:  Text(
                                          "فتح العرض",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 14),
                                        ),

                                      ),
                                      SizedBox(width: 10,),
                                      widget.Offer_State=="لا"?
                                      Obx((){
                                        return TextButton(
                                            child: Text(
                                                "أختيار العرض".toUpperCase()+crt.nulles.toString(),
                                                style: TextStyle(fontSize: 14)
                                            ),
                                            style: ButtonStyle(
                                                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(top: 5,bottom: 5,
                                                    left: 30,right: 30)),
                                                foregroundColor: MaterialStateProperty.all<Color>(kPrimaryColor2),
                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(5.0),
                                                        side: BorderSide(color: Colors.grey)
                                                    )
                                                )
                                            ),
                                            onPressed: () {

                                              accept_offer(snapshot.data[index]["Offer_ID"],
                                                  snapshot.data[index]["Provider_ID"],
                                                  snapshot.data[index]["Requst_ID"]);
                                              print(crt.state);
                                              crt.state!.value = "123";
                                              crt.state!.value =
                                                  widget.parent_state;
                                              print("*"+widget.parent_state);


                                            }
                                        );
                                      }):SizedBox(height: 0,),
                                    ],
                                  ),
                                  Divider(),
                                ],
                              ),

                            ),

                          );
                        });
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          )
      ),
       );
      /// ................................................................................. ///


  }
}



class Liest_Offers_pdf_Provider extends StatefulWidget {
  const Liest_Offers_pdf_Provider({
    required this.Offer_State,
    required this.Requst_ID,
    required this.Provider_ID,
    required this.type_get_offer,
    // required this.parent_state,

  });
  final String Offer_State;
  final String Requst_ID;
  final String Provider_ID;
  final String type_get_offer;
  // final String parent_state;
  @override
  State<Liest_Offers_pdf_Provider> createState() => _Liest_Offers_pdf_Provider();
}

class _Liest_Offers_pdf_Provider extends State<Liest_Offers_pdf_Provider> {
  @override
  void initState(){
    super.initState();
  }
  bool overfound=false;
  int ofercount=0;
  int count=0;
  Future get_all_offers(String Offer_State,String Requst_ID,String Provider_ID) async {

    if(widget.type_get_offer== "hopro")
    {
      print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      Uri url =Uri.parse(Paths.Requst_Service+"get_all_offers_by_provider.php");
      var data = {
        "Offer_State":Offer_State,
        "Requst_ID":Requst_ID,
        "Provider_ID":Provider_ID,
      };
      var response = await http.post(url , body: data ) ;
      var responsebody = jsonDecode(response.body) ;
      setState(() {
        ofercount=responsebody.length;
        if(responsebody.length!=0){
          overfound=true;
        }
      });
      return responsebody ;
    }
    else
    {
      Uri url =Uri.parse(Paths.Requst_Service+"get_all_offers.php");
      var data = {
        "Offer_State":Offer_State,
        "Requst_ID":Requst_ID,

      };
      print("yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy1");
      var response = await http.post(url , body: data ) ;
      var responsebody = jsonDecode(response.body) ;
      print("yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy");
      print(responsebody[0]["responsebody"]);
      print(responsebody[0]["offer_details"]);
      print(Requst_ID);
      print("yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy");
      return responsebody ;
    }
  }
  Future accept_offer(String Offer_ID,String Provider_ID,String Requst_ID) async {
    Uri url =Uri.parse(Paths.Requst_Service+"accept_offer.php");
    var data = {
      "Offer_ID":Offer_ID,
      "Provider_ID":Provider_ID,
      "Requst_ID":Requst_ID,
      "Interview_DateAndTime":DateTime.now().toString(),
    };
    var response = await http.post(url , body: data ) ;
    var responsebody = jsonDecode(response.body) ;


  }
  @override
  Widget build(BuildContext context) {
    getxCustomerHomeBody crt = Get.put(getxCustomerHomeBody());
    return

      Container(
        child: Container(
            margin: EdgeInsets.only(top: 5,bottom: 5),
            decoration: BoxDecoration(
              // border: Border.all(
              //   width: 1.0,
              //   color: kTextColor,
              // ),
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(5),
            ),
            height: 20,

            child: Center(
              child: FutureBuilder(
                  future: get_all_offers(
                      widget.Offer_State,
                      widget.Requst_ID,
                      widget.Provider_ID
                  ),
                  builder:
                      (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      dynamic snap = snapshot.data;
                      return ListView.builder(
                          scrollDirection: Axis.vertical,

                          shrinkWrap: true,
                          itemCount: snap.length,
                          itemBuilder: (BuildContext context, index) {

                            count=index;
                            count++;
                            return Container(
                              child: Container(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          "images/mashroaak_image/pdf.png",
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.contain,
                                        ),

                                        Container(
                                            child:widget.Offer_State=="لا"? Text("عرض سعر رقم "+"( "+count.toString()+" )",style: TextStyle(color: kPrimaryColor2,fontSize: 12)

                                              ,textAlign: TextAlign.center,
                                            ):Text("عرض السعر المقبول",style: TextStyle(color: kPrimaryColor2,fontSize: 12)

                                              ,textAlign: TextAlign.center,
                                            )
                                        ),
                                      ],
                                    ),
                                    Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        RaisedButton(
                                          color: kPrimaryColor2,
                                          elevation: 10,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 40),
                                          onPressed:  () async
                                          {
                                            final invoice = Invoice(

                                              supplier: Supplier(
                                                  name: 'مضمون لريادة الأعمال',
                                                  address: 'Bataha Street 9, Suadia, Reathd',
                                                  paymentInfo: 'https://paypal.me/sarahfieldzz',
                                                  date:snapshot.data[index]["Offer_Date"],
                                                  body: snapshot.data[index]["offer_details"],
                                                  offernumber: snapshot.data[index]["Offer_ID"],
                                                  Vat: snapshot.data[index]["Vat"],
                                                  offer_price:  snapshot.data[index]["offer_price"]
                                              ),


                                            );

                                            final pdfFile = await PdfInvoiceApi.generate(invoice);

                                            PdfApi.openFile(pdfFile);
                                          },
                                          child:  Text(
                                            "فتح العرض",
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 14),
                                          ),

                                        ),
                                        SizedBox(width: 10,),
                                        widget.Offer_State=="لا"?
                                        Obx((){
                                          return TextButton(
                                              child: Text(
                                                  "أختيار العرض".toUpperCase(),
                                                  style: TextStyle(fontSize: 14)
                                              ),
                                              style: ButtonStyle(
                                                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(top: 5,bottom: 5,
                                                      left: 30,right: 30)),
                                                  foregroundColor: MaterialStateProperty.all<Color>(kPrimaryColor2),
                                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(5.0),
                                                          side: BorderSide(color: Colors.grey)
                                                      )
                                                  )
                                              ),
                                              onPressed: () {
                                                accept_offer(snapshot.data[index]["Offer_ID"],
                                                    snapshot.data[index]["Provider_ID"],
                                                    snapshot.data[index]["Requst_ID"]);

                                                // print(crt.state);
                                                // crt.state!.value = "123";
                                                // crt.state!.value =
                                                //     widget.parent_state;
                                                // print("*"+widget.parent_state);
                                              }
                                          );
                                        }):SizedBox(height: 0,),
                                      ],
                                    ),
                                    Divider(),
                                  ],
                                ),

                              ),

                            );
                          });
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            )
        ),
      );
    /// ................................................................................. ///


  }
}