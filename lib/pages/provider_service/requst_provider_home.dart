import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madmooon/compount/mydrawer.dart';
import 'package:madmooon/pages/provider_service/requst_provider_home_body.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../colors.dart';
import '../../compount/bottom_navigationBar.dart';
import '../../compount/close .dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../paths.dart';

import 'models/provider.dart';

class Requst_Provider_Home extends StatefulWidget {
  const Requst_Provider_Home({Key? key}) : super(key: key);

  @override
  _Requst_Provider_HomeState createState() => _Requst_Provider_HomeState();
}

class _Requst_Provider_HomeState extends State<Requst_Provider_Home> {

  String  Sercice_Provider_ID="";
  String Service_Provider_Name="";
  String Service_Provider_ID_NO="";
  String  Service_Provider_Acount="";
  String Sercice_Provider_Phone="";
  String Service_Number="";
  String Sercice_Provider_experience="";
  String Service_Provider_Image="";
  String  Representatives_ID="";
  String Sercice_Provider_Account_Type="";
  String Service_Provider_Token="";

  @override
  void initState() {
    getPref();

    Sercice_Provider_ID;
    Service_Provider_Name;
    Service_Provider_ID_NO;
    Service_Provider_Acount;
    Sercice_Provider_Phone;
    Service_Number;
    Sercice_Provider_experience;
    Service_Provider_Image;
    Representatives_ID;
    Sercice_Provider_Account_Type;
    Service_Provider_Token;
    super.initState();
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {

      Sercice_Provider_ID = preferences.getString("Sercice_Provider_ID" )!;
      Service_Provider_Name = preferences.getString('Service_Provider_Name')!;
      Service_Provider_ID_NO = preferences.getString('Service_Provider_ID_NO' )!;
      Service_Provider_Acount = preferences.getString('Service_Provider_Acount' )!;
      Sercice_Provider_Phone = preferences.getString('Sercice_Provider_Phone')!;
      Service_Number = preferences.getString('Service_Number')!;
      Sercice_Provider_experience = preferences.getString('Sercice_Provider_experience')!;
      Service_Provider_Image = preferences.getString('Service_Provider_Image')!;
      Representatives_ID = preferences.getString('Representatives_ID')!;
      Sercice_Provider_Account_Type = preferences.getString('type')!;
      Service_Provider_Token = preferences.getString('mytoken' )!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTextColor ,
      bottomNavigationBar: bottom_NavigationBar(home: 1),
      drawer: Mydrawer(),

      endDrawer:
      Center(
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
      body: DefaultTabController(
        length: 1,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: kPrimaryColor,
                expandedHeight: 150.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(Service_Provider_Name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: FadeInImage.assetNetwork(
                      placeholder: 'images/Splach_Screen/gif_Splashr.gif',
                      image: Paths.Provider_Images + Service_Provider_Image,
                      fit: BoxFit.cover,
                    )),
              ),
            ];
          },
          body: Provider_Body(Provider_ID:Sercice_Provider_ID),
        ),
      ),



    );
  }
}

/// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class Provider_Body extends StatefulWidget {

  Provider_Body({required this.Provider_ID});
  late final String Provider_ID;
  @override
  State<Provider_Body> createState() => _Provider_BodyState();
}

class _Provider_BodyState extends State<Provider_Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ContainerText(),


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
                dgitems(state: "",picture: "images/StateService/stratr.png",lable: "جميع الخدمات",providerID:widget.Provider_ID),
                    dgitems(state: "تحتاج عروض سعر",picture: "images/StateService/finish.png",lable: "الخدمات التي تحتاج عروض سعر",providerID:widget.Provider_ID),
                    dgitems(state: "في المقابلة",picture: "images/StateService/waiting.png",lable: "خدمات في مرحلة المقابلة",providerID:widget.Provider_ID),
                    dgitems(state: "قيد التنفيذ",picture: "images/StateService/continu.png",lable: "الخدمات المستمرة",providerID:widget.Provider_ID),
                    dgitems(state: "انتهت",picture: "images/StateService/finish.png",lable: "الخدمات المنتهية",providerID:widget.Provider_ID),
                    dgitems(state: "تم الإلغاء",picture: "images/StateService/finish.png",lable: "الخدمات الملغية",providerID:widget.Provider_ID),

                    SizedBox(height: 300)
                  ],

                )
              ],
            ),
          ),
        ],
      ),
    );
  }
  ContainerText() {
    return Container(
        height: 50,
        width: Size.infinite.width,
        //margin: EdgeInsets.only(right: 20),
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 1.5, // 30 px padding
          vertical: kDefaultPadding / 5, // 5 px padding
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white12, Colors.deepPurple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: Colors.red.withOpacity(.3),
                  spreadRadius: 5,
                  blurRadius: 2,
                  offset: Offset(0, 1))
            ]),
        // decoration: BoxDecoration(
        //   color: color,
        //   borderRadius: BorderRadius.circular(22),
        // ),

            child: Center(
              child: RichText(
                text: TextSpan(
                    style: //Theme.of(context).textTheme.headline6,
                    TextStyle(color: backgroundColor, fontSize: 24),
                    children: [
                      TextSpan(text: "الخدمات"),
                    ]),
              ),
            ),
          );
  }
}

class dgitems extends StatelessWidget {
  const dgitems({required this.state,required this.picture,required this.lable,required this.providerID

  }) ;
final String state;
  final String picture;
  final String lable;
  final String providerID;
  Future get_all_requst(String _Provider_ID,String state) async {
    print(state);
    Uri url =Uri.parse(Paths.provider_requst+"get_all_requst_provider.php");
    var data = {
      "ID_Provider":_Provider_ID,
      "state":state,
    };
    var response = await http.post(url , body: data ) ;
    var responsebody = jsonDecode(response.body) ;
    print("**************");
    print(responsebody.length);
    print(responsebody.length);
    print(responsebody.length);
    print("**************");
if(responsebody.length==0)
{
  Get.to(Provider_Home_Body(Provider_ID:providerID,state:state,found:true,Area: "1",));
}

else
  {
    Get.to(Provider_Home_Body(Provider_ID:providerID,state:state,found:false,Area: "1",));
  }


  }
  Future get_all_requst_need_offers(String _Provider_ID,String state) async {
    print(state+"111111111111111111");
    Uri url =Uri.parse(Paths.provider_requst+"get_area_for_get_requst_offers_provider.php");
    var data = {
      "ID_Provider":_Provider_ID,
    };
    var response = await http.post(url , body: data ) ;
    var responsebody = jsonDecode(response.body) ;

    String Area=responsebody[0]["Areas_ID_Father"];

    Uri url2 =Uri.parse(Paths.provider_requst+"get_requst_provider_that_need_offers.php");
    var data2 = {
      "ID_Provider":_Provider_ID,
      "Area":Area
    };
    var response2 = await http.post(url2 , body: data2 ) ;
    var responsebody2 = jsonDecode(response2.body) ;

    if(responsebody2.length==0)
    {
      Get.to(Provider_Home_Body(Provider_ID:providerID,state:state,found:true,Area: Area,));
    }

    else
    {
      Get.to(Provider_Home_Body(Provider_ID:providerID,state:state,found:false,Area: Area,));
    }

  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
    textDirection: TextDirection.rtl,
        child:
        Container(
          margin: EdgeInsets.symmetric(


          ),
          height: 190.0,
          child: InkWell(
            onTap: (){
              print("**********"+state);
              if(state=="تحتاج عروض سعر")
                {

                  get_all_requst_need_offers(providerID, state);
                }
              else
              {
                get_all_requst(providerID, state);
              }
            },
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [

                Container(
                  height: 200.0,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    gradient: LinearGradient(
                        colors: [facebookColor,kBlueColor],
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
child: Image.asset(picture),

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

                                  TextSpan(text: lable)

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
