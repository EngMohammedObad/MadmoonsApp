
import 'package:flutter/material.dart';
import 'package:madmooon/pages/requst_service/requst_items.dart';
import 'package:madmooon/pages/services/services_items.dart';

import '../../colors.dart';
import '../../compount/appBar.dart';
import 'models/requst.dart';

class Requst_Home_Body extends StatefulWidget {
  const Requst_Home_Body({
    required this. Representatives_ID,
    required this. Areas_ID,
    required this. state,

  }) ;
  final String Representatives_ID;
  final String Areas_ID;
  final String state;
  @override
  State<Requst_Home_Body> createState() => _Requst_Home_BodyState();
}

class _Requst_Home_BodyState extends State<Requst_Home_Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar("الطلبات"),
      backgroundColor: kTextColor ,
      body: Column(
        children: [
          SizedBox(height: kDefaultPadding / 2),
          Expanded(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 70.0),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                FutureBuilder(
                    future: get_all_requst(widget.Representatives_ID,widget.Areas_ID,widget.state),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                            itemBuilder: (BuildContext context, index) {
                             return
                               RequstCard(
                                 Cusotmer_Image: snapshot.data[index]["Cusotmer_Image"],
                                 Customer_Name: snapshot.data[index]["Customer_Name"],
                                 Areas_Name: snapshot.data[index]["Areas_Name"],
                                 Requst_DataTime: snapshot.data[index]["Requst_DataTime"],
                                 Requst_Service_ID: snapshot.data[index]["Requst_Service_ID"],
                                 Service_Number: snapshot.data[index]["Service_Number"],
                                 Service_Name: snapshot.data[index]["Service_name"],
                                 Service_Image: snapshot.data[index]["Service_Image"],
                                 Requst_State: snapshot.data[index]["Requst_State"],
                                 Requst_Service_ALL_Details: snapshot.data[index]["Requst_Service_ALL_Details"],
                                 Customer_Phone_Number: snapshot.data[index]["Customer_Phone_Number"],


                                    );
                            });
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      )
                      ;
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
