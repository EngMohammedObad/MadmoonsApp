import 'dart:async';


import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../../../../paths.dart';
import '../model/postmodel.dart';

class Services {
  Future<List<Postmodel>> getallposts() async {
    var data = {
      "ID_Customer": "1"
      , "state": "تم الطلب",
    };
    Uri url = Uri.parse(Paths.Requst_Service + "get_requst_on_requst_for_customer.php");
    var response = await http

        .post(url, body: data)
        .timeout(const Duration(seconds: 10), onTimeout: () {
      throw TimeoutException("connection time out try agian");
    });

    List jsonresponse = convert.jsonDecode(response.body);
    return jsonresponse.map((e) => new Postmodel.fromJson(e)).toList();
  }
}