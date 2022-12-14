import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../colors.dart';
import 'details/details_body.dart';


String ID_Customer="";
String Customer_Name="";

class DetailsScreenprvider extends StatelessWidget {


  const DetailsScreenprvider({
    required this.Cusotmer_Image,
    required this.Customer_Name,
    required this.Areas_Name,
    required this.Requst_DataTime,
    required this.Requst_Service_ID,
    required this.Service_Number,
    required this.Service_Name,
    required this.Service_Image,
    required this.Requst_State,
    required this.Requst_Service_ALL_Details,
    required this.Customer_Phone_Number,
    required this.Interview_DateAndTime,
    required this. Location_Interview,
});
  final String Cusotmer_Image,Customer_Name,Areas_Name,Requst_DataTime,Requst_Service_ID,Customer_Phone_Number,Location_Interview;
  final String Service_Number,Service_Name,Requst_State,Service_Image,Requst_Service_ALL_Details,Interview_DateAndTime;

  ///                 //////////


  ///                    /////////
  @override
  void initState() {


  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: detailsAppBar(context),
      body: DetailsBodyProvider(
        Cusotmer_Image:Cusotmer_Image,
        Customer_Name:Customer_Name,
        Areas_Name:Areas_Name,
        Requst_DataTime:Requst_DataTime,
        Requst_Service_ID:Requst_Service_ID,
        Service_Number:Service_Number,
        Service_Name:Service_Name,
        Service_Image:Service_Image,
        Requst_State:Requst_State,
        Requst_Service_ALL_Details:Requst_Service_ALL_Details,
        Customer_Phone_Number:Customer_Phone_Number,
        Interview_DateAndTime:Interview_DateAndTime,
        Location_Interview: Location_Interview,
      ),
    );
  }

  AppBar detailsAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        padding: EdgeInsets.only(right: kDefaultPadding),
        icon: Icon(
          Icons.arrow_back,
          color: kPrimaryColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: false,
      title: Text(
        '????????',
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
