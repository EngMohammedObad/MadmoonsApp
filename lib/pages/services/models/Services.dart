import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../../paths.dart';

// class Service {
//   final int
//   Service_Number;
//   final String Service_Name, Service_Detailes, Service_Image;
//
//   Service(
//       {required this.
//       Service_Number,
//       required this.Service_Name,
//       required this.Service_Detailes,
//       required this.Service_Image});
// }

Future get_all_Services() async {
  Uri url =
  Uri.parse(Paths.php_files_Servisec);
  final response = await http.get(url);
  var responsebody = jsonDecode(response.body);
  print(responsebody);
  return responsebody;

}
// list of products
//var Services = get_all_Services() ;
DateTime now = DateTime.now();
String formattedDate =DateFormat("yyyy-MM-dd HH:mm:ss").format(now);// DateFormat('yyyy-MM-dd – kk:mm').format(now);

