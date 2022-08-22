import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../colors.dart';
import '../../../paths.dart';
import 'package:http/http.dart' as http;
import 'package:readmore/readmore.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../Customer/details/details_body.dart';
import '../Customer/detalis_Customer_Home.dart';

class Add_Stages extends StatefulWidget {
  const Add_Stages({Key? key, required this.Requst_Service_ID,
  required this. provider_name,
    required this. Sercice_Provider_Phone,
    required this.Sercice_Provider_ID,
    required this.Cusotmer_Image,
    required this.Customer_Name,
    required this.Areas_Name,
    required this.Requst_DataTime,
    required this.Service_Number,
    required this.Service_Name,
    required this.Service_Image,
    required this.Requst_State,
    required this.Requst_Service_ALL_Details,
    required this.Customer_Phone_Number,

    required this.Service_Provider_Name
  })
      : super(key: key);
  final String Customer_Phone_Number;
  final String Requst_Service_ID;
  final String provider_name;
  final String Sercice_Provider_Phone;
  final String Sercice_Provider_ID;
  final String Cusotmer_Image;
  final String Customer_Name;
  final String Areas_Name;
  final String Requst_DataTime;
  final String Service_Number;
  final String Service_Name;
  final String Service_Image;
  final String Requst_State;
  final String Requst_Service_ALL_Details;
  final String Service_Provider_Name;

  @override
  _Add_StagesState createState() => _Add_StagesState();
}

class _Add_StagesState extends State<Add_Stages> {

  /// ////////////////
  String idstatedroblst="";
  Future pickercamera() async {

    final myfil = await ImagePicker()
        .getMultiImage(imageQuality:5 );
    //source: ImageSource.gallery);
    setState(() {

      upoadimage=myfil;
      file = File(upoadimage![0].path);

    });
  }
  var upoadimage;


  /// /////////////////

  String? pdfName;
  /// pick files
  File? uploadfile;
  int Randomm(){

    int x=
      Random().nextInt(10000);
    return x ;
  }

  void selectFile() async {

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: [
        //'jpg',
        'pdf'
      ],
    );
    if (result != null) {
      PlatformFile f = result.files.first;


    }


    setState(() {
      uploadfile = File(result!.files.single.path.toString());
      pdfName = uploadfile!.path.split("/").last;

      print("************************************************");
      print(uploadfile);

      print("************************************************");

    });
  }
  add_media() async {

    if(sel_for_edit=="")
    {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'يرجى أختتيار رقم المرحلة',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'Cairo'),
          ),
          backgroundColor: googleColor,
        ),
      );
      return;
    }

    if (file == null && uploadfile==null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'يرجى أختيار وسائط المرحلة',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'Cairo'),
          ),
          backgroundColor: googleColor,
        ),
      );
      return;
    }
    if (file!=null)
    {showLoading();
    for(int i=0;i<upoadimage.length;i++)
    {
      file = File(upoadimage![i].path);
      Uri url =
      Uri.parse("https://fallingtaiz.000webhostapp.com/add_stages_media.php");
      String base64 = base64Encode(file!.readAsBytesSync());
      String m_img = file!.path.split("/").last;

      var data = {
        'Stages_ID':idstatedroblst,
        'Media_Type':"image",
        'm_img': m_img,
        "image64": base64
      };
      print("1111111111111111111111111111111111111111111111111111");
      print(idstatedroblst);
      print("222222222222222222222222222222222222222222222222222");
      print(m_img);
      print("33333333333333333333333333333333333333333333333333333");
      print(base64);
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
          file=null;
        });



      } else {
        print(responsebody['status']);

        if (responsebody['status'] == "there is error") {
          showDialogAll(context, "خطأ", " لم يتم الحفض  ");
          print("azsxdcfvgbhnjmk,l,kmjnhbgvyfcx");
          print(base64);
        }
      }

    }

    }
    Get.back();
    if (uploadfile!=null)
    {showLoading();
    Uri url =
    Uri.parse("https://fallingtaiz.000webhostapp.com/add_stages_media.php");
    String base64 = base64Encode(uploadfile!.readAsBytesSync());
    String m_img = uploadfile!.path.split("/").last;
    int x=Randomm();

    var data = {
      'Stages_ID':idstatedroblst,
      'Media_Type':"file",
      'm_img':x.toString()+ m_img,
      "image64": base64
    };

    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    if (responsebody['status'] == "success") {



    } else {
      print(responsebody['status']);

      if (responsebody['status'] == "there is error") {
        showDialogAll(context, "خطأ", " لم يتم الحفض  ");
        print("azsxdcfvgbhnjmk,l,kmjnhbgvyfcx");
        print(base64);
      }
    }


    Get.back();
    }

  }
  @override
  void initState() {
    _change_add = new TapGestureRecognizer()
      ..onTap = () {
        fetch();
        sel_for_edit;
        file = null;
        setState(() {
          showadd = !showadd;
          print(showadd);
        });
      };
    super.initState();
    fetch();
  }

  ///
  /// //////////////////
  /// //////// list for add drob downlist ///////////
  List<String> list = [];
  @override
  Future fetch() async {
    Uri url = Uri.parse(Paths.Stages_Server + "get_all_stages_number.php");
    //showLoading();
    var data = {
      "Requst_Service_ID": widget.Requst_Service_ID.toString(),
    };

    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    for (int i = 0; i < responsebody.length; i++) {
      list.add(responsebody[i]['Service_Stages_ID']);
    }
  }
  String State="";


  Future get_details_stages(String Service_Stages_ID) async {
    Uri url = Uri.parse(Paths.Stages_Server + "get_details_stages.php");
    showLoading();
    var data = {
      "Service_Stages_ID": Service_Stages_ID,
    };

    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);

    setState(() {
      sel_for_edit = responsebody[0]['Stages_Details'];
      State=responsebody[0]['Requst_Service_State'];
    });
    Get.back();
  }

  /// ////////////////////

  var sel_for_edit = "";
  DateTime? _dateTimes;
  String? datets;
  DateTime? _dateTimef;
  String? datetf;
  add_stages() async {
    String strstate = "ساكن";
    Uri url = Uri.parse(Paths.Stages_Server + "add_new_stages.php");
    showLoading();
    var data = {
      "Requst_Service_ID": widget.Requst_Service_ID.toString(),
      "Requst_Service_State": strstate,
      "Date_Start": datets.toString(),
      "Date_Finsh": datetf.toString(),
      "Stages_Cost": stag_ecost.text.toString(),
      "Stages_Details": stag_detalis.text.toString()
    };

    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);

    if (responsebody['status'] == "success add") {
      print("success add");

      setState(() {
        stag_ecost.text = "";
        stag_detalis.text = "";
        datets = "";
        datetf = "";
      });
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
      );
      Get.back();

    } else {}
  }
  StartOrFineshStagesAndRequsst(String Requst_Service_State,String Service_Stages_ID) async {

    Uri url = Uri.parse(Paths.Stages_Server + "StartOrFineshStagesAndRequsst.php");
    showLoading();
    var data = {
      "Requst_Service_State":Requst_Service_State,
      "Service_Stages_ID": Service_Stages_ID,
      "Requst_Service_ID":widget.Requst_Service_ID

    };
    print("**********************");
    print(widget.Requst_Service_ID);

    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);

    if (responsebody['status'] == "success") {


      if(Requst_Service_State=="قيد التنفيذ")
      { ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'تم  بدء مرحلة الخدمة المحددة',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'Cairo'),
          ),
          backgroundColor: kTextColor,
        ),
      );}
      else
      { ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'تم انهاء العملية المحددة',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'Cairo'),
          ),
          backgroundColor: kTextColor,
        ),
      );}

      setState(() {
        State="";
      });
      Get.back();

    } else {}
  }
  @override
  bool simg = false;

  // Start Upload Image
  File? file;

  TextEditingController stag_ecost = new TextEditingController();
  TextEditingController stag_detalis = new TextEditingController();
  GlobalKey<FormState> formstate_add_cat = new GlobalKey<FormState>();
  GlobalKey<FormState> formstate_update_cat = new GlobalKey<FormState>();
  TapGestureRecognizer? _change_add;
  bool showadd = true;

  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: kBlueColor,
        body: Stack(
          children: <Widget>[
            //  buildPositioneImagebackground(mdw),
            Container(height: double.infinity, width: double.infinity),
            buildPositionedtop(mdw),
            buildPositionedBottom(mdw),
            Container(
                height: 1000,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: Container(
                              margin: EdgeInsets.only(top: 30),
                              child: Text(
                                showadd
                                    ? "أضافة مرحلة جديدة "
                                    : "إدارة المراحل",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: showadd ? 22 : 25),
                              ))),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                      ),
                      buildContaineraAvatar(mdw),
                      showadd
                          ? buildFormAddCategory(mdw)
                          : buildFormUpdateCategory(mdw),
                      Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: showadd ? 1 : 5),
                              RaisedButton(
                                color: showadd ? Colors.blue : Colors.white70,
                                elevation: 10,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 40),
                                onPressed: ()
                                {
                                  setState(() {
                                    if (showadd == true) {
                                      if (datets == null ||
                                          datets == "" ||
                                          datetf == null ||
                                          datetf == "") {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'يرجى أدخال تاريخ بداية ونهاية المرحله بطريقه صحيحة',
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
                                      ////////////
                                      if (stag_ecost.text == "") {
                                        {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'يرجى أدخال سعر الخدمة',
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
                                      }
////
                                      if (stag_detalis.text == "") {
                                        {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'يرجى أدخال اسم وتفاصيل المرحلة',
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
                                      } else {
                                        add_stages();
                                      }
                                    }
                                    else add_media();
                                  });
                                } // showadd ? add : update,
                                ,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      showadd
                                          ? "أضافة مرحلة"
                                          : "أضافة وسائط المرحلة",
                                      style: TextStyle(
                                          color: showadd
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 18),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 4),
                                        padding: EdgeInsets.only(right: 10),
                                        child: Icon(
                                          Icons.add_circle,
                                          color: showadd
                                              ? Colors.white70
                                              : Colors.black,
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontFamily: 'Cairo'),
                                        children: <TextSpan>[
                                          TextSpan(
                                              recognizer: _change_add,
                                              text: showadd
                                                  ? " إدارة المراحل  من هنا  "
                                                  : " أضافه مرحلة جديدة من هنا  ",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700)),
                                        ]),
                                  )),
                            ],
                          )),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Center buildFormAddCategory(double mdw) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        curve: Curves.easeOutBack,
        margin: EdgeInsets.only(top: 40),
        // height: 250,
        width: mdw / 1.2,
        decoration: BoxDecoration(color: Colors.blueGrey, boxShadow: [
          BoxShadow(
              color: Colors.black38,
              spreadRadius: .1,
              blurRadius: 1,
              offset: Offset(1, 1))
        ]),
        child: Form(
          //   autovalidate: true,
            key: formstate_add_cat,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Start Text Username

                    Text(
                      " أختر تاريخ بدايةالمرحلة",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Row(
                      children: [

                        RaisedButton(
                          color: Colors.blue,
                          child: Icon(
                            Icons.access_time_sharp,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            showDatePicker(
                                context: context,
                                initialDate: _dateTimes == null
                                    ? DateTime.now()
                                    : _dateTimes!,
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2030))
                                .then((date) {
                              setState(() {
                                _dateTimes = date;
                                datets = _dateTimes.toString();
                                datets = datets!.split(" ").first;
                              });
                            });
                          },
                        ),
                        SizedBox(width: 20),
                        SizedBox(width: 20),
                        datets != null
                            ? Text(
                          datets.toString(),
                          style: TextStyle(
                              color: Colors.white, fontSize: 16),
                        )
                            : Text(""),
                      ],
                    ),
                    Divider(),
                    Text(
                      " أختر تاريخ نهاية المرحلة",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        RaisedButton(
                          color: Colors.blue,
                          child: Icon(
                            Icons.access_time_sharp,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            showDatePicker(
                                context: context,
                                initialDate: _dateTimef == null
                                    ? DateTime.now()
                                    : _dateTimef!,
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2030))
                                .then((date) {
                              setState(() {
                                _dateTimef = date;
                                datetf = _dateTimef.toString();
                                datetf = datetf!.split(" ").first;
                              });
                            });
                          },
                        ),
                        SizedBox(width: 20),
                        datetf != null
                            ? Text(
                          datetf.toString(),
                          style: TextStyle(
                              color: Colors.white, fontSize: 16),
                        )
                            : Text(""),
                      ],
                    ),
                    // End Text username

                    SizedBox(
                      height: 10,
                    ),
                    Divider(),
                    buildTextFormFieldAll("أدخل سعر تكلفة المرحلة", stag_ecost),
                    Divider(),
                    TextFormField(
                      // onFieldSubmitted:  (value)=>addComment(),
                        keyboardType: TextInputType.multiline,
                        controller: stag_detalis,
                        maxLines: 3,
                        minLines: 1,
                        style: const TextStyle(
                            fontSize: 20.0, color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'تفاصيل وبيانات المرحلة',
                          filled: true,
                          fillColor: backgroundColor,
                          contentPadding: const EdgeInsets.only(
                              left: 16.0, bottom: 8.0, top: 8.0, right: 16.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        )),
                    // End Text username
                    SizedBox(
                      height: 10,
                    ),
                    // End Text username

                    SizedBox(
                      height: 10,
                    ),

                    // End Text username
                  ],
                ),
              ),
            )),
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
        decoration: BoxDecoration(color: Colors.black12, boxShadow: [
          BoxShadow(
              color: Colors.white10,
              spreadRadius: .1,
              blurRadius: 1,
              offset: Offset(1, 1))
        ]),
        child: Form(
            key: formstate_update_cat,
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    list.length>0?
                  Center(
                    child: RaisedButton(
                    color: Colors.white70,
                    elevation: 10,
                    padding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: 40),
                    onPressed: ()
                    {
                      Get.to(DetailsScreenpCustomer( Requst_State: widget.Requst_State,
                        Areas_Name:widget.Areas_Name ,
                        Cusotmer_Image:widget.Cusotmer_Image ,
                        Customer_Name:widget. Customer_Name,
                        Customer_Phone_Number:widget. Customer_Phone_Number,
                        Requst_DataTime:widget.Requst_DataTime ,
                        Requst_Service_ALL_Details:widget.Requst_Service_ALL_Details ,
                        Requst_Service_ID: widget.Requst_Service_ID,
                        Sercice_Provider_ID:widget.Sercice_Provider_ID ,
                        Sercice_Provider_Phone:widget. Sercice_Provider_Phone,
                        Service_Image:widget.Service_Image ,
                        Service_Name: widget.Service_Name,
                        Service_Number:widget.Service_Number ,
                        Service_Provider_Name:widget.Service_Provider_Name ,
                      ));
                    } // showadd ? add : update,
                    ,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                           "الذهاب الى الخدمة",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 4),
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.stars_outlined,
                              color: Colors.black,
                            ))
                      ],
                    ),
                ),
                  )
                        :Text(""),
                    SizedBox(height: 15,),
                    Divider(color: Colors.grey,
                    height: 2),
                    Column(
                      children: <Widget>[
                        DropdownSearch<String>(
                            mode: Mode.MENU,
                            showSelectedItems: true,
                            maxHeight: 400,
                            showClearButton: true,
                            popupBackgroundColor: Colors.white,
                            popupBarrierColor: Colors.white10,
                            showSearchBox: true,
                            items: list,

                            // ["Brazil", "France", "Tunisia", "Canada"],
                            label: "أختر رقم المرحلة",
                            hint: "أختر قسم للتعديل عليه",
                            popupItemDisabled: (String s) => s.startsWith('I'),
                            onChanged: (val) {
                              setState(() {
                                idstatedroblst= val!;
                                get_details_stages(val);
                              });
                            },
                            selectedItem: ""),
                      ],
                    )
                    // Start Text Username
                    ,

                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,

                      children:<Widget> [
                        RaisedButton(
                          color:State=="ساكن"? Colors.white:Colors.white70,
                          child: Text(
                              "بداء المرحلة"
                          ),
                          onPressed: (){

                            if (State == "") {
                              {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'يرجى اختيار رقم المرحلة',
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
                            }
                            else if(State =="ساكن"){
                              StartOrFineshStagesAndRequsst("قيد التنفيذ",idstatedroblst);
                            }

                          },),
                        SizedBox(width:30.0,),
                        RaisedButton(
                          color:State=="انتهت"||State=="ساكن"||State==""? Colors.white70:Colors.white,
                          child: Text(
                              "إنهاء المرحلة"
                          ),
                          onPressed: (){
                            if (State == "") {
                              {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'يرجى اختيار رقم المرحلة',
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
                            }
                            else if(State =="قيد التنفيذ"){
                              StartOrFineshStagesAndRequsst("انتهت",idstatedroblst);
                            }

                          },)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    sel_for_edit == ""
                        ? Text("")
                        : Center(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: ReadMoreText(
                          sel_for_edit,
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
                    ),
                    Divider(),

                    // End Text username

                    SizedBox(
                      height: 10,
                    ),
                    Center(
                        child: Text(
                          "أختر صور من جهازك",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                    // End Text username
                    InkWell(
                      onTap: pickercamera,
                      child: Center(
                        child: Image.asset(
                          "images/mashroaak_image/Add_Image.png",
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Center(
                      child: Stack(
                        children: <Widget>[
                          file == null
                              ? Text("لم يتم أختيار أي صورة")
                              : Image.file(
                            file!,
                            height: 50,
                            width: 50,
                          ),
                          file != null
                              ? InkWell(
                              child: Icon(
                                Icons.cancel,
                                color: Colors.white,
                              ),
                              onTap: () {
                                setState(() {
                                  file = null;
                                  upoadimage=null;
                                  simg = false;
                                });
                              })
                              : Text(""),
                        ],
                      ),
                    ),
                    file==null?Text(""):
                    Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width,
                        child:ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: upoadimage.length,
                          itemBuilder: (context, index) {



                            if(upoadimage!=null){
                              return  mySpec(context,File(upoadimage![index].path));}
                            return Center(
                              child: Text(""),
                            );
                          },
                        )



                    ),
                    Divider(
                      color: Colors.purple,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                        child: Text(
                          "أختر المستندات من جهازك",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),

                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: selectFile,
                      child: Center(
                        child: Image.asset(
                          "images/mashroaak_image/Files-PNG-Picture.png",
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    uploadfile!=null?







                    Center(
                      child: Stack(
                        children: <Widget>[
                          uploadfile == null
                              ? Text("لم يتم أختيار أي صورة")
                              : Image.asset(
                            "images/mashroaak_image/pdf.png",
                            height: 70,
                            width: 70,
                          ),
                          uploadfile != null
                              ? InkWell(
                              child: Icon(
                                Icons.cancel,
                                color: Colors.white,
                              ),
                              onTap: () {
                                setState(() {
                                  uploadfile = null;
                                  pdfName = null;
                                });
                              })
                              : Text(""),
                        ],
                      ),
                    ):
                    Text(""),
                    pdfName!=null?
                    Center(
                        child: Text(pdfName!)

                    ):Text(""),
                    Center(
                      child: Container(
                        // width: 150,
                        // height: 150,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: .1,
                                    blurRadius: 1,
                                    offset: Offset(1, 1))
                              ]),
                          child: Column(
                            children: <Widget>[


                            ],
                          )),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }

  TextFormField buildTextFormFieldAll(
      String myhinttext, TextEditingController myController) {
    return TextFormField(
      controller: myController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(4),
          hintText: myhinttext,
          filled: true,
          fillColor: kBackgroundColor,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey, style: BorderStyle.solid, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blue, style: BorderStyle.solid, width: 1))),
    );
  }

  AnimatedContainer buildContaineraAvatar(double mdw) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          color: showadd ? facebookColor : Colors.grey[700],
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(color: Colors.black, blurRadius: 3, spreadRadius: 0.1)
          ]),
      child: InkWell(
        onTap: () {
          setState(() {
            showadd = !showadd;
          });
        },
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 25,
                right: 25,
                child: showadd?Icon(Icons.stacked_line_chart, size: 50, color: Colors.white):
                Icon(Icons.perm_media, size: 50, color: Colors.white)),
          ],
        ),
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
                    borderRadius: BorderRadius.circular(mdw),
                    color: showadd ? Colors.blueGrey : Colors.blue)),
          ),
        ));
  }

  Positioned buildPositionedBottom(double mdw) {
    return Positioned(
        top: 400,
        right: mdw / 1.5,
        child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            height: mdw,
            width: mdw,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(mdw),
                color: showadd
                    ? Colors.blue[800]!.withOpacity(0.2)
                    : Colors.grey[800]!.withOpacity(0.3))));
  }

  // Positioned buildPositioneImagebackground(double mdw) {
  //   return Positioned(
  //     top: 200,
  //     right: 0,
  //
  //     child: Container(
  //       margin: EdgeInsets.all(5),
  //       width: MediaQuery.of(context).size.width,
  //       height: MediaQuery.of(context).size.height/2,
  //       decoration: BoxDecoration(
  //         image: DecorationImage(
  //             image: AssetImage('images/Splach_Screen/splash.png'),
  //             fit: BoxFit.cover),
  //       ),
  //     ),
  //   );
  // }
  showLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Center(child: Text('جاري التحميل',style: TextStyle(fontSize: 16),)),
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
  mySpec(context , File picture ){


    return Container(
        height: 100,
        width: 100,
        child: InkWell(
          child: ListTile(
            title:
            Image.file(

              picture,
              width: 80,
              height: 80,
              fit: BoxFit.fill,
            ),


          ),
          onTap: (){},
        )
    ) ;
  }
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
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}