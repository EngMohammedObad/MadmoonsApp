import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../colors.dart';

import 'model.dart';

class NotifactionCustomer extends StatefulWidget {
  const NotifactionCustomer({Key? key}) : super(key: key);

  @override
  State<NotifactionCustomer> createState() => _NotifactionCustomerState();
}

class _NotifactionCustomerState extends State<NotifactionCustomer> {
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      CustomerID = preferences.getString("ID_Customer")!;


    });
  }

  String CustomerID = "";

  @override
  void initState() {
    getPref();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black54),
          onPressed: () => Get.back(),
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "الإشعارات",
          style: TextStyle(
              color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder(
        future: get_Notifaction_Customer("Customer", CustomerID),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var snap = snapshot.data;
            return Column(
              children: <Widget>[
                for (int i = 0; i < snap.length; i++)
                  NotificatonCard(
                    Notifaction_Details: snapshot.data[i]
                        ["Notifaction_Details"],
                    Notifaction_ID: snapshot.data[i]["Notifaction_ID"],
                    Notifaction_ID_Type: snapshot.data[i]
                        ["Notifaction_ID_Type"],
                    Notifaction_Owner_Date: snapshot.data[i]
                        ["Notifaction_Owner_Date"],
                    Notifaction_Owner_ID: snapshot.data[i]
                        ["Notifaction_Owner_ID"],
                    Notifaction_Owner_Type: snapshot.data[i]
                        ["Notifaction_Owner_Type"],
                    Notifaction_Type: snapshot.data[i]["Notifaction_Type"],
                  )
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class NotificatonCard extends StatefulWidget {
  const NotificatonCard({
    required this.Notifaction_ID,
    required this.Notifaction_Type,
    required this.Notifaction_ID_Type,
    required this.Notifaction_Owner_ID,
    required this.Notifaction_Owner_Type,
    required this.Notifaction_Owner_Date,
    required this.Notifaction_Details,
  });

  final String Notifaction_ID,
      Notifaction_Type,
      Notifaction_ID_Type,
      Notifaction_Owner_ID,
      Notifaction_Owner_Type,
      Notifaction_Owner_Date,
      Notifaction_Details;

  @override
  State<NotificatonCard> createState() => _NotificatonCardState();
}

class _NotificatonCardState extends State<NotificatonCard> {
  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;
    var mhe = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Card(
        color: Colors.grey.shade100,
        child: Container(
          height: mhe / 8,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                height: mhe / 2,
                width: mdw / 8,
                margin: EdgeInsets.all(20),
                child: SvgPicture.asset(
                  "images/notification.svg",
                  color: kTextColor,
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Expanded(
                    child: Text(widget.Notifaction_Details)),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
