import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';
import 'package:madmooon/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../paths.dart';
import 'package:readmore/readmore.dart';
import 'package:progress_indicators/progress_indicators.dart';

class StagesMedia extends StatefulWidget {
  const StagesMedia({Key? key, required this.Stages_ID,required this.Stage_Details})
      : super(key: key);
  final String Stages_ID;
  final String Stage_Details;
  @override
  _StagesMedia createState() => _StagesMedia();
}

class _StagesMedia extends State<StagesMedia> {

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
    Uri url = Uri.parse(Paths.Media + "get_all_media_for_stages.php");
    var data = {
      "Stages_ID": widget.Stages_ID,
    };

    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    return responsebody;
  }


  /// ////////////////////

  var sel_for_edit = "";
  DateTime? _dateTimes;
  String? datets;
  DateTime? _dateTimef;
  String? datetf;


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
    double height =MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;
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

                      Padding(
                        padding: EdgeInsets.only(top: 20),
                      ),


                          buildFormUpdateCategory(mdw),
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



  Center buildFormUpdateCategory(double mdw) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInOutBack,
        margin: EdgeInsets.only(top: 20),
        height: 700,
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



                    SizedBox(
                      height: 10,
                    ),
                     Center(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: ReadMoreText(
                          widget.Stage_Details,
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
                    Divider(color: Colors.white,),


                    Text("الصور",style: TextStyle(color: Colors.orange,fontSize: 30),),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      width: 300,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          FutureBuilder(
                              future: fetch(),

                              builder: (BuildContext context, AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  dynamic snap = snapshot.data;
                                  return Row(
                                    children: [
                                      for(int i=0;i<snap.length;i++)
                                        if(snapshot.data[i]["Media_Type"]=="image")
                                          mySpecImage(context,
                                              snapshot.data[i]["Stages_ID"],
                                              snapshot.data[i]["Multimedia_ID"],
                                              snapshot.data[i]["Media_Type"],
                                              snapshot.data[i]["Media"])



                                    ],
                                  );


                                }
                                return Center(
                                  child: Text(""),
                                );
                              }),

                        ],
                      ),
                    ),
                    Divider(color: Colors.white,),
                    Text("ملفات الـ pdf",style: TextStyle(color: Colors.orange,fontSize: 30),),

                    // End Text username

                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      width: 300,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          FutureBuilder(
                              future: fetch(),

                              builder: (BuildContext context, AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  dynamic snap = snapshot.data;
                                  return Row(
                                    children: [
                                      for(int i=0;i<snap.length;i++)
                                        if(snapshot.data[i]["Media_Type"]=="file")
                                          mySpecFile(context,
                                              snapshot.data[i]["Stages_ID"],
                                              snapshot.data[i]["Multimedia_ID"],
                                              snapshot.data[i]["Media_Type"],
                                              snapshot.data[i]["Media"])



                                    ],
                                  );


                                }
                                return Center(
                                  child: Text(""),
                                );
                              }),

                        ],
                      ),
                    ),

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
mySpecImage(context , String Stages_ID ,String Multimedia_ID,var Media_Type,var Media){

  return Container(
      height: 200,
      width: 200,
      child: InkWell(
        child: ListTile(
          title:
          FadeInImage.assetNetwork(
            placeholder: 'images/Copper-Loader.gif',
            image: Paths.StagesMedia+Media,
            width: 190,
            height: 190,
            fit: BoxFit.fill,
          ),

          // subtitle: Container(
          //   child: Text(
          //     "$name",
          //     textAlign: TextAlign.center,
          //   ),
          // ),
        ),
        onTap: (){},
      )
  ) ;
}
mySpecFile(context , String Stages_ID ,String Multimedia_ID,var Media_Type,var Media){
  _launchURL( String pdf) async {

    if (await canLaunch(pdf)) {
      await launch(pdf);
    } else {
      throw 'Could not launch $pdf';
    }
  }
  return Container(
      height: 300,
      width: 120,
      child: InkWell(
        child: ListTile(
          title:
          Image.asset(
            "images/mashroaak_image/pdf.png",
            width: 100,
            height: 100,
            fit: BoxFit.contain,
          ),

          subtitle: Container(
            child: Text(
              "$Media",
              textAlign: TextAlign.center,
            ),
          ),
        ),
        onTap: (){
          print("*************************"+Media);
          _launchURL(Paths.StagesMedia+Media);

        },
      )
  ) ;
}