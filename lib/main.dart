import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:madmooon/colors.dart';
import 'package:madmooon/pages/home.dart';
import 'package:madmooon/pages/splach_screan.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  Get.testMode = true;
  runApp( MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}



class MyApp extends StatelessWidget {


  @override


  Widget build(BuildContext context) {
    return
      MultiProvider(

          providers: [
            ChangeNotifierProvider(create: (context) {
              return ProvGlobal();
            }),
            ChangeNotifierProvider(create: (context) {
              return ProvOne();
            })
          ],
          child:
          GetMaterialApp

            (

            localizationsDelegates: [
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],

            supportedLocales: [Locale("ar", "AE")],
            locale: Locale("ar", "AE"),

            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'Almarai',),
            darkTheme: ThemeData.dark(), // standard dark theme
            themeMode: ThemeMode.system, //
            color: Colors.white,
            // Start
            title: "Madmun",

            //home: ChooseCountry(),
            home:


            Splach_Screen(),
            routes: {
              'Home': (context) {
                return Home();
              },

            },
            // End

          ));
  }
}
class ProvGlobal with ChangeNotifier {
  String country = "syria";
  pricecountry_sy() {
    country = "syria";
    notifyListeners();
  }

  pricecountry_eg() {
    country = "egypt";
    notifyListeners();
  }

  pricecountry_sa() {
    country = "sadui";
    notifyListeners();
  }
}
class ProvOne with ChangeNotifier {
  String name = "wael" ;
  changename (){
    name = "basel" ;
    notifyListeners() ;
  }
}