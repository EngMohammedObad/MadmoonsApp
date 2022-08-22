import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madmooon/paths.dart';

import '../../colors.dart';
import 'details_screen_service.dart';



class ServiceCard extends StatelessWidget {
  const ServiceCard({

    required this. Service_Number,
    required this.  Service_Name,
    required this. Service_Detailes,
    required this. Service_Image,
    required this. Servise_Sub_Title,

  });
  final String Service_Number;
  final String Service_Name,Service_Detailes,Service_Image,Servise_Sub_Title;

  @override
  Widget build(BuildContext context) {
    double wi = MediaQuery.of(context).size.width;
    double he = MediaQuery.of(context).size.width;
    return Directionality(
        textDirection: TextDirection.rtl,
        child:
        Center(
          child: Container(
            margin: EdgeInsets.only(right: 5,left: 5,top: 5,bottom: 5),
            decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              // color: Colors.teal,
              border: Border.all(
                width: 1.0,
                color: Colors.grey,
              ),
            ),


            padding: EdgeInsets.all(5),
      // margin: EdgeInsets.symmetric(
      //   horizontal: 20,
      //   vertical:  20,
      // ),

      child: InkWell(
          onTap: (){
Get.to(
    DetailsScreen(
          Service_Number: Service_Number,
          Service_Image:Service_Image ,
          Service_Name:Service_Name ,
          Servise_Sub_Title:Servise_Sub_Title ,
          Service_Detailes: Service_Detailes)
);



          },
          child: Column(
            // alignment: Alignment.bottomCenter,
            children: [
              Container(
                //  margin: EdgeInsets.all(5),
                  height: 70.0,

                  width: 70.0,
                  child: Hero(
                    tag:Paths.Services_Images+Service_Image ,
                    child: FadeInImage.assetNetwork(
                      placeholder: 'images/Splach_Screen/gif_Splashr.gif',
                      image:  Paths.Services_Images+Service_Image,
                      fit: BoxFit.cover,
                    ),
                  )

                // Image.network(
                //
                //   fit: BoxFit.cover,
                // ),

              ),Container(
                 // margin: EdgeInsets.all(5),
                  child: Center(
                    child: Text(
                      Service_Name,
                      style: TextStyle(color:Colors.black
                          ,fontWeight: FontWeight.bold,fontSize: 12),
                    ),
                  )
              )
            ],
          ),
      ),
    ),
        ));
  }
}
