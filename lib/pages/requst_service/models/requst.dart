import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../paths.dart';
Future get_all_requst(String Representatives_ID,String Areas_ID,String Requst_State) async {
  Uri url =Uri.parse(Paths.Requst_Service+"get_all_requst.php");
  var data = {
    "Representatives_ID":Representatives_ID,
    "Areas_ID": Areas_ID,
    "Requst_State": Requst_State,
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