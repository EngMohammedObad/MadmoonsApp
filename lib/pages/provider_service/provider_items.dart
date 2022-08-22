import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madmooon/paths.dart';

import '../../colors.dart';
import 'details_screen_service_provider.dart';




class ProviderCard extends StatefulWidget {
  const ProviderCard({
    required this.   Cusotmer_Image,
    required this.  Customer_Name,
    required this. Areas_Name,
    required this. Requst_DataTime,
    required this. Requst_Service_ID,
    required this. Service_Number,
    required this. Service_Name,
    required this. Service_Image,
    required this.Requst_State,
    required this.Requst_Service_ALL_Details,
    required this.Customer_Phone_Number,
    required this.Interview_DateAndTime,
    required this.Location_Interview,

  });
  final String Cusotmer_Image,Customer_Name,Areas_Name,Requst_DataTime,Requst_Service_ID,Interview_DateAndTime,Location_Interview;
  final String Service_Number,Service_Name,Requst_State,Service_Image,Requst_Service_ALL_Details,Customer_Phone_Number;

  @override
  State<ProviderCard> createState() => _RequstCardState();
}

class _RequstCardState extends State<ProviderCard> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Directionality(
        textDirection: TextDirection.rtl,
        child:
        Container(
      margin: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      height: 190.0,
      child: InkWell(
        onTap: (){
Get.to(
    DetailsScreenprvider(

      Cusotmer_Image:widget.Cusotmer_Image,
      Customer_Name:widget.Customer_Name,
      Areas_Name:widget.Areas_Name,
      Requst_DataTime:widget.Requst_DataTime,
      Requst_Service_ID:widget.Requst_Service_ID,
      Service_Number:widget.Service_Number,
      Service_Name:widget.Service_Name,
      Service_Image:widget.Service_Image,
      Requst_State:widget.Requst_State,
      Requst_Service_ALL_Details:widget.Requst_Service_ALL_Details,
      Customer_Phone_Number:widget.Customer_Phone_Number,
      Interview_DateAndTime: widget.Interview_DateAndTime,
      Location_Interview: widget.Location_Interview,
    )
);



        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [

            Container(
              height: 200.0,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                gradient: LinearGradient(
                    colors: [facebookColor,kBlueColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 15),
                      blurRadius: 25,
                      color: Colors.black12),
                ],
              ),
            ),
            Positioned(
              top: 0.0,
              left: 0.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                height: 120.0,
                width: 160.0,
                child: FadeInImage.assetNetwork(
                  placeholder: 'images/Splach_Screen/gif_Splashr.gif',
                  image:  Paths.Services_Images+widget.Service_Image,
                  fit: BoxFit.cover,
                )
              ),
            ),
            Positioned(
              top: 5.0,
              right: 0.0,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // image: DecorationImage(
                    //     image: NetworkImage(
                    //         'https://fallingtaiz.000webhostapp.com/upload/usimage/$user_image'),
                    //     fit: BoxFit.cover),
                  ),
                  child:  Container(
                    margin: EdgeInsets.all(5),
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                            Paths.Customer_Images+widget.Cusotmer_Image,),
                          fit: BoxFit.cover),
                    ),
                  ),




              ),
            ),
            Positioned(
              top: 0.0,
              right: 20.0,
              child: SizedBox(
                height: 136.0,
                // Because oure image is 200 width, then: width - 200
                width: size.width - 230,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10),
                      child: Container(
                        padding: EdgeInsets.only(top: 2,bottom: 2,right: 5,left: 5),
                          decoration: BoxDecoration(
                            color: facebookColor,
                            borderRadius: BorderRadius.circular(22),
                          ),
                       child: RichText(
                      text: TextSpan(
                      style:
                      TextStyle(color:backgroundColor ),
                  children:  [

                    TextSpan(text: widget.Service_Name),

                  ]),
            )






                      )
                    ),



                  ],
                ),
              ),

            ),
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding * 1.5, // 30 px padding
                    vertical: kDefaultPadding / 2, // 5 px padding
                  ),
                  decoration: BoxDecoration(
                    color: facebookColor,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child:InkWell(
                    child:
                    RichText(
                      text: TextSpan(
                          style:
                          TextStyle(color:backgroundColor ),
                          children:  [
widget.Requst_State!="تم الطلب"?
                            TextSpan(text: widget.Customer_Name+" طلب خدمة "+widget.Service_Name+" رقم الطلب "+"( "+
                                widget.Service_Number+" ) "+"في "+widget.Areas_Name+"وقت وتاريخ المقابلة "+widget.Interview_DateAndTime)
:
                        TextSpan(text: widget.Service_Name+" رقم الطلب "+"( "+
                    widget.Service_Number+" ) "+"في "+widget.Areas_Name+" وقت وتاريخ الطلب "+widget.Requst_DataTime),

                      ]),
                    )
                  )

              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding * 1.5, // 30 px padding
                    vertical: kDefaultPadding / 5, // 5 px padding
                  ),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child:InkWell(
                      child:
                      RichText(
                        text: TextSpan(
                            style:
                            TextStyle(color:backgroundColor ),
                            children:  [
                              widget.Requst_State=="في المقابلة"?
                        TextSpan(text: "أنتضار مرحلة المقابلة") :
                              TextSpan(text: widget.Requst_State=="تم الطلب"?"تحتاج عروض سعر":widget.Requst_State),

                            ]),
                      )
                  )

              ),
            ),
          ],
        ),
      ),
    ));
  }
}

