import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../paths.dart';
Future get_all_requst(String ID_Customer,String state) async {
  Uri url;
  print("**************************999"+state);
  if(state=="تم الطلب")
  {
    url=  Uri.parse(Paths.Requst_Service+"get_requst_on_requst_for_customer.php");
  }
else { url = Uri.parse(Paths.Requst_Service + "get_requst_customer.php");}
  var data = {
    "ID_Customer":ID_Customer
    , "state":state,
  };
  var response = await http.post(url , body: data ) ;
  var responsebody = jsonDecode(response.body) ;
  return responsebody ;
}
Future get_all_stages_for_requst(String Requst_Service_ID) async {
  Uri url =Uri.parse(Paths.Stages_Server+"get_all_stages_for_one_requst.php");
  var data = {
    "Requst_Service_ID":Requst_Service_ID
  };
  var response = await http.post(url , body: data ) ;
  var responsebody = jsonDecode(response.body) ;
  return responsebody ;
}
add_interview(String Requst_Number  ,String Location_Interview,String Interview_DateAndTime,String ID_Provider )
async {


    Uri url =Uri.parse(Paths.Requst_Service+"add_interview.php");
    var data = {
      "Requst_Number":Requst_Number,
      "Location_Interview": Location_Interview,
      "Interview_DateAndTime":Interview_DateAndTime.toString(),
      "ID_Provider": ID_Provider
    };print("fffffffffffffffffffffffff");
    print(Requst_Number+"6666666666666666666");
    print("fffffffffffffffffffffffff");
    print(Location_Interview+"9999999999999999999999");
    print("fffffffffffffffffffffffff");
    print(ID_Provider);
    print("fffffffffffffffffffffffff");
    print(Interview_DateAndTime+"9");
    var response = await http.post(url , body: data ) ;
    var responsebody = jsonDecode(response.body) ;

    if (responsebody['status'] == "success") {
      print("yes success");

    } else {
      print(responsebody['status']);

    }

}
update_requst_state(String Requst_Number ) async {


  Uri url =Uri.parse(Paths.Requst_Service+"update_requst_state.php");
  var data = {
    "Requst_Number":Requst_Number,
    "Requst_State":"في المقابلة"
  };
  print(Requst_Number);
  var response = await http.post(url, body: data);
  var responsebody = jsonDecode(response.body);

  if (responsebody['status'] == "success") {
    print("yes success");

  } else {
    print(responsebody['status']);

  }

}