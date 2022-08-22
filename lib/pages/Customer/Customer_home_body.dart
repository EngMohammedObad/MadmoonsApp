import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../colors.dart';
import '../../compount/close .dart';
import '../../compount/mydrawer.dart';
import '../../paths.dart';
import 'Customer_items.dart';
import 'models/requst.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../../../paths.dart';
class Customer_Home_Body extends StatefulWidget {
  late final String ID_Customer;
  late final bool found;
  late final String state;
  Customer_Home_Body(
      {Key? key,
      required this.ID_Customer,
      required this.state,
      required this.found})
      : super(key: key);

  @override
  State<Customer_Home_Body> createState() => _Customer_Home_BodyState();
}

class _Customer_Home_BodyState extends State<Customer_Home_Body> {
  dynamic snap;
  Future count_requst_for_customer() async {
    Uri url;

    { url = Uri.parse(Paths.Requst_Service + "count_requst_for_customer.php");}
    print("*                  "+"                      *("+ID_Custome+")");

    var data = {
      "ID_Customer":ID_Custome
      , "Requst_State":widget.state,
    };
    var response = await http.post(url , body: data ) ;
    var responsebody = jsonDecode(response.body);
    print("*                  "+responsebody[0]["Count"]+"                      *("+ID_Custome+")");
    if(int.parse(responsebody[0]["Count"])<=1 )
    {
      setState((){
        fShowNotDataFound=false;
      });
    }
    else
    {
      setState((){
        fShowNotDataFound=true;
      });
    }
  }
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
setState((){ID_Custome = preferences.getString("ID_Customer")! ;
count_requst_for_customer();});
    //ID_Customer = preferences.getString("ID_Customer")! ;

  }
  String ID_Custome="";
  bool fShowNotDataFound=true;
  @override
  void initState() {

    super.initState();
    getPref();

  }
  @override
  Widget build(BuildContext context) {
    getxCustomerHomeBody crt = Get.put(getxCustomerHomeBody());
    crt.change(RxString(widget.ID_Customer), RxBool(widget.found), RxString(widget.state));
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Mydrawer(),
      endDrawer: Center(
        child: Container(
            child: InkWell(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      width: 3.0,
                      color: kTextColor,
                    ),
                  ),
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(color: backgroundColor, fontSize: 30),
                        children: [
                          TextSpan(text: "خروج"),
                        ]),
                  ))),
          onTap: () {
            Navigator.pop(context);
            showLexit(context);
          },
        )),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  fShowNotDataFound==false?Image.asset(crt.imag.toString()):SizedBox(height: 0,),
       Obx(() {
         return Container(
          child:   crt.Shwo==true?           Obx(() {
               return crt.state != "تم الطلب"
                   ? FutureBuilder(
                   future: get_all_requst(
                       crt.ID_Customer.toString(),
                       crt.state.toString()),
                   builder: (BuildContext context,
                       AsyncSnapshot snapshot) {
                     if (snapshot.hasData) {
                       snap = snapshot.data;
                       return ListView.builder(
                           shrinkWrap: true,
                           itemCount: snap.length,
                           itemBuilder:
                               (BuildContext context, index) {


                             return CustomerCard(
                               Cusotmer_Image: snapshot.data[index]
                               ["Cusotmer_Image"],
                               Customer_Name: snapshot.data[index]
                               ["Customer_Name"],
                               Areas_Name: snapshot.data[index]
                               ["Areas_Name"],
                               Requst_DataTime: snapshot
                                   .data[index]["Requst_DataTime"],
                               Requst_Service_ID:
                               snapshot.data[index]
                               ["Requst_Service_ID"],
                               Service_Number: snapshot.data[index]
                               ["Service_Number"],
                               Service_Name: snapshot.data[index]
                               ["Service_name"],
                               Service_Image: snapshot.data[index]
                               ["Service_Image"],
                               Requst_State: snapshot.data[index]
                               ["Requst_State"],
                               Requst_Service_ALL_Details: snapshot
                                   .data[index]
                               ["Requst_Service_ALL_Details"],
                               Customer_Phone_Number:
                               snapshot.data[index]
                               ["Customer_Phone_Number"],
                               Sercice_Provider_ID:
                               snapshot.data[index]
                               ["Sercice_Provider_ID"],
                               Service_Provider_Name:
                               snapshot.data[index]
                               ["Service_Provider_Name"],
                               Sercice_Provider_Phone:
                               snapshot.data[index]
                               ["Sercice_Provider_Phone"],
                               last_update: snapshot.data[index]
                               ["last_update"],
                               parent_state: widget.state,

                             );
                           });
                     }
                     return Center(
                       child: CircularProgressIndicator(),
                     );
                   })
                   : FutureBuilder(
                   future: get_all_requst(
                       crt.ID_Customer.toString(),
                       crt.state.toString()),
                   builder: (BuildContext context,
                       AsyncSnapshot snapshot) {
                     if (snapshot.hasData) {
                       dynamic snap = snapshot.data;
                       return ListView.builder(
                           shrinkWrap: true,
                           itemCount: snap.length,
                           itemBuilder:
                               (BuildContext context, index) {

                             return CustomerCard(
                               Cusotmer_Image: snapshot.data[index]
                               ["Cusotmer_Image"],
                               Customer_Name: snapshot.data[index]
                               ["Customer_Name"],
                               Areas_Name: snapshot.data[index]
                               ["Areas_Name"],
                               Requst_DataTime: snapshot
                                   .data[index]["Requst_DataTime"],
                               Requst_Service_ID:
                               snapshot.data[index]
                               ["Requst_Service_ID"],
                               Service_Number: snapshot.data[index]
                               ["Service_Number"],
                               Service_Name: snapshot.data[index]
                               ["Service_name"],
                               Service_Image: snapshot.data[index]
                               ["Service_Image"],
                               Requst_State: snapshot.data[index]
                               ["Requst_State"],
                               Requst_Service_ALL_Details: snapshot
                                   .data[index]
                               ["Requst_Service_ALL_Details"],
                               Customer_Phone_Number:
                               snapshot.data[index]
                               ["Customer_Phone_Number"],
                               Sercice_Provider_ID: "0",
                               Service_Provider_Name: "0",
                               Sercice_Provider_Phone: "0",
                               last_update: snapshot.data[index]
                               ["last_update"],
                               parent_state: widget.state,
                             );
                           });
                     }
                     return Center(
                       child: CircularProgressIndicator(),
                     );
                   });
             }):Image.asset(crt.imag.toString())
         );
       })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class getxCustomerHomeBody extends GetxController {


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
    var responsebody = jsonDecode(response.body) .obs;
    return responsebody ;
  }

   Map myCategoryDynamic = {} .obs;
  change(RxString? Customer, RxBool fo, RxString st) {
    ID_Customer = Customer;
    found = fo;
    state = st;
    fShow( true);



  }


fShow(bool shwo){
  Shwo.value=shwo;

  Shwo.value=shwo;



}
  RxString? nulles = "".obs;
  RxString? refrech = "".obs;
  RxBool found = false.obs;
  RxBool Shwo = true.obs;
  RxBool nodataimage = true.obs;
  RxString? ID_Customer = "".obs;
  RxString? state = "".obs;

  RxString? Customer_Name = "".obs;
  RxString? Cusotmer_Image = "".obs;
  RxString? Customer_Kind_Account = "".obs;
  RxString? Custmer_Account = "".obs;
  RxString? Type = "".obs;
  RxString? mytoken = "".obs;
  RxString? imag = "images/nodatafound.png".obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //ima.value="1";



  }


}
/// //////////////////////////////// test getx
