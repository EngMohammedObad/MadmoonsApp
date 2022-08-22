import "dart:convert";
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:madmooon/paths.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:readmore/readmore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../colors.dart';
import '../home.dart';
class Add_New_Offer extends StatefulWidget {
  final String Service_Number;
  final String ApprovalAccept;
  final String Requst_ID;

  Add_New_Offer({required this.Service_Number,
    required this.ApprovalAccept,required this.Requst_ID,
  });

  @override
  _Add_New_Offer createState() => _Add_New_Offer();
}
class _Add_New_Offer extends State<Add_New_Offer> {
  var Provider_ID;
  getPref()async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
setState(() {
   Provider_ID =preferences.getString("Sercice_Provider_ID") ;
});



  }

  TextEditingController details = new TextEditingController();
  TextEditingController VAT = new TextEditingController();
  TextEditingController PRICE = new TextEditingController();
  List<String> list = [];
  add_new_offer() async {

    if(details.text.toString()=="")
    {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'يرجى إضافة تفاصيل عرض السعر',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'Cairo'),
          ),
          backgroundColor: googleColor,
        ),
      );
      return;
    }
    if(PRICE.text.toString()=="")
    {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'يرجى إضافة السعر الاجمالي لعرض السعر',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'Cairo'),
          ),
          backgroundColor: googleColor,
        ),
      );
      return;
    }
    if(VAT.text.toString()=="")
    {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'يرجى إضافة القيمة الضريبية',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'Cairo'),
          ),
          backgroundColor: googleColor,
        ),
      );
      return;
    }



      showLoading();

    Uri url =
    Uri.parse(Paths.provider_requst+"add_new_offer.php");
    print("1111111111111111111111111111111111111111111111111111");
    print(VAT);
    print(PRICE);
    print(widget.Requst_ID);
    print(Provider_ID.toString());
    print( details.toString());
    var data = {
      'Requst_ID':widget.Requst_ID,
      'Provider_ID':Provider_ID.toString(),
      'offer_details': details.text.toString(),
      "offer_price": PRICE.text.toString(),
      "Offer_State": "لا",
      "Offer_Date": DateTime.now().toString(),
      "VAT": VAT.text.toString(),
    };
    print("1111111111111111111111111111111111111111111111111111");
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    if (responsebody['status'] == "success") {
      print("yes success");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'تم الاضافة بنجاح',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'Cairo'),
          ),
          backgroundColor: kTextColor,
        ),
      );setState(() {
      });



    } else {
      print(responsebody['status']);

      if (responsebody['status'] == "there is error") {
        showDialogAll(context, "خطأ", " لم يتم الحفض قد تكون العملية بداْ بالفور ");

        print(base64);
      }
    }

    Get.back();
    Get.back();

  }

  @override
  void initState() {
    getPref();
    super.initState();

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
  showLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Center(child: Text('جاري التحميل')),
            content: JumpingDotsProgressIndicator(
              fontSize: 20.0,
            ),
            actions: <Widget>[
              Center(
                  child: Image.asset('images/Copper-Loader.gif',
                      width: 100, height: 100)),
            ],
          ),
        );
      },
    );
  }

  String reason="";
  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(height: double.infinity, width: double.infinity),
            buildPositionedtop(mdw),
            buildPositionedBottom(mdw),
            Container(
                height: MediaQuery.of(context).size.height/1.01,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[

                      Center(
                          child: Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Text(
                                "إضافة عرض سعر",

                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25),
                              ))),

                      SizedBox(
                        height: MediaQuery.of(context).size.height/19,
                      ),
                      buildFormUpdateCategory(mdw),
                      Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height:5),
                              RaisedButton(
                                color: Colors.brown[700],
                                elevation: 10,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 40),
                                onPressed:  (){
                                  add_new_offer();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      "إضافة",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 4),
                                        padding: EdgeInsets.only(right: 10),
                                        child: Icon(
                                          Icons.add_circle,
                                          color: Colors.white,
                                        )),

                                  ],
                                ),
                              ), SizedBox(height: 50,)

                            ],
                          )),
                    ],
                  ),
                )),
          ],
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
                    ContainerTitle("تفاصيل طلب خدمة العميل" + " : ", Colors.white),
                    SizedBox(
                      height: 3,
                    ),
                    Center(
                      child: ContainerNEW(
                        widget.ApprovalAccept,
                      ),
                    ),
                    // ContainerText(widget.Requst_Service_ALL_Details, Colors.white),
                    SizedBox(
                      height: 5,
                    ),
                    // Start Text Username
                    Text(
                      "يرجى كتابه تفاصيل عرض سعر الخدمة الذي سنقوم بمساعدتك وتحويله الى ملف pdf رسمي",
                      style: TextStyle(
                          color: Colors.brown[700], fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                       maxLength: 1684,
                        controller: details,
                        minLines: 2,
                        maxLines: 5,
                        // onChanged: (String e){
                        //   setState((){
                        //     numLines = '\n'.allMatches(e).length + 1;
                        //   });
                        // },
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            hintText: 'تفاصيل عرض السعر',
                            hintStyle: TextStyle(
                                color: Colors.grey,

                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),

                            ),focusColor:Colors.brown[700],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        maxLength: 10,
                        controller: PRICE,

                        maxLines: 1,
                        // onChanged: (String e){
                        //   setState((){
                        //     numLines = '\n'.allMatches(e).length + 1;
                        //   });
                        // },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'إجمالي عرض السعر',
                          hintStyle: TextStyle(
                            color: Colors.grey,

                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),

                          ),focusColor:Colors.brown[700],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        maxLength: 7,
                        controller: VAT,

                        maxLines: 1,
                        // onChanged: (String e){
                        //   setState((){
                        //     numLines = '\n'.allMatches(e).length + 1;
                        //   });
                        // },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'مبلغ الضريبة',
                          hintStyle: TextStyle(
                            color: Colors.grey,

                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),

                          ),focusColor:Colors.brown[700],
                        ),
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
                    borderRadius: BorderRadius.circular(mdw),
                  color: Colors.brown[700],)),
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

showLoading(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: <Widget>[
              Text("Loding ... "),
              CircularProgressIndicator()
            ],
          ),
        );
      });
}

showDialogAll(context, String mytitle, String mycontent) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(mytitle),
          content: Text(mycontent),
          actions: <Widget>[
            FlatButton(
              child: Text("done"),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      });
}