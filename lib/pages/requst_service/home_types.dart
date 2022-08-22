import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madmooon/pages/requst_service/requst_home_body.dart';
import '../../colors.dart';
import '../../compount/bottom_navigationBar.dart';
import '../../compount/close .dart';
import '../../compount/mydrawer.dart';
import '../../paths.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeType extends StatefulWidget {
  const HomeType({Key? key}) : super(key: key);

  @override
  _HomeTypeState createState() => _HomeTypeState();
}

class _HomeTypeState extends State<HomeType> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: bottom_NavigationBar(home: 1,),
      drawer: Mydrawer(),
      endDrawer: Center(
        child: Container(
            child: InkWell(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                      padding:
                      EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: RichText(
                        text: TextSpan(
                            style: TextStyle(color: backgroundColor,fontSize: 30),
                            children: [
                              TextSpan(text: "خروج"),
                            ]),
                      ))),
              onTap: (){
                Navigator.pop(context);
                showLexit(context);
              },
            )
        ),
      ),
      body: Requst_Body(Representatives_ID: "1",Areas_ID:"10111",),
    );
  }
}

class Requst_Body extends StatefulWidget {
  const Requst_Body({
    required this. Representatives_ID,
    required this. Areas_ID,


  }) ;
  final String Representatives_ID;
  final String Areas_ID;


  @override
  State<Requst_Body> createState() => _Requst_Body_BodyState();
}
class _Requst_Body_BodyState extends State<Requst_Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Expanded(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 70.0),
                  decoration: BoxDecoration(
                    color: facebookColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),

                ),
                GridView.count(
                  controller: new ScrollController(keepScrollOffset: false),
                  primary: false,
                  padding: const EdgeInsets.all(5),
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: <Widget>[
                    dgitems(state: "تم الطلب",picture: "images/StateService/stratr.png",lable: "في مرحلة الطلب",Representatives_ID: widget.Representatives_ID,Areas_ID: widget.Areas_ID),
                    dgitems(state: "",picture: "images/StateService/stratr.png",lable: "جميع الخدمات",Representatives_ID: widget.Representatives_ID,Areas_ID: widget.Areas_ID),
                    dgitems(state: "في المقابلة",picture: "images/StateService/waiting.png",lable: "خدمات في مرحلة المقابلة",Representatives_ID: widget.Representatives_ID,Areas_ID: widget.Areas_ID),
                    dgitems(state: "قيد التنفيذ",picture: "images/StateService/continu.png",lable: "الخدمات المستمرة",Representatives_ID: widget.Representatives_ID,Areas_ID: widget.Areas_ID),
                    dgitems(state: "انتهت",picture: "images/StateService/finish.png",lable: "الخدمات المنتهية",Representatives_ID: widget.Representatives_ID,Areas_ID: widget.Areas_ID),
                    dgitems(state: "تم الإلغاء",picture: "images/StateService/finish.png",lable: "الخدمات الملغية",Representatives_ID: widget.Representatives_ID,Areas_ID: widget.Areas_ID),

                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}
class dgitems extends StatefulWidget {
  const dgitems({required this.state,required this.picture,required this.lable, required this. Representatives_ID,
    required this. Areas_ID,

  }) ;
  final String state;
  final String picture;
  final String lable;
  final String Representatives_ID;
  final String Areas_ID;
  @override
  State<dgitems> createState() => _dgitemsState();
}

class _dgitemsState extends State<dgitems> {

  Future get_all_requsts(String Representatives_ID,String Areas_ID,String Requst_State) async {
    Uri url =Uri.parse(Paths.Requst_Service+"get_all_requst.php");
    var data = {
      "Representatives_ID":Representatives_ID,
      "Areas_ID": Areas_ID,
      "Requst_State": Requst_State,
    };
    var response = await http.post(url , body: data ) ;
    var responsebody = jsonDecode(response.body) ;
    if(responsebody.length==0)
    {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("لايوجد طلبات",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,
            fontSize: 20,
            fontFamily: 'Cairo'),),backgroundColor:kTextColor,),
      );
    }

    else
    {
      Get.to(Requst_Home_Body ( Representatives_ID:"1", Areas_ID:"10111", state:widget.state));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child:
        Container(
          margin: EdgeInsets.all(5


          ),
          height: 190.0,
          child: InkWell(
            onTap: (){

              get_all_requsts(widget.Representatives_ID,widget.Areas_ID,widget.state);
            },
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [

                Container(
                  height: 200.0,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    gradient: LinearGradient(
                        colors: [kTextLightColor2],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 15),
                          blurRadius: 25,
                          color: Colors.black12),
                    ],
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal:10, // 30 px padding
                      vertical: 10, // 5 px padding
                    ),
                    decoration: BoxDecoration(
                      color: facebookColor,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Image.asset(widget.picture),

                  ),

                ),
                Positioned(
                  bottom: 0.0,

                  child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal:  10 ,// 30 px padding
                        vertical:3, // 5 px padding
                      ),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child:InkWell(
                          child:
                          RichText(
                            text: TextSpan(
                                style:
                                TextStyle(color:backgroundColor ),
                                children:  [

                                  TextSpan(text: widget.lable)

                                ]),
                          )
                      )

                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

