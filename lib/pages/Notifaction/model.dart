import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../../paths.dart';
get_Notifaction_Customer(String Notifaction_Owner_Type,String Notifaction_Owner_ID ) async {


  Uri url =Uri.parse(Paths.Notification+"get_Notifaction_Customer.php");
  var data = {
    "Notifaction_Owner_Type":Notifaction_Owner_Type,
    "Notifaction_Owner_ID":Notifaction_Owner_ID
  };

  var response = await http.post(url, body: data);
  var responsebody = jsonDecode(response.body);


return responsebody;
}
