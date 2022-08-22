import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../pages/home.dart';

void close() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.remove("ID_Customer");
  preferences.remove("Customer_Name");
  preferences.remove("Cusotmer_Image");
  preferences.remove("Customer_Kind_Account");
  preferences.remove("Custmer_Account");
  preferences.remove("type");
  preferences.remove("mytoken");
  preferences.remove('Sercice_Provider_ID' );
  preferences.remove('Service_Provider_Name');
  preferences.remove('Service_Provider_ID_NO' );
  preferences.remove('Service_Provider_Acount' );
  preferences.remove('Sercice_Provider_Phone');
  preferences.remove('Service_Number');
  preferences.remove('Sercice_Provider_experience');
  preferences.remove('Service_Provider_Image');
  preferences.remove('Representatives_ID');
  preferences.remove('Sercice_Provider_Account_Type');
  preferences.remove('Service_Provider_Token' );
  preferences.remove('CountNotification' );
  FirebaseAuth.instance.signOut();
  Get.off(Home());
}



showLexit(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor:Colors.transparent ,

          content: Container(


            width: MediaQuery.of(context).size.width,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:  Colors.grey.withOpacity(0.3),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("هل تريد تسجيل الخروج فعلا ؟",style: TextStyle(fontSize: 19,color: Colors.white),),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children:<Widget> [
                    RaisedButton(
                      color:  Colors.grey.withOpacity(0.2),
                      elevation: 10,
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: 40),
                      onPressed:(){
                        Navigator.pop(context);

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "لا",
                            style: TextStyle(
                                color: Colors.white, fontSize: 18),
                          )
                        ],
                      ),
                    ),Padding(padding: EdgeInsets.all(10))
                    ,RaisedButton(
                      color:  Colors.grey.withOpacity(0.2),
                      elevation: 10,
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      onPressed:(){
                        close();
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "نعـم",
                            style: TextStyle(
                                color: Colors.white, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ],
                )


              ],
            ),
          ),
        );
      });
}
