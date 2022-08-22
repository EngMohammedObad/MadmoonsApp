import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:madmooon/compount/bottom_navigationBar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:madmooon/compount/mydrawer.dart';
import 'package:madmooon/colors.dart';
import 'package:madmooon/pages/services/models/Services.dart';
import 'package:madmooon/pages/services/services_items.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../paths.dart';
import 'Notifaction/notifactionCustomer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    await Firebase.initializeApp();

    print("Handling a background message: ${message.messageId}");
  }
  count_notification(String Notifaction_Owner_Type,String Notifaction_Owner_ID ) async {
    Uri url =Uri.parse(Paths.Notification+"count_notification.php");
    var data = {
      "Notifaction_Owner_Type":Notifaction_Owner_Type,
      "Notifaction_Owner_ID":Notifaction_Owner_ID
    };

    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);

    setState(() {
      CountnotifiStringServer=responsebody[0]["Count"];
      CountNotifiIntSetver=int.parse(CountnotifiStringServer);
    });
   print("CountNotifiIntSetver"+CountNotifiIntSetver.toString());
    print("CountNotifiIntSetver"+CountNotification.toString());
  }
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {

      CountNotifiPref = preferences.getString("CountNotification")!;
     // Sercice_Provider_ID = preferences.getString("Sercice_Provider_ID")!;
      CountNotification=int.parse(CountNotifiPref);
      CustomerID = preferences.getString("ID_Customer")!;
    });
  }
  savePrefProvider() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("CountNotification", CountNotifiIntSetver.toString());
    setState(() {
      CountNotification=CountNotifiIntSetver;
    });
  }
  String CustomerID = "";
  String CountNotifiPref="";
  int CountNotification=0;
  int CountNotifiIntSetver=0;
  String CountnotifiStringServer="";
  String Sercice_Provider_ID="";
  void initState() {
    getPref();

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("onMessage data: ${message.data}");
      print('onMessageOpenedApp data:onMessageOpenedApp data:');
      print('onMessageOpenedApp data:onMessageOpenedApp data:');
      print('onMessageOpenedApp data:onMessageOpenedApp data:');
      print('onMessageOpenedApp data:onMessageOpenedApp data:');
      print('onMessageOpenedApp data:onMessageOpenedApp data:');
    });
    FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
      print("onMessage data: ${message.data}");

      print('onMessageOpenedApp data:onMessageOpenedApp data:');
      print('onMessageOpenedApp data:onMessageOpenedApp data:');
      print('onMessageOpenedApp data:onMessageOpenedApp data:');
      print('onMessageOpenedApp data:onMessageOpenedApp data:');
      print('onMessageOpenedApp data:onMessageOpenedApp data:');
    });

    // replacement for onResume: When the app is in the background and opened directly from the push notification.


    if(CustomerID=="")
    {
      count_notification("Customer", CustomerID);
    }
    else if(Sercice_Provider_ID!="")
    {
      count_notification("Representatives", Sercice_Provider_ID);
    }
  }

  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;
    var mhe = MediaQuery.of(context).size.height;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          //backgroundColor: Colors.deepPurple,
          // appBar: AppBar(
          //
          //   centerTitle: true,
          //   title: Center(
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Text("مضمون"),
          //
          //         Container(
          //           margin: EdgeInsets.all(5),
          //           width: 45,
          //           height: 45,
          //           decoration: BoxDecoration(
          //             shape: BoxShape.circle,
          //             image: DecorationImage(
          //                 image: AssetImage('images/Splach_Screen/splash.png'),
          //                 fit: BoxFit.cover),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          //   backgroundColor: Colors.white,
          //  // elevation: 0,
          //   actions: <Widget>[
          //     IconButton(
          //         icon: Icon(
          //           Icons.circle_notifications,
          //           color: kBackgroundColor,
          //         ),
          //         onPressed: () {}),
          //   ],
          //
          // ),
          bottomNavigationBar: bottom_NavigationBar(home: 0),
          drawer: Mydrawer(),
          body: Container(
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                Container(
                  //margin: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    // image: DecorationImage(
                    //     image: AssetImage('images/bakcground/bw.jpg'),
                    //     fit: BoxFit.cover),
                    color: Colors.white,
                  ),
                ),

                //Slaidd(MediaQuery.of(context).size.width,MediaQuery.of(context).size.height,),
                ListView(children: <Widget>[
                  //Start for CarouselOptions

                  Container(
                    margin: EdgeInsets.only(top: mhe / 8),
                    height: mhe / 4.7,

                    width: double.infinity,
                    child: CarouselSlider(
                      options: CarouselOptions(
                          enlargeCenterPage: true,
                          enableInfiniteScroll: false,
                          autoPlay: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              activeIndexes = index;
                            });
                          }),
                      items: imageList
                          .map((e) => ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        color: kBackgroundColor,
                                        borderRadius:
                                            BorderRadius.circular(1.0),
                                        // color: Colors.teal,
                                        border: Border.all(
                                          width: 3.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      child: Image.asset(
                                        e,
                                        width: mdw / 2,
                                        height: mhe / 2,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                    ),

                    //// End CarouselSlider
                  ),

                  SizedBox(height: 3),
                  Center(child: buildindicator()),
                  Container(
                    margin: EdgeInsets.only(top: 10, right: 20),
                    child: Text(
                      "الخدمات التي نقدمها",
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  )
                ]),
                Column(
                  children: [
                    SizedBox(height: mhe / 2.45),
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: FutureBuilder(
                                future: get_all_Services(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    dynamic snap = snapshot.data;
                                    return GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                //   childAspectRatio: 6 / 3,
                                                crossAxisSpacing: 2,
                                                mainAxisSpacing: 10),
                                        itemCount: snap.length,
                                        itemBuilder:
                                            (BuildContext context, index) {
                                          return ServiceCard(
                                            Service_Number: snapshot.data[index]
                                                ["Service_Number"],
                                            Service_Name: snapshot.data[index]
                                                ["Service_name"],
                                            Service_Detailes: snapshot
                                                .data[index]["Service_Details"],
                                            Service_Image: snapshot.data[index]
                                                ["Service_Image"],
                                            Servise_Sub_Title:
                                                snapshot.data[index]
                                                    ["Servise_Sub_Title"],
                                          );
                                        });
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                    height: mhe / 6,
                    decoration: new BoxDecoration(
                      color: kPrimaryColor2,
                      boxShadow: [new BoxShadow(blurRadius: 2.0)],
                      borderRadius: new BorderRadius.vertical(
                          bottom: new Radius.elliptical(
                              MediaQuery.of(context).size.width, 20.0)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                margin: EdgeInsets.only(right: 10),
                                child: InkWell(
                                  child: Icon(
                                    Icons.menu_open_rounded,
                                    color: Colors.white,
                                  ),
                                )),
                            InkWell(
                              child:  Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child:
                                  CountNotifiIntSetver>=1?Icon(
                                    Icons.notifications_active_rounded,
                                    color:CountNotification<CountNotifiIntSetver&&CountNotifiIntSetver>0? Colors.redAccent:Colors.white,
                                  ):SizedBox(height: 0,)
                              ),onTap: (){
                              savePrefProvider();
                              Get.to(NotifactionCustomer());


                            },),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Text(
                                      "مرحباٌ بك",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white),
                                    )),
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: InkWell(
                                      child: Container(
                                        margin: EdgeInsets.only(right: 50),
                                        child: Text(
                                          "في تطبيق مضمون",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w100,
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}

// ListView Slaidd(double width,double heigh) {
//   return ListView(children: <Widget>[
//     //Start for CarouselOptions
//
//     Container(
//       margin: EdgeInsets.only(top: 10),
//       height: 150,
//       width: double.infinity,
//       child: CarouselSlider(
//         options: CarouselOptions(
//           enlargeCenterPage: true,
//           enableInfiniteScroll: false,
//           autoPlay: true,
//           onPageChanged: (index,reason){
//             setState(() {
//
//             });
//           }
//
//         ),
//         items: imageList
//             .map((e) => ClipRRect(
//           borderRadius: BorderRadius.circular(8),
//           child: Stack(
//             fit: StackFit.expand,
//             children: <Widget>[
//               Image.asset(
//
//                  e,
//                 width: 200,
//                 height: 150,
//                 fit: BoxFit.cover,
//               )
//               ,
//             ],
//           ),
//         ))
//             .toList(),
//
//       ),
//
//       //// End CarouselSlider
//     ),
//     SizedBox(height: 32,),
//     buildindicator(),
//   ]);
// }
int activeIndexes = 0;
Widget buildindicator() => AnimatedSmoothIndicator(
      count: imageList.length,
      activeIndex: activeIndexes,
      effect: WormEffect(activeDotColor: kPrimaryColor2, dotColor: Colors.grey),
    );
final List<String> imageList = [
  "images/slide/img8.jpg",
  "images/slide/img13.jpg",
  // "images/slide/img18.jpg",
  // "images/slide/img23.jpg",
  // "images/slide/img28.jpg",
  // "images/slide/img34.jpg",
  // "images/slide/img39.jpg",
  // "images/slide/img34.jpg",
  // "images/slide/img49.jpg",
  // "images/slide/img54.jpg",
  // "images/slide/img59.jpg",
  // "images/slide/img64.jpg",
  // "images/slide/img69.jpg",
  // "images/slide/img74.jpg",
  // "images/slide/img79.jpg",
  // "images/slide/img84.jpg",
  // "images/slide/img89.jpg",
  // "images/slide/img94.jpg",
  // "images/slide/img99.jpg",
  // "images/slide/img104.jpg",
  // "images/slide/img109.jpg",
  // "images/slide/img114.jpg",
  // "images/slide/img119.jpg",
  "images/slide/img124.jpg",
  "images/slide/img129.jpg",
  "images/slide/img134.jpg",
  "images/slide/img139.jpg",
  "images/slide/img145.jpg",
  "images/slide/img150.jpg",
  "images/slide/img180.jpg",
  "images/slide/img185.jpg",
  "images/slide/img192.jpg",
  "images/slide/img195.jpg",
];
