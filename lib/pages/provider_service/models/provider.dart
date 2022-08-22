import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../paths.dart';
Future get_all_requst_provider(String _Provider_ID,String state,String Area) async {
  print(state+"222222222222222");
if(state!="تحتاج عروض سعر")
  {
    Uri url =Uri.parse(Paths.provider_requst+"get_all_requst_provider.php");
    var data = {
      "ID_Provider":_Provider_ID,
      "state":state,
    };
    var response = await http.post(url , body: data ) ;
    var responsebody = jsonDecode(response.body) ;

    return responsebody ;
  }
else{
  Uri url =Uri.parse(Paths.provider_requst+"get_area_for_get_requst_offers_provider.php");
  var data = {
    "ID_Provider":_Provider_ID,
  };
  var response = await http.post(url , body: data ) ;
  var responsebody = jsonDecode(response.body) ;

  String Area=responsebody[0]["Areas_ID_Father"];

  Uri url2 =Uri.parse(Paths.provider_requst+"get_requst_provider_that_need_offers.php");
  var data2 = {
    "ID_Provider":_Provider_ID,
    "Area":Area
  };
  var response2 = await http.post(url2 , body: data2 ) ;
  var responsebody2 = jsonDecode(response2.body) ;
return responsebody2;
}
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