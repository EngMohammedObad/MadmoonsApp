import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:madmooon/pages/Customer/Customer_home_body.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../paths.dart';
import '../../colors.dart';
import '../../compount/bottom_navigationBar.dart';
import '../../compount/close .dart';
import '../../compount/mydrawer.dart';
import 'package:get/get.dart';


class Customer extends StatefulWidget {
  const Customer({Key? key

  }) : super(key: key);

  @override
  _CustomerState createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
  String? ID_Customer = "";
  String? Customer_Name = "";
  String? Cusotmer_Image = "";
  String? Customer_Kind_Account = "";
  String? Custmer_Account = "";
  String? Type = "";
  String? mytoken = "";
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      ID_Customer = preferences.getString("ID_Customer");
      Customer_Name = preferences.getString("Customer_Name");
      Cusotmer_Image = preferences.getString("Cusotmer_Image");
      Customer_Kind_Account = preferences.getString("Customer_Kind_Account");
      Custmer_Account = preferences.getString("Custmer_Account");
      Type = preferences.getString("Type");
      mytoken = preferences.getString("mytoken");
    });
  }
  // Future get_all_requst1(String ID_Customer, String state) async {
  //   Uri url;
  //   if (state == "تم الطلب") {
  //     url = Uri.parse(
  //         Paths.Requst_Service + "get_requst_on_requst_for_customer.php");
  //   } else {
  //     url = Uri.parse(Paths.Requst_Service + "get_requst_customer.php");
  //   }
  //
  //   var data = {
  //     "ID_Customer": ID_Customer,
  //     "state": state,
  //   };
  //   var response = await http.post(url, body: data);
  //   var responsebody = jsonDecode(response.body);
  //   print("****************" + responsebody.length.toString());
  //   print(state);
  //   print(ID_Customer);
  //   if (responsebody.length == 0) {
  //     setState(() {
  //       found1 = true;
  //     });
  //   } else {
  //     setState(() {
  //       found1 = false;
  //     });
  //   }
  // }
  @override
  void initState() {
    getPref();
    ID_Customer;
    Customer_Name;
    Cusotmer_Image;
    Customer_Kind_Account;
    Custmer_Account;
    Type;
    mytoken;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: bottom_NavigationBar(
        home: 1,
      ),
      drawer: Mydrawer(),
      endDrawer: Center(
        child: Container(
            child: InkWell(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(color: backgroundColor, fontSize: 30),
                        children: [
                          TextSpan(text: "خروج"),
                        ]),
                  ))),
          onTap: () {
            Navigator.pop(context);
            showLexit(context);
          },
        )),
      ),
      body: Customer_Body(
        Customer_ID: ID_Customer!
      ),
    );
  }
}

class Customer_Body extends StatefulWidget {
  Customer_Body({Key? key,

  required this.Customer_ID,
})  : super(key: key);

  final String Customer_ID;

  @override
  State<Customer_Body> createState() => _Customer_BodyState();
}

class _Customer_BodyState extends State<Customer_Body> {

  @override
  void initState() {

    super.initState();
    // enterFullScreen(FullScreenMode.EMERSIVE_STICKY);
  }


  @override
  Widget build(BuildContext context) {
    double wi = MediaQuery.of(context).size.width;
    double he = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 6,
      child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                new SliverAppBar(backgroundColor: Colors.white,
                  title: Center(child: Text('طلباتي',style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.bold),)),
                  pinned: true,
                  floating: true,
                  bottom: TabBar(
                   labelPadding: EdgeInsets.only(left: 5,bottom: 5),
                    indicatorWeight: 3,
                    indicatorColor: kPrimaryColor2,
                    labelColor: Colors.black,
                    automaticIndicatorColorAdjustment: true,
                    indicatorSize: TabBarIndicatorSize.tab,

                    //padding: EdgeInsets.all(3),
                    // indicatorWeight: 10,

                    isScrollable: true,
                    tabs: [
                    TabContainer("جميع الخدمات"),
                      TabContainer("خدمات في مرحلة الطلب"),
                      TabContainer("خدمات في مرحلة المقابلة"),
                      TabContainer("الخدمات المستمرة"),
                      TabContainer("الخدمات المنتهية"),
                      TabContainer("الخدمات الملغية"),

                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: <Widget>[
                Customer_Home_Body(
                  ID_Customer: widget.Customer_ID,
                  state: "",
                  found: false,
                ),
                Customer_Home_Body(
                  ID_Customer: widget.Customer_ID,
                  state: "تم الطلب",
                  found:false,
                ),
                Customer_Home_Body(
                  ID_Customer: widget.Customer_ID,
                  state: "في المقابلة",
                  found:false,
                ),
                Customer_Home_Body(
                  ID_Customer: widget.Customer_ID,
                  state: "قيد التنفيذ",
                  found: false,
                ),
                Customer_Home_Body(
                  ID_Customer: widget.Customer_ID,
                  state: "انتهت",
                  found: false,
                ),
                Customer_Home_Body(
                  ID_Customer: widget.Customer_ID,
                  state: "تم الإلغاء",
                  found:false,
                ),
              ],
            ),
          )),
    );
  }

  Container TabContainer(String text) {
    return Container(

                  padding: EdgeInsets.symmetric(
                    horizontal:  10 ,// 30 px padding
                    vertical:8, // 5 px padding
                  ),
                  decoration: BoxDecoration(
                    // border: Border.all(
                    //   width: 1.0,
                    //   color: kTextColor,
                    // ),
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child:Container(
                      child:
                      Center(child:  Text(text,style: TextStyle(color:Colors.grey,fontSize: 16)),)
                  ));
  }
}
