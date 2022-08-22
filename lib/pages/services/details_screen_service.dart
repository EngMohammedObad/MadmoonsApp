import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../colors.dart';
import 'details/details_body.dart';


String ID_Customer="";
String Customer_Name="";

class DetailsScreen extends StatefulWidget {


  const DetailsScreen({

    required this. Service_Number,
    required this.  Service_Name,
    required this. Service_Detailes,
    required this. Service_Image,
    required this.Servise_Sub_Title,

});




  final String Service_Number;
  final String Service_Name,Service_Detailes,Service_Image,Servise_Sub_Title;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  ///                 //////////
  getPref()async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var ID_Custom =preferences.getString("ID_Customer") ;
    var Customer_Nam =preferences.getString("Customer_Name") ;
    ID_Customer=ID_Custom! ;
    Customer_Name=Customer_Nam!;

  }

  ///                    /////////
  @override
  void initState() {

    getPref();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: detailsAppBar(context),
      body: DetailsBody(
        Service_Number:widget.Service_Number,
        Service_Name: widget.Service_Name,
        Service_Detailes: widget.Service_Detailes,
        Service_Image:     widget.Service_Image,
        Servise_Sub_Title: widget.Servise_Sub_Title,
        ID_Customer: ID_Customer,
        Customer_Name: Customer_Name,
      ),
    );
  }

  AppBar detailsAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor2,
      elevation: 0,
      leading: IconButton(
        padding: EdgeInsets.only(right: kDefaultPadding),
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: false,
      title: Text(
        '',
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
