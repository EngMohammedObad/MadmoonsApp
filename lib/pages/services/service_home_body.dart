
import 'package:flutter/material.dart';
import 'package:madmooon/pages/services/models/Services.dart';
import 'package:madmooon/pages/services/services_items.dart';
import '../../colors.dart';

class Service_Home_Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                FutureBuilder(
                    future: get_all_Services(),
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
                                ServiceCard(
                                  Service_Number: snapshot.data[index]["Service_Number"],
                                  Service_Name: snapshot.data[index]["Service_name"],
                                  Service_Detailes: snapshot.data[index]["Service_Details"],
                                  Service_Image: snapshot.data[index]["Service_Image"],
                                  Servise_Sub_Title: snapshot.data[index]["Servise_Sub_Title"],

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
    );
  }
}
