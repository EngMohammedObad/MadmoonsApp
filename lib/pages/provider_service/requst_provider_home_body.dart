import 'package:flutter/material.dart';
import 'package:madmooon/pages/provider_service/provider_items.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../paths.dart';
import '../../colors.dart';
import '../../compount/bottom_navigationBar.dart';
import '../../compount/close .dart';
import '../../compount/mydrawer.dart';
import 'models/provider.dart';
import '../../../paths.dart';

class Provider_Home_Body extends StatefulWidget {
  Provider_Home_Body(
      {required this.Provider_ID, required this.state, required this.found,required this.Area});
  late final String Provider_ID;
  late final String state;
  late final bool found;
  late final String Area;
  @override
  State<Provider_Home_Body> createState() => _Provider_Home_BodyState();
}

class _Provider_Home_BodyState extends State<Provider_Home_Body> {
  String Sercice_Provider_ID = "";
  String Service_Provider_Name = "";
  String Service_Provider_ID_NO = "";
  String Service_Provider_Acount = "";
  String Sercice_Provider_Phone = "";
  String Service_Number = "";
  String Sercice_Provider_experience = "";
  String Service_Provider_Image = "";
  String Representatives_ID = "";
  String Sercice_Provider_Account_Type = "";
  String Service_Provider_Token = "";

  @override
  void initState() {
    getPref();

    widget.found;
    print("******************");
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
      Sercice_Provider_ID = preferences.getString("Sercice_Provider_ID")!;
      Service_Provider_Name = preferences.getString('Service_Provider_Name')!;
      Service_Provider_ID_NO = preferences.getString('Service_Provider_ID_NO')!;
      Service_Provider_Acount =
          preferences.getString('Service_Provider_Acount')!;
      Sercice_Provider_Phone = preferences.getString('Sercice_Provider_Phone')!;
      Service_Number = preferences.getString('Service_Number')!;
      Sercice_Provider_experience =
          preferences.getString('Sercice_Provider_experience')!;
      Service_Provider_Image = preferences.getString('Service_Provider_Image')!;
      Representatives_ID = preferences.getString('Representatives_ID')!;
      Sercice_Provider_Account_Type = preferences.getString('type')!;
      Service_Provider_Token = preferences.getString('mytoken')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTextColor,
      bottomNavigationBar: bottom_NavigationBar(home: 1),
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
      body: DefaultTabController(
        length: 1,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: kPrimaryColor,
                expandedHeight: 200.0,
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
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                SizedBox(height: kDefaultPadding / 2),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 70.0),
                        decoration: BoxDecoration(
                          color: kBackgroundColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                      ),
                      widget.found == true
                          ? Image.asset("images/nodatafound.png")
                          : FutureBuilder(
                              future: get_all_requst_provider(
                                  widget.Provider_ID.toString(),
                                  widget.state.toString(),widget.Area),
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
                                        return ProviderCard(
                                          Cusotmer_Image: snapshot.data[index]
                                              ["Cusotmer_Image"],
                                          Customer_Name: snapshot.data[index]
                                              ["Customer_Name"],
                                          Areas_Name: snapshot.data[index]
                                              ["Areas_Name"],
                                          Requst_DataTime: snapshot.data[index]
                                              ["Requst_DataTime"],
                                          Requst_Service_ID: snapshot
                                              .data[index]["Requst_Service_ID"],
                                          Service_Number: snapshot.data[index]
                                              ["Service_Number"],
                                          Service_Name: snapshot.data[index]
                                              ["Service_name"],
                                          Service_Image: snapshot.data[index]
                                              ["Service_Image"],
                                          Requst_State: snapshot.data[index]
                                              ["Requst_State"],
                                          Requst_Service_ALL_Details: snapshot
                                                  .data[index]
                                              ["Requst_Service_ALL_Details"],
                                          Customer_Phone_Number:
                                              snapshot.data[index]
                                                  ["Customer_Phone_Number"],
                                          Interview_DateAndTime:widget.state=="تحتاج عروض سعر"?"1":
                                              snapshot.data[index]
                                                  ["Interview_DateAndTime"]
                                          ,
                                          Location_Interview:widget.state=="تحتاج عروض سعر"?
                                          "1"
                                            :  snapshot.data[index]
                                                  ["Location_Interview"]
                                          ,
                                        );
                                      });
                                }
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
