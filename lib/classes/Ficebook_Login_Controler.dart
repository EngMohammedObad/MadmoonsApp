// import 'dart:js';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class Ficebook_Login_Controler with ChangeNotifier {
//   Map? userDate;
//   Login() async {
//     var result =
//         await FacebookAuth.i.login(permissions: ["public_profile", "email"]);
//     if (result.status == LoginStatus.success) {
//       final requestData = await FacebookAuth.i.getUserData(
//         fields: "email,name,picture",
//       );
//       userDate = requestData;
//       notifyListeners();
//     }
//   }
//
//   logout() async {
//     await FacebookAuth.i.logOut();
//     userDate = null;
//     notifyListeners();
//   }
// }
//
// LoginUi() {
//   return Consumer<Ficebook_Login_Controler>(builder: (context, model, child) {
//     if (model.userDate != null) {
//       return Center(
//         child: LogidinUi(model),
//       );
//     } else
//       return loginControlers(context);
//   });
// }
//
// LogidinUi(Ficebook_Login_Controler model) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center ,
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       // CircleAvatar(
//       //                 backgroundImage: Image.network(src),
//       // )
//       Text(model.userDate!["name"]??'')   ,
//       Text(model.userDate!["email"]??'')   ,
//       ActionChip(
//         avatar: Icon(Icons.logout),
//         label: Text("Logout"),
//         onPressed: (){
//           Provider.of<Ficebook_Login_Controler>(context,listen: false) .logout();
//         },
//       )
//     ],
//   );
// }
