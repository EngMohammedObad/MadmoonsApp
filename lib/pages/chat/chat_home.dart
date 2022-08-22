import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:image_picker/image_picker.dart';
import 'package:madmooon/pages/chat/zoom_image.dart';
import 'package:madmooon/pages/services/models/Services.dart';
import 'package:readmore/readmore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../colors.dart';
import 'package:http/http.dart' as http;

import '../../paths.dart';
class ChatHome extends StatefulWidget {


  const ChatHome({required this.RequstState,required this.Requst_Number});
  final String RequstState;
  final String Requst_Number;
  @override
  State<ChatHome> createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  // void enterFullScreen(FullScreenMode fullScreenMode) async {
  //   await FullScreen.enterFullScreen(fullScreenMode);
  // }
  bool show=false;
  ScrollController scrollController=ScrollController();


  String MyAccount="";
  String Account_Type="";
  String My_Image="";
  String MyName="";
  String Token="";
 TextEditingController _addMessage = new TextEditingController();
  getPref() async {
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

    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      Type=preferences.getString("type");
      mytoken=preferences.getString("mytoken");
      ID_Customer=preferences.getString("ID_Customer");
      Customer_Name=preferences.getString("Customer_Name");
      Cusotmer_Image=preferences.getString("Cusotmer_Image");
      Custmer_Account=preferences.getString("Custmer_Account");
      Sercice_Provider_ID=preferences.getString("Sercice_Provider_ID");
      Service_Provider_Name=preferences.getString("Service_Provider_Name");
      Service_Provider_Image=preferences.getString("Service_Provider_Image");
      Service_Provider_Acount=preferences.getString("Service_Provider_Acount");





    });
    print("************$Type******************");
    setState(() {
      Token=mytoken!;
    });
    if(Type!=null||Type!="")
    {
      if(Type=="Customer")
      {
        setState(() {
          Account_Type="Customer";
           MyAccount=ID_Customer!;
           My_Image=Cusotmer_Image!;
           MyName=Customer_Name!;
        });
      }

      else if(Type=="Sercice_Provider")
      {
        setState(() {
          Account_Type="Sercice_Provider";
          MyAccount=Sercice_Provider_ID!;
          My_Image=Service_Provider_Image!;
          MyName=Service_Provider_Name!;
        });
      }
      else {
        setState(() {
          Account_Type="Representative";
        });
      }
    }
  }
 Future Get_Message() async {

   print("*****************************************************999"+widget.Requst_Number+"999******************************************9");
   Uri url = Uri.parse(Paths.Message_Chat+"Get_Message.php");
   var data = {

     "Requst_Number": widget.Requst_Number
   };
   var response = await http.post(url, body: data);
   var responsebody = jsonDecode(response.body);
   // setState(() {
   //   snap=responsebody;
   // });
   print(responsebody[0]["Requst_Number"]);
   print(responsebody[0]["Account"]);
   print("***********************************************************************************************9");
   //scrollController.jumpTo(scrollController.position.maxScrollExtent);
   print(scrollController.position.pixels);
   if(scrollController.position.pixels>=scrollController.position.maxScrollExtent||scrollController.position.pixels>=scrollController.position.maxScrollExtent-400)
   {  scrollController.animateTo(
       scrollController.position.maxScrollExtent,
       duration: const Duration(seconds: 3),
       curve: Curves.fastLinearToSlowEaseIn);
   }



   return responsebody;
 }
int count1=0,count2=0;

  showLoading(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: <Widget>[
                Text("the text is empty "),
              ],
            ),
          );
        });
  }

  dynamic snap;
  String utf8convert(String text) {
    List<int> bytes = text.toString().codeUnits;
    return utf8.decode(bytes).toString();
  }
  var upoadimage;
  File? file;

  Future pickermyltypicture() async {
    print("*********************8***************************");

    final myfil = await ImagePicker()
        .getMultiImage(imageQuality:5 );
    //source: ImageSource.gallery);
    setState(() {
      print("*********************8***************************");

      upoadimage=myfil;
      file = File(upoadimage![0].path);
      Add_Multy_Image();
    });
    print("*********************9***************************");

  }
  File? _file;
  Future pickercamera() async {
    final image = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      _file = File(image!.path);
    });


    Add_Image();
  }
  Future Add_Image() async {
    print("*********************3***************************");

    if (file!=null)
    {  print("*********************4***************************");

      file = File(_file!.path);
      ///  //////////////////////////////////
      Uri url = Uri.parse(Paths.Domain_Global+"Add_Message_Chat.php");
      DateTime Message_Time=DateTime.now();
      String base64 = base64Encode(file!.readAsBytesSync());
      String m_img = file!.path.split("/").last;
      var data = {
        "Account": MyAccount,
        "Mesage_Text": m_img,
        "Type_Message":"Image",
        "Requst_Number": widget.Requst_Number,
        "Message_Time": Message_Time.toString(),
        "Account_Type": Account_Type,
        "Name": MyName,
        "image64": base64,
      };
      var response = await http.post(url, body: data);

    }
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(microseconds: 0), curve: Curves.easeOut);
    _addMessage.text = "";
    scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 3000),
        curve: Curves.easeOut);
    print("*********************6***************************");
  }
  Future Add_Multy_Image() async {

    if (file!=null)
    {  print("*********************4***************************");
    for(int i=0;i<upoadimage.length;i++)
    {
      file = File(upoadimage![i].path);
      ///  //////////////////////////////////
      Uri url = Uri.parse(Paths.Domain_Global+"Add_Message_Chat.php");
      DateTime Message_Time=DateTime.now();
      String base64 = base64Encode(file!.readAsBytesSync());
      String m_img = file!.path.split("/").last;
      var data = {
        "Account": MyAccount,
        "Mesage_Text": m_img,
        "Type_Message":"Image",
        "Requst_Number": widget.Requst_Number,
        "Message_Time": Message_Time.toString(),
        "Account_Type": Account_Type,
        "Name": MyName,
        "image64": base64,
      };
      var response = await http.post(url, body: data);
      ///  ///////////////////////////////
      print("*********************5***************************");
    }
    }
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(microseconds: 0), curve: Curves.easeOut);
    _addMessage.text = "";
    scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 3000),
        curve: Curves.easeOut);
    print("*********************6***************************");
  }
  Future Add_Message() async {
    if (_addMessage.text == null) {
      showLoading(context);
      return;
    }



    Uri url = Uri.parse(Paths.Domain_Global+"Add_Message_Chat.php");
    DateTime Message_Time=DateTime.now();
    var data = {
      "Account": MyAccount,
      "Mesage_Text": _addMessage.text,
      "Type_Message":"Text",
      "Requst_Number": widget.Requst_Number,
      "Message_Time": Message_Time.toString(),
      "Account_Type": Account_Type,
      "Name": MyName,
      "state":"منتضر",
      "show_provider":widget.RequstState=="في مرحلة المقابلة"||widget.RequstState=="قيد التنفيذ"?"نعم":"لا"
    };
    var response = await http.post(url, body: data);
    scrollController.animateTo(scrollController.offset,
        duration: const Duration(microseconds: 0), curve: Curves.easeOut);
    _addMessage.text = "";

  }
  Future re() async {




    Uri url = Uri.parse(Paths.Domain_Global+"Add_Messag_Cha.php");
    var data = {
      "Account": MyAccount,

    };
    var response = await http.post(url, body: data);

    print(scrollController.position.pixels);
    if(scrollController.position.pixels>=scrollController.position.maxScrollExtent||scrollController.position.pixels>=scrollController.position.maxScrollExtent-400)
    {  scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 3),
        curve: Curves.fastLinearToSlowEaseIn);
    }


  }




  @override
  void initState() {

    getPref();

    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
re();
    });
    // enterFullScreen(FullScreenMode.EMERSIVE_STICKY);
  }

  @override
  Widget build(BuildContext context) {
    double wi = MediaQuery.of(context).size.width;
    double he = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(

        body:Stack(
           children: [
             Positioned(
               top: -55,
               child: Container(
                 width: wi,
                 height: he /1.8,
                 child: Image.asset(
                   "images/chat/header_chat.png",
                   width: wi,
                   height: he ,
                   fit: BoxFit.contain,
                 ),
               ),
             ),
             Positioned(
               top: -20,
               child: Container(
                 width: wi,
                 height: he /2,
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Row(
                       children: [
                         SizedBox(width: 20,),
                         Icon(Icons.arrow_back_ios,color: Colors.white,),
                       ],
                     ),

                     // decoration: BoxDecoration(
                     //     gradient: LinearGradient(colors: [Colors.transparent,Colors.white],
                     //         begin: Alignment.topCenter,
                     //         end: Alignment.bottomCenter
                     //     )),
                     Center(child: Text("خدمة تسويق",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18),)),

                     Row(
                       children: [

                       //   PopupMenuButton(
                       //     elevation: 10,
                       //
                       //     shape: RoundedRectangleBorder(
                       //       borderRadius: BorderRadius.all(
                       //         Radius.circular(20.0),
                       //       ),
                       //     ),
                       // offset: Offset(20, 100),
                       //     child: Center(child: Icon(Icons.menu_open,color: Colors.white,)),
                       //     itemBuilder: (context) {
                       //       return List.generate(3, (index) {
                       //         return PopupMenuItem(
                       //           child: Text(index==0?'عرض السعر الموافق علية ':index==1?'التفاصيل الموافق عليها من العميل ':'العقد '),
                       //         );
                       //       });
                       //     },
                       //   ),
                         /// ///////////////////////////////////////////////////////////
                         Container(
                             child:FocusedMenuHolder
                               (
                               menuBoxDecoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(50.0))),
                               duration: Duration(milliseconds: 100),
                               animateMenuItems: true,
                               menuWidth: wi/1.2,
                               blurBackgroundColor: Colors.black12,
                               openWithTap: true, // Open Focused-Menu on Tap rather than Long Press
                               menuOffset: 10.0, // Offset value to show menuItem from the selected item
                               bottomOffsetHeight: 80.0, // Offset height to consider, for showing the menu item ( for example bottom navigation bar), so that the popup menu will be shown on top of selected item.
                               menuItems: <FocusedMenuItem>[
                                 // Add Each FocusedMenuItem  for Menu Options
                                 FocusedMenuItem(title: Text("عرض السعر الموافق علية"),trailingIcon: Icon(Icons.local_offer_outlined) ,onPressed: (){

                                 }),
                                 FocusedMenuItem(title: Text("التفاصيل الموافق عليها"),trailingIcon: Icon(Icons.perm_device_information) ,onPressed: (){}),
                                 FocusedMenuItem(title: Text("العقد"),trailingIcon: Icon(Icons.control_camera) ,onPressed: (){}),
                                 FocusedMenuItem(title: Text("عرض السعر"),trailingIcon: Icon(Icons.picture_as_pdf_outlined,) ,onPressed: (){}),
                               ],
                               onPressed: (){},
                               child: Center(child: Icon(Icons.menu_open,color: Colors.white,)),
                             )
                         ),
                         SizedBox(width: 10),
                       ],

                     ),

                   ],
                 )
               ),
             ),

             Container(
                 margin: EdgeInsets.only(top: he/3.7,bottom: he/4.2,left: wi/60,right: wi/50),


                     child: SingleChildScrollView(

                         controller: scrollController,
                     child: buildFutureBuilder())

               ),
             Expanded(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.end,
                 children:<Widget> [



                   Container(height: 10, width: 10),
                   FAILDTEXT( _addMessage),


                 ],
               ),
             )
             ,
           ],

        ),

      ),
    );
  }
  FutureBuilder<dynamic> buildFutureBuilder() {
    return FutureBuilder(
      future: Get_Message(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          snap = snapshot.data;
          return Column(
            children: <Widget>[
              for (int i = 0; i < snap.length; i++)
                CommentsList(
                  Account:snap[i]['Account'] ,
                    Mesage_Text: snap[i]['Mesage_Text'],
                  Message_ID:snap[i]['Message_ID'] ,
                  Message_Time:snap[i]['Message_Time']  ,
                  Requst_Number: snap[i]['Requst_Number'] ,
                  Type_Message:snap[i]['Type_Message'] ,
                  Name:snap[i]['Name'] ,
                  MyAccount:MyAccount ,
                  Account_Type:Account_Type ,
                  My_Image:My_Image ,
                  state:snap[i]['state'] ,
                  show_provider: snap[i]['show_provider'] ,
                ),

            ],
          );
        }
        return Center(
          child: Image.asset('images/Splach_Screen/splash.png'),
        );
      },
    );
  }
  void callEmoji() {
    print('Emoji Icon Pressed...');
  }

  void callAttachFile()
  {
    pickermyltypicture();
  }

  void callCamera()
  {
    pickermyltypicture;
  }

  void callVoice()
  {
    print("************");
   Add_Message();
   setState(() {
     _addMessage.text="";
   });
  }
  Widget voiceIcon()
  {
    return SvgPicture.asset("images/chat/send.svg",color: Colors.white,);
  }
  // Widget moodIcon()
  // {
  //   return IconButton(
  //       icon: const Icon(
  //         Icons.mood,
  //         color: kTextColor,
  //       ),
  //       onPressed: () => callEmoji());
  // }

  Widget attachFile()
  {
    return
      Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.7),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),

        ),
        child: IconButton(
          icon: SvgPicture.asset("images/chat/sharrfile.svg",color: Colors.white,fit: BoxFit.fill,),
          onPressed: () => callAttachFile(),
        ),
      );



  }

  Widget camera()
  {
    return
      Container(
        margin: EdgeInsets.only(right: 5,left: 5),
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.7),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),

          ),

      child:IconButton(
      icon:      SvgPicture.asset("images/chat/addimage.svg",color: Colors.white,),
      onPressed: () {
        pickercamera();
      },
    ));
  }
  Widget showup()
  {
    return
      Container(
          margin: EdgeInsets.only(right: 5,left: 5),
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.7),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),

          ),

          child:IconButton(
            icon:      SvgPicture.asset("images/chat/getback.svg",color: Colors.white,),
            onPressed: () {
              setState(() {
                show=true;
              });
            },
          ));
  }
  Widget backshow()
  {
    return
      Container(
          margin: EdgeInsets.only(right: 5,left: 5),
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.7),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),

          ),

          child:IconButton(
            icon:      SvgPicture.asset("images/chat/getback.svg",color: Colors.white,),
            onPressed: () {
              setState(() {
                show=false;
              });
            },
          ));
  }

  Container FAILDTEXT(TextEditingController _addMessage) {
    return Container(
            margin: const EdgeInsets.only(top: 12.0,bottom: 5),
            height: 100,
            child: Row(

              children: [
SizedBox(width: 5,),


        Directionality(
          textDirection:TextDirection.ltr,
                  child: Container(
                    padding: const EdgeInsets.all(10
                    ),
                    decoration: BoxDecoration(
                      color: kTextColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                        border: Border.all(color: Colors.grey)
                    ),
                    child: InkWell(
                      child: voiceIcon(),
                      onTap: () => callVoice(),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 7,
                            color: Colors.grey)
                      ],
                    ),
                    child: Row(
                      children: [
                        // moodIcon(),
                        const SizedBox(width: 15,),
                         Expanded(

                          child: TextField(
                            style: TextStyle(
                                fontSize: 15.0,
                                height: 1.0,
                                color: Colors.black
                            ),
controller: _addMessage,
                  minLines: 1,
                            maxLines: 5,
                            decoration: InputDecoration(
                                hintText: "أكتب رسالة",
                                hintStyle: TextStyle(color: kPrimaryColor),
                                border: InputBorder.none),
                          ),
                        ),
                        show ?attachFile():Text(""),
                        show ?camera():Text(""),
                      ],
                    ),
                  ),
                ),

                show ?backshow():Text(""),
                show ==false?showup():Text(""),
                const SizedBox(width: 2,),
              ],
            ),
          );
  }
}

class CommentsList extends StatefulWidget {
  final Message_ID;
  final Account;
  final Mesage_Text;
  final Type_Message;
  final Requst_Number;
  final Message_Time;
  final MyAccount;
  final Account_Type;
  final My_Image;
  final Name;
  final state;
  final show_provider;
  CommentsList(
      {this.Message_ID, this.Account, this.Mesage_Text, this.Type_Message,
        this.Requst_Number, this.Message_Time,this.MyAccount,
        this.Account_Type,this.My_Image,this.Name,
        this.state,this.show_provider
      });

  @override
  State<CommentsList> createState() => _CommentsListState();
}

class _CommentsListState extends State<CommentsList> {
  var formate1= "";
  var formate2= "";
  String time = "";

  void initState() {

    var dateTime = DateTime.parse(widget.Message_Time);

    formate1 = "${dateTime.day}-${dateTime.month}-${dateTime.year}";

    time = widget.Message_Time.substring(10, 16);
    String hour = time.substring(0, 3);
    if (int.parse(hour) > 12) {
      int s = int.parse(hour) - 12;
      time = s.toString()
          + widget.Message_Time.substring(13, 16)
      + "  مساء";
    } else
      time = time
          + widget.Message_Time.substring(13, 16)
          + " صباحا ";

    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    double wi = MediaQuery.of(context).size.width;
    double he = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(

            color: Colors.transparent,
            child: widget.Type_Message=="Text"||widget.Type_Message=="Image"? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Directionality(
                    textDirection: widget.Account == widget.MyAccount ? TextDirection.rtl : TextDirection.ltr,
                    child: ListTile(

                        horizontalTitleGap:  wi/4,
                        autofocus: true,
                        focusColor: Colors.deepPurple,
                        onTap: () {},
                        //  leading:

                        title: Container(
                            margin: EdgeInsets.only(top: 15,left: 5,right: 5), child: Text(widget.Account != widget.MyAccount?widget.Name:"أنـا")),
                        subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[

                              widget.Type_Message=="Text"?Container(padding: EdgeInsets.all(10),width: wi/1.3,
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration:widget.Account!=widget.MyAccount?
                                  BoxDecoration(
                                    color: kPrimaryColor2,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(5.0),
                                      bottomRight: Radius.circular(5.0),
                                      bottomLeft: Radius.circular(5.0),
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                          offset: Offset(0, 2),
                                          blurRadius: 7,
                                          color: Colors.grey)
                                    ],
                                  )
                                      :BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      bottomRight: Radius.circular(5.0),
                                      bottomLeft: Radius.circular(5.0),

                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                          offset: Offset(0, 2),
                                          blurRadius: 7,
                                          color: Colors.grey)
                                    ],
                                  )
                                  ,

                                  // color: Colors.grey[100],
                                  child:widget.Type_Message=="Text"?

                                  // Expanded(child: Text( widget.Mesage_Text+"\n"+"\n"+time+"\n"+formate1,style: TextStyle(),))

                                  // Container(
                                  // width: wi/1.4,
                                  //   child: ReadMoreText(
                                  //     widget.Mesage_Text+"\n"+"\n"+time+"\n"+formate1,
                                  //     trimLines: 20,
                                  //     colorClickableText: Colors.pink,
                                  //     style: TextStyle(
                                  //         color: Colors.black, fontSize: 18),
                                  //     trimMode: TrimMode.Line,
                                  //     trimCollapsedText: ' مشاهدة المزيد',
                                  //     trimExpandedText: 'مشاهدة أقل',
                                  //     lessStyle: TextStyle(
                                  //         fontSize: 16,
                                  //         fontWeight: FontWeight.bold,
                                  //         color: Colors.amber),
                                  //     moreStyle: TextStyle(
                                  //         fontSize: 16,
                                  //         fontWeight: FontWeight.bold,
                                  //         color: Colors.amber),
                                  //   ),
                                  // )

                                  SelectableText.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(text:  widget.Mesage_Text+"\n"+"\n"+time///+"\t"+formate1,
                                        ),

                                      ],
                                    ),
                                  )

                                      :widget.Type_Message=="Image"?


                                  Stack(
                                    children: [

                                      // InteractiveImage(Paths.Chat_Images+widget.Mesage_Text,),
                                      InteractiveViewer(

                                        boundaryMargin: EdgeInsets.all(20.0),
                                        minScale: 0.1, // min scale
                                        maxScale: 4.6, // max scale
                                        scaleEnabled: true,

                                        panEnabled: true,
                                        child: Image.network(
                                          Paths.Chat_Images+widget.Mesage_Text,
                                          width: wi/2,
                                        ),
                                      ),



                                      Positioned(
                                          bottom: 0,

                                          child: Text("\n4"+formate1,style: TextStyle(color: Colors.black),))

                                    ],
                                  )
                                      :Text(""),


                                ),
                              )
                                  :widget.Type_Message=="Image"?
                              Column(
                                children: [

                                  // InteractiveImage(Paths.Chat_Images+widget.Mesage_Text,),
                                  Container(
                                    decoration:   BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5.0),
                                        bottomRight: Radius.circular(5.0),
                                        bottomLeft: Radius.circular(5.0),
                                      ),
                                      boxShadow: const [
                                        BoxShadow(
                                            offset: Offset(0, 2),
                                            blurRadius: 7,
                                            color: Colors.grey)
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        InteractiveViewer(

                                          boundaryMargin: EdgeInsets.all(20.0),
                                          minScale: 0.1, // min scale
                                          maxScale: 4.6, // max scale
                                          scaleEnabled: true,

                                          panEnabled: true,
                                          child: Image.network(
                                            Paths.Chat_Images+widget.Mesage_Text,
                                            width: wi/2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),



                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                    children: [
                                      Text("\n"+formate1,style: TextStyle(color: Colors.black54,fontSize: 12),),

                                    ],
                                  )

                                ],
                              ):SizedBox(height: 0,)


                            ]

                        )

                    )
                ),
              ],
            )
                :widget.Type_Message=="notifi"?
            Container(
                padding: EdgeInsets.all(5),
                width: wi/1.2,
                decoration:   BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0),
                    bottomLeft: Radius.circular(5.0),
                  ),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 7,
                        color: Colors.grey)
                  ],
                ),
                child: Center(
                    child:  Center(
                        child: Column(
                          children: [
                            Container(

                              child:Text(widget.Mesage_Text,style: TextStyle(color: Colors.grey),),
                            )
                          ],
                        )
                    )
                )
            )
                :widget.Type_Message=="DFR"?
            Center(
              child: Container(
                //padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(top: 10),
                width: wi/1.1,
                decoration:   BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0),
                    bottomLeft: Radius.circular(5.0),
                  ),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 7,
                        color: Colors.grey)
                  ],
                ),
                child: Column(
                  children:[
                    Container(
                      padding: EdgeInsets.all(5),
                      color:  kPrimaryColor2,
                      width: double.infinity,
                      child:Text("التفاصيل المرسله من ممثل الخدمة",style: TextStyle(color: Colors.white) ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5,left: 5,bottom: 10,right: 5),
                      color:  Colors.transparent,
                      child:Text(widget.Mesage_Text,style: TextStyle(color: Colors.grey) ),
                    ),
                    widget.state=="منتضر" ?Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          RaisedButton(
                            color: kPrimaryColor2,
                            elevation: 10,
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 40),
                            onPressed:  (){
                              // Add_rreason_cancel();
                            },
                            child:  Text(
                              "موافق",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14),
                            ),
                          ),
                          SizedBox(width: 5,),
                          TextButton(
                              child: Text(
                                  "غير موافق".toUpperCase(),
                                  style: TextStyle(fontSize: 14)
                              ),
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(top: 5,bottom: 5,
                                      left: 30,right: 30)),
                                  foregroundColor: MaterialStateProperty.all<Color>(kPrimaryColor2),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                          side: BorderSide(color: kPrimaryColor2)
                                      )
                                  )
                              ),
                              onPressed: () => null
                          ),
                          // RaisedButton(
                          //   color: Colors.grey.shade100,
                          //
                          //   padding: EdgeInsets.symmetric(
                          //       vertical: 10, horizontal: 40),
                          //   onPressed:  (){
                          //     // Add_rreason_cancel();
                          //   },
                          //   child:  Text(
                          //     "غير موافق",
                          //     style: TextStyle(
                          //         color: kPrimaryColor2, fontSize: 14),
                          //   ),
                          // ),
                        ],
                      ),
                    ):
                    Container(
                        width: double.infinity,
                        color: Colors.grey.shade100,

                        child:   Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(5),
                          color: Colors.grey.shade100,

                          child: Center(
                            child: Text(widget.state=="موافق"?
                            "تم الموافقة عليها":"لم تتم الموافقة عليها",
                              style: TextStyle(
                                  color: kPrimaryColor2, fontSize: 18),
                            ),
                          ),
                        )
                    )
                  ]

                  ,
                ),
              ),
            ):
            Text("")
        )
      ],
    );
  }
}