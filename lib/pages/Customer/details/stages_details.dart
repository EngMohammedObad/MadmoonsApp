import 'package:flutter/material.dart';
import '../../../colors.dart';
import 'package:get/get.dart';
import '../../../paths.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'multymedia_stagesfor_customer.dart';
class Stages_Details extends StatefulWidget {
  final Service_Stages_ID;
  final Requst_Service_State;
  final Date_Start;
  final Date_Finsh;
  final Stage_Details;
  final Stages_Cost;
  final Index;
  final Service_Name;


  Stages_Details(
      {
        this. Service_Stages_ID,
        this. Requst_Service_State,
        this. Date_Start,
        this. Date_Finsh,
        this. Stages_Cost,
        this. Stage_Details,
        this. Index,
        this. Service_Name,
        });

  @override
  State<Stages_Details> createState() => _Stages_DetailsState();
}

class _Stages_DetailsState extends State<Stages_Details> {
  @override
  void initState() {

    super.initState();
    fetch();

  }
  bool isfound=false;
  Future fetch() async {
    Uri url = Uri.parse(Paths.Media + "get_all_media_for_stages.php");
    var data = {
      "Stages_ID": widget.Service_Stages_ID.toString(),
    };
    int x=0;
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);

    for (int i = 0; i < responsebody.length; i++) {
x++;


    }

    if(x>0)
      {
        setState(() {
          isfound=true;
        });


      }


    else
    setState(() {
      isfound=false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return InkWell (
      child: SizedBox(
        height: 220,
        width: 100,
        child: Card(
          child: Row(
            children: <Widget>[
              Expanded(
                  flex:1,
                  child: Container(
                    color: facebookColor,
                    child: Center(
                      child: Text(widget.Index,style: TextStyle(color: Colors.white,fontSize: 14),),
                    ),
                  )

              ),
              Expanded(
                flex: 9,
                child: Container(
                    alignment: Alignment.topRight,
                    height: 220,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(widget.Service_Name,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w800),
                              textAlign: TextAlign.center),
                        ),


                        Expanded(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "الوقت المحدد للبداية : ",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Directionality(textDirection: TextDirection.ltr, child: Text(
                                  widget.Date_Start,
                                  style: TextStyle(color: Colors.blue,  fontSize: 16),
                                ))
                              ],
                            )),

                        Expanded(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "الوقت المحدد للنهاية : ",
                                  style: TextStyle(color: Colors.grey,  fontSize: 16),
                                ),
                                Directionality(textDirection: TextDirection.ltr, child: Text(
                                  widget.Date_Finsh,
                                  style: TextStyle(color: Colors.blue,  fontSize: 16),
                                ))
                              ],
                            )),



                        Expanded(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "حالة المرحلة : ",
                                  style: TextStyle(color: Colors.grey,  fontSize: 16),
                                ),
                                Directionality(textDirection: TextDirection.ltr, child: Text(
                                  widget.Requst_Service_State,
                                  style: TextStyle(color: Colors.blue,  fontSize: 16),
                                ))

                              ],
                            )
                        ),


                        Padding(
                          padding: EdgeInsets.only(top: 5),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(
                                  " تكلفة المرحلة : ${widget.Stages_Cost}",
                                  style:
                                  TextStyle(color: Colors.black38, fontSize: 18 , fontWeight: FontWeight.w700),
                                ),

                            ),
                          ],
                        ),
                        ContainerNotifaction(),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
      onTap: () {

        if(isfound==true)
          {Get.to(StagesMedia(Stages_ID:widget.Service_Stages_ID,Stage_Details:widget.Stage_Details)) ;}

        else
          {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'لايوجد وسائط للأن',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontSize: 20, fontFamily: 'Cairo'),
                ),
                backgroundColor: kTextColor,
              ),
            );
          }
      },
    );
  }
  ContainerNotifaction() {
    return Container(
      // margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, // 30 px padding
          vertical: kDefaultPadding / 3, // 5 px padding
        ),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [ Colors.white12,Colors.deepPurple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: Colors.white.withOpacity(.3),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1))
            ]),
        // decoration: BoxDecoration(
        //   color: color,
        //   borderRadius: BorderRadius.circular(22),
        // ),
        child: Center(
          child: InkWell(
              child: RichText(
                text: TextSpan(
                    style: //Theme.of(context).textTheme.headline6,
                    TextStyle(color: Colors.black, fontSize: 18),
                    children: [
                      TextSpan(
                        text: "التفاصيل ",
                      ),
                    ]),
              )),
        ));
  }
}


//                       return MobileDetails(name , screen , screen_protect , screen_res  , system , cpu  , num_core , gpu , memory , battery , camera_main , camera_feature , camera_video , camera_tele , camera_ultra , camera_depth , camera_micro , camera_self_feature , camera_self_video  , camera_self  ,price_uae , price_eg , price_jo , price_sa , price_sy , price_alg);
