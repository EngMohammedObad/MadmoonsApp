// To parse this JSON data, do
//
//     final postmodel = postmodelFromJson(jsonString);

import 'dart:convert';

List<Postmodel> postmodelFromJson(String str) => List<Postmodel>.from(json.decode(str).map((x) => Postmodel.fromJson(x)));

String postmodelToJson(List<Postmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Postmodel {
  Postmodel({
   required this.Cusotmer_Image,
    required this.Customer_Name,
    required  this.Areas_Name,
    required this.Requst_DataTime,
    required this.Requst_Service_ID,
    required this.Service_Number,
    required  this.Service_name,
    required this.Service_Image,
    required this.Requst_State,
    required this.Requst_Service_ALL_Details,
    required this.Customer_Phone_Number,
    required this.Sercice_Provider_ID,
    required this.Service_Provider_Name,
    required this.Sercice_Provider_Phone,
    required this.last_update,
  });

  final  String Cusotmer_Image;
  final String Customer_Name;
  final String Areas_Name;
  final  String Requst_DataTime;
  final   String Requst_Service_ID;
  final String Service_Number;
  final String Service_name;
  final String Service_Image;
  final  String Requst_State;
  final String Requst_Service_ALL_Details;
  final String last_update;
  final String Sercice_Provider_ID;
  final String Service_Provider_Name;
  final  String Sercice_Provider_Phone;
  final String Customer_Phone_Number;

  factory Postmodel.fromJson(Map<String, dynamic> json) => Postmodel(
    Cusotmer_Image: json["Cusotmer_Image"],
    Customer_Name: json["Cusotmer_Image"],
    Areas_Name: json["Cusotmer_Image"],
    Requst_DataTime: json["Cusotmer_Image"],

    Requst_Service_ID: json["Cusotmer_Image"],
    Service_Number: json["Cusotmer_Image"],
    Service_name: json["Cusotmer_Image"],
    Service_Image: json["Cusotmer_Image"],


    Requst_State: json["Cusotmer_Image"],
    Requst_Service_ALL_Details: json["Cusotmer_Image"],
    last_update: json["Cusotmer_Image"],

    Sercice_Provider_ID: json["Cusotmer_Image"],
    Service_Provider_Name: json["Cusotmer_Image"],
    Sercice_Provider_Phone: json["Cusotmer_Image"],
    Customer_Phone_Number: json["Cusotmer_Image"],
  );

  Map<String, dynamic> toJson() => {
    "Cusotmer_Image": Cusotmer_Image,
    "Customer_Name": Cusotmer_Image,
    "Areas_Name": Cusotmer_Image,
    "Requst_DataTime":Cusotmer_Image,

    "Requst_Service_ID": Cusotmer_Image,
    "Service_Number": Cusotmer_Image,
    "Service_name": Cusotmer_Image,
    "Service_Image": Cusotmer_Image,


    "Requst_State": Cusotmer_Image,
    "Requst_Service_ALL_Details":Cusotmer_Image,
    "last_update": Cusotmer_Image,

    "Sercice_Provider_ID": Cusotmer_Image,
    "Service_Provider_Name": Cusotmer_Image,
    "Sercice_Provider_Phone": Cusotmer_Image,
    "Customer_Phone_Number": Cusotmer_Image,
  };
}
