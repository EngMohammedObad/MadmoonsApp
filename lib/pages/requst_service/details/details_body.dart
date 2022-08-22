import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:madmooon/pages/requst_service/models/requst.dart';
import 'package:readmore/readmore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../colors.dart';
import '../../../paths.dart';
import 'package:http/http.dart' as http;

import '../../sharing.dart';
import '../requst_home.dart';

class DetailsBodyRequst extends StatefulWidget {
  const DetailsBodyRequst({
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
      Service_Name,
      Requst_State,
      Service_Image,
      Requst_Service_ALL_Details;

  @override
  _DetailsBodyState createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBodyRequst> {
  String? _dateTime = "";
  String? datet = "";
  String? StateRequst;
  String? selectedadd;
  List<String> ApprovalNotAccept = [];
  String? provider_name = "";
  String? provider_number = "";
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
  showLoadingg(String text) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Center(child: Text(text)),
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
  Future Add_Approval() async {
    showLoadingg("جاري ارسال التفاصيل");
    Uri url = Uri.parse(Paths.Requst_Service + "Add_Approval.php");
    var data = {
      "Approval_details": _sendDetailToCustomer.text.toString(),
      "Accept": "لا",
      "Requst_ID": widget.Requst_Service_ID,
      "Approval_Date": DateTime.now().toString(),
      "flag": "نعم",
      "NotAgree": 'لا',
    };
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    print(responsebody);
    setState(() {
      _sendDetailToCustomer.text="";
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'تم ارسال التفاصيل الى العميل بنجاح',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontFamily: 'Cairo'),
        ),
        backgroundColor: kPrimaryColor2,
      ),
    );
    Get.back();

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
          _adddiscription.text=ApprovalAccept;
        }
        else if(responsebody[i]["NotAgree"] == "نعم")
        {
          ApprovalNotAccept.add(responsebody[i]['Approval_details']);
        }
        else if(responsebody[i]["NotAgree"] == "لا"&& responsebody[i]["Accept"] == "لا")
          {
            noApproval=responsebody[i]['Approval_details'];
          }
      }
      print(responsebody);
    });

    //return responsebody;
  }

  String ApprovalAccept="";
  String noApproval="";

  @override
  TextEditingController searsh_name = new TextEditingController();
  TextEditingController _sendDetailToCustomer = new TextEditingController();

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

    if (widget.Requst_State == "تم الإلغاء") {
      setState(() {
        get_cancel_details();
        get_provider_information_by_requst();
      });
    }
    get_all_Approval();
  }

  bool sendtocustomer = true;
  String cancel_reason = "";
  String cancel_date = "";
  String another_reason = "";
  String PhonePro = "";
  String NamepPro = "";
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

  Future get_provider_information_by_requst() async {
    print("*******************9");
    Uri url = Uri.parse(
        Paths.Requst_Service + "get_provider_information_by_requst.php");
    var data = {
      "Requst_Number": widget.Requst_Service_ID //widget.Service_Number
    };
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    print("*******************8");
    setState(() {
      PhonePro = responsebody[0]["Sercice_Provider_Phone"];
      NamepPro = responsebody[0]["Service_Provider_Name"];
      print("*******************7");
    });
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
                  ContainerTitle("إسم العميل", Colors.white),
                  SizedBox(
                    height: 3,
                  ),
                  ContainerText(widget.Customer_Name, Colors.white),
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
                  ContainerTitle(
                      "إسم الخدمة" + " : " + widget.Service_Name, Colors.white),
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
            ContainerText(widget.Requst_Service_ALL_Details, Colors.white),
            SizedBox(
              height: 5,
            ),
            ContainerTitle(
                "موقع العميل" + " : " + widget.Areas_Name, Colors.white),
            SizedBox(
              height: 10,
            ),
            InkWell(
              child: ContainerNumberPhone(
                  "رقم العميل" + " : " + widget.Customer_Phone_Number),
              onTap: () {
                setState(() {
                  // _callNumber(widget.Customer_Phone_Number);
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            ContainerTitle(
                "حالة الخدمة" + " : " + widget.Requst_State, Colors.white),
            SizedBox(
              height: 10,
            ),
            widget.Requst_State == "تم الإلغاء"
                ? Column(
                    children: [
                      ProviderInformation(PhonePro == ""
                          ? "قام العميل بـ إلغاء الخدمه قبل التحويل الى مقدم الخدمة"
                          : "قام العميل بـ إلغاء الخدمة بعد أن تحولت الى مقدم الخدمةقد يكون بسبب تقصير مقدم الخدمة يرجى اخ الاأسباب من مقدم الخدمةوالعميل"),
                      SizedBox(
                        height: 3,
                      ),
                      ContainerNEW(" إفادة العمميل :" +
                          " " +
                          cancel_reason +
                          "  " +
                          another_reason +
                          " " +
                          " وقت الإلغاء " +
                          cancel_date),
                      SizedBox(
                        height: 10,
                      ),
                      ContainerTitle(
                          " رقم هاتف مقدم الخدمة" + " : ", Colors.white),
                      SizedBox(
                        height: 3,
                      ),
                      ContainerNumberPhone(PhonePro),
                    ],
                  )
                : Column(
                    children: [
                      ContainerContai(),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
          ],
        ),
        widget.Requst_State=="تم الطلب"&&noApproval!=""?

              Column(
                children:[
                  Center(child: Text("التفاصيل المعلقة")),
                  Container(
                  padding: EdgeInsets.all(8),
                  child: ReadMoreText(
                    noApproval ,
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
              ])
            :Text(""),
        Divider(),
        widget.Requst_State=="تم الطلب"&&ApprovalNotAccept.length!=0?
Column(
  children:[
    Text(" التفاصيل الغير مقبولة"),
    Container(
    height: 200,
    child:   ListView.builder(
      itemCount: ApprovalNotAccept.length,
        itemBuilder: (BuildContext context,int index)
    {
      return
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child: ReadMoreText(
                "${index+1}-  "+ ApprovalNotAccept[index] ,
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
            Divider(),
            SizedBox(height: 20,)
          ],
        ) ;

    }),
  ),
])   :Text(""),

        widget.Requst_State=="تم الطلب"&&ApprovalAccept!=""?
        Column(
            children:[
              Text(" التفاصيل المقبولة"),
              Container(
                height: 200,
                child:    Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      child: ReadMoreText(
                        ApprovalAccept,
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
                    Divider(),
                    SizedBox(height: 20,)
                  ],
                )
              ),
            ])   :Text(""),

      ],
    ));
  }

  // showLoadingg(String Title) {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return WillPopScope(
  //         onWillPop: () async => false,
  //         child: AlertDialog(
  //           backgroundColor: kBlueColor,
  //           title:Text(""),// ContainerTitle(Title, Colors.white),
  //           actions: <Widget>[
  //             Column(
  //               children: <Widget>[
  //                 ContainerTitle("أختر أحد المقدمين", Colors.white),
  //
  //                 ///  Start TextForm
  //
  //                 SizedBox(
  //                   height: 5,
  //                 ),
  //                 buildTextFormFieldAll("Searsh provider name", searsh_name),
  //                 SizedBox(
  //                   height: 1,
  //                 ),
  //                 show
  //                     ? Container(
  //                         height: 100,
  //                         child: FutureBuilder(
  //                             future: getSearch_Name_Provider(),
  //                             builder: (BuildContext context,
  //                                 AsyncSnapshot snapshot) {
  //                               if (snapshot.hasData) {
  //                                 dynamic snap = snapshot.data;
  //                                 return GridView.builder(
  //                                     gridDelegate:
  //                                         SliverGridDelegateWithFixedCrossAxisCount(
  //                                             crossAxisCount: 1,
  //                                             childAspectRatio: 3 / 2,
  //                                             crossAxisSpacing: 20,
  //                                             mainAxisSpacing: 20),
  //                                     itemCount: snap.length,
  //                                     itemBuilder:
  //                                         (BuildContext context, index) {
  //
  //                                       return Card_Search_Provider(
  //                                           Sercice_Provider_ID:
  //                                               snapshot.data[index]
  //                                                   ["Sercice_Provider_ID"],
  //                                           Service_Provider_Name:
  //                                               snapshot.data[index]
  //                                                   ["Service_Provider_Name"],
  //                                           Service_Provider_Image:
  //                                               snapshot.data[index]
  //                                                   ["Service_Provider_Image"],
  //                                           Areas_Name:
  //                                           snapshot.data[index]
  //                                           ["Areas_Name"]
  //
  //                                           //snapshot.data[index]["Areas_Name"],
  //
  //                                           );
  //                                     });
  //                               }
  //                               return Center(
  //                                 child: CircularProgressIndicator(),
  //                               );
  //                             }),
  //                       )
  //                     : Text(""),
  //
  //
  //                 /// /  End TextForm
  //                 InkWell(
  //                   child: Row(children: [
  //                     Text("Exit"),
  //                     Center(
  //                       child: Icon(Icons.exit_to_app),
  //                     )
  //                   ]),
  //                   onTap: () {
  //                     Get.back();
  //                   },
  //                 ),
  //               ],
  //             )
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  ContainerContai() {
    return Column(
      children: <Widget>[
        widget.Requst_State == "تم الطلب"
            ? Container(
                child:
                    // ApprovalAccept.length!=0?
                    InkWell(
                  child:
        sendtocustomer==false? ContainerNewFlag("إرسال تفاصيل للموافقة عليها من قبل العميل من هنا")
                     :ContainerNewFlag("التحويل الى مقدم الخدمة مباشرة من هنا") ,
                  onTap: () {
                    setState(() {
                      if (sendtocustomer == true) {
                        sendtocustomer = false;

                      } else
                        sendtocustomer = true;

                    });
                    if(sendtocustomer == true&&noApproval!="")
                      {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "لايمكنك إرسال تفاصيل للعميل حتى يقوم بالوافقة او عدم الموافقة للتفاصيل المرسلة سابقاٌ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 20,
                                  fontFamily: 'Cairo'),
                            ),
                            backgroundColor: kTextColor,
                                      ),
                        );
                      }
                  },
                )
                //  :Text("")
                ,
              )
            : Text(""),
        widget.Requst_State=="تم الطلب"&&sendtocustomer == true &&noApproval==""&&ApprovalAccept==""? AddDetailsToCustoemr() : Text(""),
        SizedBox(
          height: 5,
        ),
        sendtocustomer == false
            ? Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),

                  ///  Start TextForm

                  buildTextFormFieldAll("أدخل إسم مقدم الخدمة", searsh_name),

                  show
                      ? Container(
                          height: 200,
                          child: FutureBuilder(
                              future: getSearch_Name_Provider(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
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
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return Card_Search_Provider(
                                            snapshot.data[index]
                                                ["Sercice_Provider_ID"],
                                            snapshot.data[index]
                                                ["Service_Provider_Name"],
                                            snapshot.data[index]
                                                ["Service_Provider_Image"],
                                            snapshot.data[index]["Areas_Name"]

                                            //snapshot.data[index]["Areas_Name"],

                                            );
                                      });
                                }
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }),
                        )
                      : Text(""),
                  SizedBox(
                    height: 5,
                  ),
                  provider_number != ""
                      ? Center(
                          child: ContainerText(
                              provider_number! + " " + provider_name!,
                              Colors.white),
                        )
                      : SizedBox(
                          height: 7,
                        ),
                  SizedBox(
                    height: 7,
                  ),
                  Center(
                    child: ContainerNEW("أختر وقت وتاريخ المقابلة"),
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.timelapse_outlined,
                          size: 50,
                          color: Colors.white,
                        ),
                        DateTimeField(
                          cursorColor: Colors.white70,
                          format: format,
                          onShowPicker: (context, currentValue) async {
                            final date = await showDatePicker(
                                context: context,
                                firstDate: DateTime.now(),
                                initialDate: currentValue ?? DateTime.now(),
                                lastDate: DateTime(2100));
                            if (date != null) {
                              final time = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.fromDateTime(
                                    currentValue ?? DateTime.now()),
                              );
                              _dateTime =
                                  DateTimeField.combine(date, time).toString();
                              setState(() {
                                datet = _dateTime.toString();
                                datet = datet!.split(".").first;
// _dateTime=datet;
                                print(datet);
                              });

                              // DateTimeField.combine(date, time);

                              // print(date);
                            } else {
                              // return currentValue;
                            }
                          },
                        ),
                      ],
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
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  datet == ""
                      ? Text("")
                      : ContainerText(datet.toString(), Colors.white),
                  TextFormField(
                      // onFieldSubmitted:  (value)=>addComment(),
                      keyboardType: TextInputType.multiline,
                      controller: _adddiscription,
                      maxLines: 3,
                      minLines: 1,
                      style: const TextStyle(
                          fontSize: 20.0, color: Colors.black87),
                      decoration: InputDecoration(
                        hintText: 'تفاصيل ومكان اللقاء',
                        filled: true,
                        fillColor: backgroundColor,
                        contentPadding: const EdgeInsets.only(
                            left: 16.0, bottom: 8.0, top: 8.0, right: 16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      )),
                  Center(
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
                                padding: EdgeInsets.only(right: 15, left: 15),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [kBlueColor, activeColor],
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
                                child: Text(
                                  "التحويل الى مقدم خدمة",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 22, color: kBackgroundColor),
                                ),
                              ),
                            )),
                      ),
                      onTap: () {
                        setState(() {
                          if (widget.Requst_State == "تم الطلب") {
                            if (provider_name == "") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'يرجى البحث و ختيار مقدم خدمة متخصص',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'Cairo'),
                                  ),
                                  backgroundColor: kTextColor,
                                ),
                              );
                              return;
                            }
                            if (_dateTime == "") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'يرجى تحديد وقت وتاريخ المقابلة',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'Cairo'),
                                  ),
                                  backgroundColor: kTextColor,
                                ),
                              );
                              return;
                            }
                            if (_adddiscription.text == "") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'يرجى إدخال تفاصيل ومكان المقابلة',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'Cairo'),
                                  ),
                                  backgroundColor: kTextColor,
                                ),
                              );
                              return;
                            } else {
                              add_interview(
                                  widget.Requst_Service_ID,
                                  _adddiscription.text,
                                  _dateTime.toString(),
                                  provider_number.toString());
                              update_requst_state(widget.Requst_Service_ID);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'تم التحويل بنجاح',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 20,
                                        fontFamily: 'Cairo'),
                                  ),
                                  backgroundColor: kTextColor,
                                ),
                              );
                              Get.offAll(Requst_Home());
                            }
                          } else if (widget.Requst_State != "تم الطلب") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'هاد الطلب قيد المعالجده او التنفيد',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: kBackgroundColor,
                                      fontSize: 20,
                                      fontFamily: 'Cairo'),
                                ),
                                backgroundColor: kTextColor,
                              ),
                            );
                            return;
                          }
                        });
                      },
                    ),
                  ),
                ],
              )
            : Text("")
      ],
    );
  }

  TextFormField buildTextFormFieldAll(
      String myhinttext, TextEditingController myController) {
    return TextFormField(
      onChanged: (myController) {
        setState(() {
          show = true;
          // Get.back();
        });
      },
      controller: myController,
      keyboardType: TextInputType.text,
      //textDirection: TextDirection.rtl,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(4),
          hintText: myhinttext,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white, style: BorderStyle.solid, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blue, style: BorderStyle.solid, width: 1))),
    );
  }

  ContainerNEW(String text) {
    return Container(
        // padding: EdgeInsets.symmetric(
        //   horizontal: kDefaultPadding * 1.5, // 30 px padding
        //   vertical: kDefaultPadding / 5, // 5 px padding
        // ),
        padding: EdgeInsets.only(right: 10, left: 10),
        margin: EdgeInsets.only(right: 5, left: 5),
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
              child: RichText(
            text: TextSpan(
                style: //Theme.of(context).textTheme.headline6,
                    TextStyle(color: Colors.white, fontSize: 18),
                children: [
                  TextSpan(
                    text: text,
                  ),
                ]),
          )),
        ));
  }
  ContainerNewFlag(String text) {
    return Container(
      // padding: EdgeInsets.symmetric(
      //   horizontal: kDefaultPadding * 1.5, // 30 px padding
      //   vertical: kDefaultPadding / 5, // 5 px padding
      // ),
        padding: EdgeInsets.only(right: 10, left: 10),
        margin: EdgeInsets.only(right: 5, left: 5),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.blueGrey],
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
                    TextStyle(color: Colors.white, fontSize: 18),
                    children: [
                      TextSpan(
                        text: text,
                      ),
                    ]),
              )),
        ));
  }
  Center AddDetailsToCustoemr() {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInOutBack,
        margin: EdgeInsets.only(top: 20),
        //height: 700,

        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.white10,
              spreadRadius: .1,
              blurRadius: 1,
              offset: Offset(1, 1))
        ]),
        child: Container(
            child: Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Start Text Username
                Text(
                  "يرجى كتابة تفاصيل الخدمة بالتفصيل الممل",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 3,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    cursorColor: Colors.white,
                    controller: _sendDetailToCustomer,
                    minLines: 2,
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        hintText: 'أكتب هنا التفاصيل',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        )),
                  ),
                ),
                Center(
                  child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 5),
                          RaisedButton(
                            color: kPrimaryColor2,
                            elevation: 10,
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 40),
                            onPressed: () {
                              Add_Approval();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  "إرسال",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                Container(
                                    margin: EdgeInsets.only(top: 4),
                                    padding: EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.send,
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                          ),
                        ],
                      )),
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

  ContainerText(String text, Color color) {
    return Container(
        margin: EdgeInsets.only(right: 20),
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 1.5, // 30 px padding
          vertical: kDefaultPadding / 5, // 5 px padding
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [kBlueColor, activeColor],
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
            child: RichText(
          text: TextSpan(
              style: //Theme.of(context).textTheme.headline6,
                  TextStyle(color: backgroundColor, fontSize: 18),
              children: [
                TextSpan(text: text),
              ]),
        )));
  }

  ProviderInformation(String text) {
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
            child: RichText(
          text: TextSpan(
              style: //Theme.of(context).textTheme.headline6,
                  TextStyle(color: color, fontSize: 18),
              children: [
                TextSpan(text: text),
              ]),
        )));
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
