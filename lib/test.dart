// import 'package:flutter/material.dart';
// import 'package:adobe_xd/pinned.dart';
// import './profile.dart';
// import './settings.dart';
// import './customers.dart';
// import './offers.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class home extends StatelessWidget {
//   home({
//     Key key,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffffffff),
//       body: Stack(
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//               color: const Color(0xffe8e8e8),
//               borderRadius: BorderRadius.circular(36.0),
//             ),
//           ),
//           Pinned.fromPins(
//             Pin(size: 390.0, middle: 0.5),
//             Pin(size: 480.0, end: 71.0),
//             child: SingleChildScrollView(
//               primary: false,
//               child: SizedBox(
//                 width: 390.0,
//                 height: 1172.0,
//                 child: Stack(
//                   children: <Widget>[
//                     Container(
//                       decoration: BoxDecoration(
//                         color: const Color(0xffe8e8e8),
//                         borderRadius: BorderRadius.circular(36.0),
//                       ),
//                       margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, -692.0),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Pinned.fromPins(
//             Pin(size: 343.0, middle: 0.4468),
//             Pin(size: 456.0, end: 71.0),
//             child: SingleChildScrollView(
//               primary: false,
//               child: SizedBox(
//                 width: 343.0,
//                 height: 1096.0,
//                 child: Stack(
//                   children: <Widget>[
//                     Pinned.fromPins(
//                       Pin(start: 0.0, end: 0.0),
//                       Pin(size: 1096.0, middle: 0.0),
//                       child: Text(
//                         '\nWhere does it come from?\n\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going \n\n\nthrough the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.\n\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\n\n\n\n\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\n',
//                         style: TextStyle(
//                           fontFamily: 'Tajawal',
//                           fontSize: 25,
//                           color: const Color(0xff364863),
//                           fontWeight: FontWeight.w500,
//                           height: 0.72,
//                         ),
//                         textHeightBehavior:
//                         TextHeightBehavior(applyHeightToFirstAscent: false),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Pinned.fromPins(
//             Pin(start: -22.0, end: 0.0),
//             Pin(size: 44.0, start: 1.0),
//             child: Stack(
//               children: <Widget>[
//                 SizedBox.expand(
//                     child: SvgPicture.string(
//                       _svg_cuomdc,
//                       allowDrawingOutsideViewBox: true,
//                       fit: BoxFit.fill,
//                     )),
//                 Pinned.fromPins(
//                   Pin(size: 24.3, end: 14.7),
//                   Pin(size: 11.3, middle: 0.5306),
//                   child: Stack(
//                     children: <Widget>[
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(0.0, 0.0, 2.3, 0.0),
//                         child: Stack(
//                           children: <Widget>[
//                             SizedBox.expand(
//                                 child: SvgPicture.string(
//                                   _svg_ajz66d,
//                                   allowDrawingOutsideViewBox: true,
//                                   fit: BoxFit.fill,
//                                 )),
//                             SizedBox.expand(
//                                 child: SvgPicture.string(
//                                   _svg_c12ci,
//                                   allowDrawingOutsideViewBox: true,
//                                   fit: BoxFit.fill,
//                                 )),
//                           ],
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: SizedBox(
//                           width: 1.0,
//                           height: 4.0,
//                           child: Stack(
//                             children: <Widget>[
//                               Padding(
//                                 padding: EdgeInsets.all(-5.0),
//                                 child: SizedBox.expand(
//                                     child: SvgPicture.string(
//                                       _svg_aeucu,
//                                       allowDrawingOutsideViewBox: true,
//                                       fit: BoxFit.fill,
//                                     )),
//                               ),
//                               SizedBox.expand(
//                                   child: SvgPicture.string(
//                                     _svg_t93avt,
//                                     allowDrawingOutsideViewBox: true,
//                                     fit: BoxFit.fill,
//                                   )),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Pinned.fromPins(
//                         Pin(size: 18.0, start: 2.0),
//                         Pin(size: 7.3, middle: 0.5),
//                         child: Stack(
//                           children: <Widget>[
//                             Padding(
//                               padding: EdgeInsets.all(-5.0),
//                               child: SizedBox.expand(
//                                   child: SvgPicture.string(
//                                     _svg_so11bf,
//                                     allowDrawingOutsideViewBox: true,
//                                     fit: BoxFit.fill,
//                                   )),
//                             ),
//                             SizedBox.expand(
//                                 child: SvgPicture.string(
//                                   _svg_duawj,
//                                   allowDrawingOutsideViewBox: true,
//                                   fit: BoxFit.fill,
//                                 )),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Pinned.fromPins(
//                   Pin(size: 15.3, end: 44.0),
//                   Pin(size: 11.0, middle: 0.5246),
//                   child: Stack(
//                     children: <Widget>[
//                       Stack(
//                         children: <Widget>[
//                           Padding(
//                             padding: EdgeInsets.all(-5.0),
//                             child: SizedBox.expand(
//                                 child: SvgPicture.string(
//                                   _svg_rd8r7p,
//                                   allowDrawingOutsideViewBox: true,
//                                   fit: BoxFit.fill,
//                                 )),
//                           ),
//                           SizedBox.expand(
//                               child: SvgPicture.string(
//                                 _svg_f51mym,
//                                 allowDrawingOutsideViewBox: true,
//                                 fit: BoxFit.fill,
//                               )),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment(0.641, 0.06),
//                   child: SizedBox(
//                     width: 17.0,
//                     height: 11.0,
//                     child: Stack(
//                       children: <Widget>[
//                         Stack(
//                           children: <Widget>[
//                             Padding(
//                               padding: EdgeInsets.all(-5.0),
//                               child: SizedBox.expand(
//                                   child: SvgPicture.string(
//                                     _svg_e6c0fm,
//                                     allowDrawingOutsideViewBox: true,
//                                     fit: BoxFit.fill,
//                                   )),
//                             ),
//                             SizedBox.expand(
//                                 child: SvgPicture.string(
//                                   _svg_mulk0q,
//                                   allowDrawingOutsideViewBox: true,
//                                   fit: BoxFit.fill,
//                                 )),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Pinned.fromPins(
//                   Pin(size: 54.0, start: 21.0),
//                   Pin(size: 18.0, middle: 0.5769),
//                   child: Stack(
//                     children: <Widget>[
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 2.0),
//                         child: SizedBox.expand(
//                             child: SvgPicture.string(
//                               _svg_n5wzl,
//                               allowDrawingOutsideViewBox: true,
//                               fit: BoxFit.fill,
//                             )),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 0.0),
//                         child: SizedBox.expand(
//                             child: SingleChildScrollView(
//                               primary: false,
//                               child: Text(
//                                 '9:41',
//                                 style: TextStyle(
//                                   fontFamily: 'SF Pro Text',
//                                   fontSize: 14,
//                                   color: const Color(0xff000000),
//                                   letterSpacing: 0.003920000016689301,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                             )),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.fromLTRB(0.0, 807.2, 0.0, 0.0),
//             child: SizedBox.expand(
//                 child: SvgPicture.string(
//                   _svg_w5e1ti,
//                   allowDrawingOutsideViewBox: true,
//                   fit: BoxFit.fill,
//                 )),
//           ),
//           Pinned.fromPins(
//             Pin(size: 42.0, end: 26.3),
//             Pin(size: 15.0, end: 10.7),
//             child: Text(
//               'الرئيسية ',
//               style: TextStyle(
//                 fontFamily: 'Tajawal',
//                 fontSize: 11,
//                 color: const Color(0xffd6d6d6),
//                 fontWeight: FontWeight.w500,
//                 height: 1.6363636363636365,
//               ),
//               textHeightBehavior:
//               TextHeightBehavior(applyHeightToFirstAscent: false),
//               textAlign: TextAlign.center,
//               softWrap: false,
//             ),
//           ),
//           Pinned.fromPins(
//             Pin(size: 17.5, middle: 0.695),
//             Pin(size: 24.1, end: 31.2),
//             child: profile(),
//           ),
//           Pinned.fromPins(
//             Pin(size: 36.0, middle: 0.7062),
//             Pin(size: 15.0, end: 10.7),
//             child: Text(
//               'حسابي  ',
//               style: TextStyle(
//                 fontFamily: 'Tajawal',
//                 fontSize: 11,
//                 color: const Color(0xff364863),
//                 fontWeight: FontWeight.w500,
//                 height: 1.6363636363636365,
//               ),
//               textHeightBehavior:
//               TextHeightBehavior(applyHeightToFirstAscent: false),
//               textAlign: TextAlign.center,
//               softWrap: false,
//             ),
//           ),
//           Pinned.fromPins(
//             Pin(size: 1.0, middle: 0.4552),
//             Pin(size: 1.0, end: 83.6),
//             child: SvgPicture.string(
//               _svg_hzweg1,
//               allowDrawingOutsideViewBox: true,
//               fit: BoxFit.fill,
//             ),
//           ),
//           Pinned.fromPins(
//             Pin(size: 9.4, start: 37.5),
//             Pin(size: 17.1, start: 130.9),
//             child: SvgPicture.string(
//               _svg_qi2qka,
//               allowDrawingOutsideViewBox: true,
//               fit: BoxFit.fill,
//             ),
//           ),
//           Pinned.fromPins(
//             Pin(start: 0.0, end: 17.0),
//             Pin(size: 177.0, middle: 0.1923),
//             child: SingleChildScrollView(
//               primary: false,
//               scrollDirection: Axis.horizontal,
//               child: SizedBox(
//                 width: 961.0,
//                 height: 177.0,
//                 child: Stack(
//                   children: <Widget>[
//                     Padding(
//                       padding: EdgeInsets.fromLTRB(9.0, 0.0, -597.0, 0.0),
//                       child: Stack(
//                         children: <Widget>[
//                           Pinned.fromPins(
//                             Pin(size: 214.0, middle: 0.3333),
//                             Pin(start: 0.0, end: 0.0),
//                             child: SvgPicture.string(
//                               _svg_b4adt,
//                               allowDrawingOutsideViewBox: true,
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                           Pinned.fromPins(
//                             Pin(size: 214.0, end: 0.0),
//                             Pin(start: 0.0, end: 0.0),
//                             child: SvgPicture.string(
//                               _svg_ugxjxr,
//                               allowDrawingOutsideViewBox: true,
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                           Pinned.fromPins(
//                             Pin(size: 214.0, middle: 0.6667),
//                             Pin(start: 0.0, end: 0.0),
//                             child: SvgPicture.string(
//                               _svg_hfzj,
//                               allowDrawingOutsideViewBox: true,
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                           Pinned.fromPins(
//                             Pin(size: 214.0, start: 0.0),
//                             Pin(start: 0.0, end: 0.0),
//                             child: SvgPicture.string(
//                               _svg_j9fvpt,
//                               allowDrawingOutsideViewBox: true,
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Pinned.fromPins(
//             Pin(size: 42.0, start: 21.0),
//             Pin(size: 15.0, end: 10.7),
//             child: Stack(
//               children: <Widget>[
//                 SizedBox.expand(
//                     child: Text(
//                       'الإعدادات',
//                       style: TextStyle(
//                         fontFamily: 'Tajawal',
//                         fontSize: 11,
//                         color: const Color(0xff364863),
//                         fontWeight: FontWeight.w500,
//                         height: 1.6363636363636365,
//                       ),
//                       textHeightBehavior:
//                       TextHeightBehavior(applyHeightToFirstAscent: false),
//                       textAlign: TextAlign.center,
//                       softWrap: false,
//                     )),
//               ],
//             ),
//           ),
//           Pinned.fromPins(
//             Pin(size: 23.7, start: 30.3),
//             Pin(size: 23.5, end: 31.4),
//             child: settings(),
//           ),
//           Pinned.fromPins(
//             Pin(size: 29.1, middle: 0.507),
//             Pin(size: 23.9, end: 31.4),
//             child: customers(),
//           ),
//           Pinned.fromPins(
//             Pin(start: 181.5, end: 176.5),
//             Pin(size: 15.0, end: 10.7),
//             child: Text(
//               'عملائنا',
//               style: TextStyle(
//                 fontFamily: 'Tajawal',
//                 fontSize: 11,
//                 color: const Color(0xff364863),
//                 fontWeight: FontWeight.w500,
//                 height: 1.6363636363636365,
//               ),
//               textHeightBehavior:
//               TextHeightBehavior(applyHeightToFirstAscent: false),
//               textAlign: TextAlign.center,
//               softWrap: false,
//             ),
//           ),
//           Pinned.fromPins(
//             Pin(size: 23.9, middle: 0.3119),
//             Pin(size: 23.9, end: 31.0),
//             child: offers(),
//           ),
//           Pinned.fromPins(
//             Pin(start: 107.1, end: 244.9),
//             Pin(size: 15.0, end: 10.7),
//             child: Text(
//               'العروض',
//               style: TextStyle(
//                 fontFamily: 'Tajawal',
//                 fontSize: 11,
//                 color: const Color(0xff364863),
//                 fontWeight: FontWeight.w500,
//                 height: 1.6363636363636365,
//               ),
//               textHeightBehavior:
//               TextHeightBehavior(applyHeightToFirstAscent: false),
//               textAlign: TextAlign.center,
//               softWrap: false,
//             ),
//           ),
//           Pinned.fromPins(
//             Pin(start: 16.7, end: 16.7),
//             Pin(size: 1.0, start: 121.0),
//             child: SvgPicture.string(
//               _svg_p2az1,
//               allowDrawingOutsideViewBox: true,
//               fit: BoxFit.fill,
//             ),
//           ),
//           Pinned.fromPins(
//             Pin(start: 16.7, end: 16.7),
//             Pin(size: 1.0, middle: 0.3736),
//             child: SvgPicture.string(
//               _svg_d6ide5,
//               allowDrawingOutsideViewBox: true,
//               fit: BoxFit.fill,
//             ),
//           ),
//           Pinned.fromPins(
//             Pin(size: 111.4, middle: 0.5),
//             Pin(size: 55.7, start: 53.1),
//             child: Stack(
//               children: <Widget>[
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: SizedBox(
//                     width: 53.0,
//                     height: 42.0,
//                     child: Stack(
//                       children: <Widget>[
//                         Pinned.fromPins(
//                           Pin(size: 18.3, start: 0.0),
//                           Pin(size: 17.5, end: 1.5),
//                           child: Stack(
//                             children: <Widget>[
//                               SizedBox.expand(
//                                   child: SvgPicture.string(
//                                     _svg_pezc8l,
//                                     allowDrawingOutsideViewBox: true,
//                                     fit: BoxFit.fill,
//                                   )),
//                             ],
//                           ),
//                         ),
//                         Pinned.fromPins(
//                           Pin(size: 20.4, start: 0.7),
//                           Pin(size: 18.6, middle: 0.7315),
//                           child: SvgPicture.string(
//                             _svg_fn68lq,
//                             allowDrawingOutsideViewBox: true,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         Pinned.fromPins(
//                           Pin(size: 9.7, middle: 0.2468),
//                           Pin(size: 12.0, end: 6.0),
//                           child: SvgPicture.string(
//                             _svg_vql9e,
//                             allowDrawingOutsideViewBox: true,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         Pinned.fromPins(
//                           Pin(size: 16.1, start: 5.0),
//                           Pin(size: 14.5, middle: 0.627),
//                           child: SvgPicture.string(
//                             _svg_fqplel,
//                             allowDrawingOutsideViewBox: true,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         Pinned.fromPins(
//                           Pin(size: 24.8, start: 1.6),
//                           Pin(size: 21.0, middle: 0.4301),
//                           child: Stack(
//                             children: <Widget>[
//                               SizedBox.expand(
//                                   child: SvgPicture.string(
//                                     _svg_pmafs0,
//                                     allowDrawingOutsideViewBox: true,
//                                     fit: BoxFit.fill,
//                                   )),
//                               Pinned.fromPins(
//                                 Pin(size: 11.4, end: 1.9),
//                                 Pin(size: 12.5, end: 0.0),
//                                 child: SvgPicture.string(
//                                   _svg_bivjzw,
//                                   allowDrawingOutsideViewBox: true,
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                               Pinned.fromPins(
//                                 Pin(size: 18.8, end: 0.9),
//                                 Pin(size: 17.2, start: 0.2),
//                                 child: SvgPicture.string(
//                                   _svg_cmgqc8,
//                                   allowDrawingOutsideViewBox: true,
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Pinned.fromPins(
//                           Pin(size: 25.8, start: 4.8),
//                           Pin(size: 25.2, start: 0.0),
//                           child: SvgPicture.string(
//                             _svg_ctozx,
//                             allowDrawingOutsideViewBox: true,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment(-0.166, -0.251),
//                           child: SizedBox(
//                             width: 12.0,
//                             height: 16.0,
//                             child: SvgPicture.string(
//                               _svg_si5kcy,
//                               allowDrawingOutsideViewBox: true,
//                             ),
//                           ),
//                         ),
//                         Pinned.fromPins(
//                           Pin(size: 20.0, middle: 0.3276),
//                           Pin(size: 21.3, start: 0.5),
//                           child: SvgPicture.string(
//                             _svg_y35l7,
//                             allowDrawingOutsideViewBox: true,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         Pinned.fromPins(
//                           Pin(size: 20.0, middle: 0.5967),
//                           Pin(size: 7.0, end: 5.8),
//                           child: SvgPicture.string(
//                             _svg_i6xn,
//                             allowDrawingOutsideViewBox: true,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         Pinned.fromPins(
//                           Pin(size: 13.2, middle: 0.4863),
//                           Pin(size: 4.9, end: 5.7),
//                           child: SvgPicture.string(
//                             _svg_skh0i,
//                             allowDrawingOutsideViewBox: true,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment(0.133, 0.6),
//                           child: SizedBox(
//                             width: 17.0,
//                             height: 6.0,
//                             child: SvgPicture.string(
//                               _svg_qq7f,
//                               allowDrawingOutsideViewBox: true,
//                             ),
//                           ),
//                         ),
//                         Pinned.fromPins(
//                           Pin(size: 22.5, end: 7.7),
//                           Pin(size: 7.6, middle: 0.7014),
//                           child: SvgPicture.string(
//                             _svg_qcdhz6,
//                             allowDrawingOutsideViewBox: true,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment(0.183, 0.421),
//                           child: SizedBox(
//                             width: 15.0,
//                             height: 5.0,
//                             child: SvgPicture.string(
//                               _svg_k6w0ti,
//                               allowDrawingOutsideViewBox: true,
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment(0.45, 0.33),
//                           child: SizedBox(
//                             width: 20.0,
//                             height: 6.0,
//                             child: SvgPicture.string(
//                               _svg_gk60,
//                               allowDrawingOutsideViewBox: true,
//                             ),
//                           ),
//                         ),
//                         Pinned.fromPins(
//                           Pin(size: 1.0, end: 6.5),
//                           Pin(size: 1.0, middle: 0.6787),
//                           child: SvgPicture.string(
//                             _svg_kltrki,
//                             allowDrawingOutsideViewBox: true,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment(1.0, 0.205),
//                           child: SizedBox(
//                             width: 25.0,
//                             height: 11.0,
//                             child: SvgPicture.string(
//                               _svg_itf7wb,
//                               allowDrawingOutsideViewBox: true,
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment(0.479, 0.137),
//                           child: SizedBox(
//                             width: 17.0,
//                             height: 5.0,
//                             child: SvgPicture.string(
//                               _svg_ndi27s,
//                               allowDrawingOutsideViewBox: true,
//                             ),
//                           ),
//                         ),
//                         Pinned.fromPins(
//                           Pin(size: 22.1, end: 1.0),
//                           Pin(size: 9.0, middle: 0.5531),
//                           child: SvgPicture.string(
//                             _svg_vstu6,
//                             allowDrawingOutsideViewBox: true,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment.bottomCenter,
//                           child: SizedBox(
//                             width: 19.0,
//                             height: 8.0,
//                             child: SvgPicture.string(
//                               _svg_sxgkw1,
//                               allowDrawingOutsideViewBox: true,
//                             ),
//                           ),
//                         ),
//                         Pinned.fromPins(
//                           Pin(size: 16.2, middle: 0.4919),
//                           Pin(size: 5.2, end: 3.2),
//                           child: SvgPicture.string(
//                             _svg_kmik56,
//                             allowDrawingOutsideViewBox: true,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomLeft,
//                   child: SizedBox(
//                     width: 62.0,
//                     height: 30.0,
//                     child: Stack(
//                       children: <Widget>[
//                         Pinned.fromPins(
//                           Pin(size: 1.0, middle: 0.8078),
//                           Pin(size: 1.0, end: 3.8),
//                           child: SvgPicture.string(
//                             _svg_kntql5,
//                             allowDrawingOutsideViewBox: true,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         Pinned.fromPins(
//                           Pin(start: 2.2, end: 0.7),
//                           Pin(size: 12.4, start: 0.0),
//                           child: Stack(
//                             children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: SizedBox(
//                                   width: 6.0,
//                                   height: 9.0,
//                                   child: SvgPicture.string(
//                                     _svg_a1gzw,
//                                     allowDrawingOutsideViewBox: true,
//                                   ),
//                                 ),
//                               ),
//                               Pinned.fromPins(
//                                 Pin(size: 6.0, start: 7.5),
//                                 Pin(start: 2.6, end: 2.9),
//                                 child: SvgPicture.string(
//                                   _svg_rh2yeo,
//                                   allowDrawingOutsideViewBox: true,
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                               Align(
//                                 alignment: Alignment(-0.441, 1.0),
//                                 child: SizedBox(
//                                   width: 7.0,
//                                   height: 10.0,
//                                   child: SvgPicture.string(
//                                     _svg_b2c6eq,
//                                     allowDrawingOutsideViewBox: true,
//                                   ),
//                                 ),
//                               ),
//                               Pinned.fromPins(
//                                 Pin(size: 6.8, middle: 0.4285),
//                                 Pin(start: 2.7, end: 2.9),
//                                 child: SvgPicture.string(
//                                   _svg_b9zf3k,
//                                   allowDrawingOutsideViewBox: true,
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                               Align(
//                                 alignment: Alignment(0.136, -1.0),
//                                 child: SizedBox(
//                                   width: 6.0,
//                                   height: 9.0,
//                                   child: SvgPicture.string(
//                                     _svg_naygs,
//                                     allowDrawingOutsideViewBox: true,
//                                   ),
//                                 ),
//                               ),
//                               Pinned.fromPins(
//                                 Pin(size: 6.8, middle: 0.7169),
//                                 Pin(start: 2.7, end: 2.9),
//                                 child: SvgPicture.string(
//                                   _svg_wxh2r,
//                                   allowDrawingOutsideViewBox: true,
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                               Pinned.fromPins(
//                                 Pin(size: 6.4, end: 7.8),
//                                 Pin(size: 8.8, start: 0.8),
//                                 child: SvgPicture.string(
//                                   _svg_xpsl5e,
//                                   allowDrawingOutsideViewBox: true,
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                               Align(
//                                 alignment: Alignment.bottomRight,
//                                 child: SizedBox(
//                                   width: 7.0,
//                                   height: 10.0,
//                                   child: SvgPicture.string(
//                                     _svg_qjqu,
//                                     allowDrawingOutsideViewBox: true,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Pinned.fromPins(
//                           Pin(start: 0.0, end: 0.0),
//                           Pin(size: 0.9, middle: 0.5129),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 begin: Alignment(-1.0, 0.0),
//                                 end: Alignment(1.0, 0.0),
//                                 colors: [
//                                   const Color(0xffa17a9f),
//                                   const Color(0xffa573ac),
//                                   const Color(0xff9286bc),
//                                   const Color(0xff76a2d6),
//                                   const Color(0xff66c7db),
//                                   const Color(0xff8bcbb7),
//                                   const Color(0xff92c361),
//                                   const Color(0xffb9ce3e),
//                                   const Color(0xffefdc48),
//                                   const Color(0xfff8c441)
//                                 ],
//                                 stops: [
//                                   0.0,
//                                   0.118,
//                                   0.208,
//                                   0.308,
//                                   0.42,
//                                   0.543,
//                                   0.669,
//                                   0.789,
//                                   0.915,
//                                   1.0
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         Pinned.fromPins(
//                           Pin(size: 36.4, end: 1.1),
//                           Pin(size: 11.7, end: 0.0),
//                           child: Stack(
//                             children: <Widget>[
//                               Align(
//                                 alignment: Alignment.bottomLeft,
//                                 child: SizedBox(
//                                   width: 7.0,
//                                   height: 7.0,
//                                   child: SvgPicture.string(
//                                     _svg_prqi2e,
//                                     allowDrawingOutsideViewBox: true,
//                                   ),
//                                 ),
//                               ),
//                               Align(
//                                 alignment: Alignment(-0.587, -1.0),
//                                 child: SizedBox(
//                                   width: 5.0,
//                                   height: 7.0,
//                                   child: SvgPicture.string(
//                                     _svg_mb6wml,
//                                     allowDrawingOutsideViewBox: true,
//                                   ),
//                                 ),
//                               ),
//                               Align(
//                                 alignment: Alignment(-0.281, -0.318),
//                                 child: SizedBox(
//                                   width: 6.0,
//                                   height: 5.0,
//                                   child: SvgPicture.string(
//                                     _svg_i4eje4,
//                                     allowDrawingOutsideViewBox: true,
//                                   ),
//                                 ),
//                               ),
//                               Align(
//                                 alignment: Alignment(0.118, -0.869),
//                                 child: SizedBox(
//                                   width: 3.0,
//                                   height: 7.0,
//                                   child: SvgPicture.string(
//                                     _svg_ycgqp0,
//                                     allowDrawingOutsideViewBox: true,
//                                   ),
//                                 ),
//                               ),
//                               Pinned.fromPins(
//                                 Pin(size: 4.9, middle: 0.6749),
//                                 Pin(start: 2.4, end: 1.8),
//                                 child: SvgPicture.string(
//                                   _svg_d4myki,
//                                   allowDrawingOutsideViewBox: true,
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                               Align(
//                                 alignment: Alignment(1.0, -0.279),
//                                 child: SizedBox(
//                                   width: 11.0,
//                                   height: 5.0,
//                                   child: SvgPicture.string(
//                                     _svg_nx4agv,
//                                     allowDrawingOutsideViewBox: true,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// const String _svg_ajz66d =
//     '<svg viewBox="0.0 0.0 22.0 11.3" ><path  d="M 2.666666984558105 0 L 19.33333015441895 0 L 19.33333015441895 0 C 20.80608940124512 0 22 1.193907022476196 22 2.666666984558105 L 22 8.666666984558105 L 22 8.666666984558105 C 22 10.13943004608154 20.80608940124512 11.33333015441895 19.33333015441895 11.33333015441895 L 2.666666984558105 11.33333015441895 L 2.666666984558105 11.33333015441895 C 1.193907022476196 11.33333015441895 0 10.13943004608154 0 8.666666984558105 L 0 2.666666984558105 L 0 2.666666984558105 C 0 1.193907022476196 1.193907022476196 0 2.666666984558105 0 Z" fill="none" stroke="#000000" stroke-width="2" stroke-opacity="0.35" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_c12ci =
//     '<svg viewBox="0.0 0.0 22.0 11.3" ><path transform="translate(-336.0, 26.67)" d="M 338.6666870117188 -26.66666984558105 L 355.3333129882812 -26.66666984558105 L 355.3333129882812 -26.66666984558105 C 356.8060913085938 -26.66666984558105 358 -25.47275924682617 358 -24 L 358 -18 L 358 -18 C 358 -16.52724075317383 356.8060913085938 -15.33333015441895 355.3333129882812 -15.33333015441895 L 338.6666870117188 -15.33333015441895 L 338.6666870117188 -15.33333015441895 C 337.1939086914062 -15.33333015441895 336 -16.52724075317383 336 -18 L 336 -24 L 336 -24 C 336 -25.47275924682617 337.1939086914062 -26.66666984558105 338.6666870117188 -26.66666984558105 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_aeucu =
//     '<svg viewBox="-5.0 -5.0 11.3 14.0" ><path transform="translate(-359.0, 23.0)" d="M 354 -28 L 365.3280029296875 -28 L 365.3280029296875 -14 L 354 -14 L 354 -28 Z" fill="#000000" fill-opacity="0.4" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_t93avt =
//     '<svg viewBox="0.0 0.0 1.3 4.0" ><path transform="translate(-359.0, 23.0)" d="M 359 -23 L 359 -19 C 359.8046875 -19.33877944946289 360.3280029296875 -20.12686920166016 360.3280029296875 -21 C 360.3280029296875 -21.87313079833984 359.8046875 -22.66122055053711 359 -23" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_so11bf =
//     '<svg viewBox="-5.0 -5.0 28.0 17.3" ><path transform="translate(-338.0, 24.67)" d="M 333 -29.66666984558105 L 361 -29.66666984558105 L 361 -12.33333015441895 L 333 -12.33333015441895 L 333 -29.66666984558105 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_duawj =
//     '<svg viewBox="0.0 0.0 18.0 7.3" ><path transform="translate(-338.0, 24.67)" d="M 339.3333129882812 -24.66666984558105 L 354.6666870117188 -24.66666984558105 L 354.6666870117188 -24.66666984558105 C 355.4030151367188 -24.66666984558105 356 -24.06970977783203 356 -23.33333015441895 L 356 -18.66666984558105 L 356 -18.66666984558105 C 356 -17.93029022216797 355.4030151367188 -17.33333015441895 354.6666870117188 -17.33333015441895 L 339.3333129882812 -17.33333015441895 L 339.3333129882812 -17.33333015441895 C 338.5969848632812 -17.33333015441895 338 -17.93029022216797 338 -18.66666984558105 L 338 -23.33333015441895 L 338 -23.33333015441895 C 338 -24.06970977783203 338.5969848632812 -24.66666984558105 339.3333129882812 -24.66666984558105 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_cuomdc =
//     '<svg viewBox="13.0 80.0 411.9 44.0" ><path transform="translate(13.0, 124.0)" d="M 0 -44 L 411.91357421875 -44 L 411.91357421875 0 L 0 0 L 0 -44 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_rd8r7p =
//     '<svg viewBox="-5.0 -5.0 25.3 21.0" ><path transform="translate(-315.69, 26.67)" d="M 310.6936950683594 -31.66933059692383 L 335.9660949707031 -31.66933059692383 L 335.9660949707031 -10.70376014709473 L 310.6936950683594 -10.70376014709473 L 310.6936950683594 -31.66933059692383 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_f51mym =
//     '<svg viewBox="0.0 0.0 15.3 11.0" ><path transform="translate(-315.69, 26.67)" d="M 323.3302917480469 -24.39200019836426 C 325.5462036132812 -24.39189910888672 327.6773986816406 -23.54047012329102 329.2832946777344 -22.01366996765137 C 329.404296875 -21.89579010009766 329.5975952148438 -21.89727973937988 329.7167053222656 -22.01700019836426 L 330.8727111816406 -23.18367004394531 C 330.9330139160156 -23.2443904876709 330.9666137695312 -23.32663917541504 330.9660949707031 -23.4122200012207 C 330.9656066894531 -23.49780082702637 330.9309997558594 -23.57965087890625 330.8699951171875 -23.63966941833496 C 326.6549072265625 -27.6792106628418 320.0050964355469 -27.6792106628418 315.7900085449219 -23.63966941833496 C 315.7289123535156 -23.5797004699707 315.6943054199219 -23.49786949157715 315.6936950683594 -23.41229057312012 C 315.6932067871094 -23.32670974731445 315.7267150878906 -23.24443054199219 315.7869873046875 -23.18367004394531 L 316.9432983398438 -22.01700019836426 C 317.0624084472656 -21.8971004486084 317.2557983398438 -21.89561080932617 317.376708984375 -22.01366996765137 C 318.9827880859375 -23.54056930541992 321.1141967773438 -24.39200973510742 323.3302917480469 -24.39200019836426 L 323.3302917480469 -24.39200019836426 Z M 323.3302917480469 -20.5963306427002 C 324.5477905273438 -20.59641075134277 325.7218933105469 -20.14388084411621 326.6242980957031 -19.32666969299316 C 326.7463989257812 -19.21068954467773 326.9386901855469 -19.21319961547852 327.0577087402344 -19.33233070373535 L 328.2123107910156 -20.49900054931641 C 328.2731018066406 -20.56019020080566 328.306884765625 -20.64320945739746 328.3059997558594 -20.7294807434082 C 328.3051147460938 -20.81574058532715 328.2697143554688 -20.89805030822754 328.2077026367188 -20.95800018310547 C 325.4595031738281 -23.51437950134277 321.2034912109375 -23.51437950134277 318.4552917480469 -20.95800018310547 C 318.393310546875 -20.89805030822754 318.3577880859375 -20.81570053100586 318.3569946289062 -20.72941017150879 C 318.356201171875 -20.64311981201172 318.3901062011719 -20.56011009216309 318.4509887695312 -20.49900054931641 L 319.6052856445312 -19.33233070373535 C 319.7243041992188 -19.21319961547852 319.9165954589844 -19.21068954467773 320.0386962890625 -19.32666969299316 C 320.9404907226562 -20.14333915710449 322.1135864257812 -20.5958309173584 323.3302917480469 -20.5963306427002 L 323.3302917480469 -20.5963306427002 Z M 325.5492858886719 -17.8120002746582 C 325.6111145019531 -17.87261009216309 325.6451110839844 -17.95601081848145 325.643310546875 -18.04250907897949 C 325.6416015625 -18.12902069091797 325.6041870117188 -18.21096992492676 325.5400085449219 -18.26899909973145 C 324.264404296875 -19.34787940979004 322.3962097167969 -19.34787940979004 321.1206970214844 -18.26899909973145 C 321.056396484375 -18.21100997924805 321.0190124511719 -18.12908935546875 321.0172119140625 -18.04258918762207 C 321.0152893066406 -17.95607948303223 321.0492858886719 -17.87265014648438 321.1109924316406 -17.8120002746582 L 323.1087036132812 -15.79633045196533 C 323.1672058105469 -15.73709011077881 323.2470092773438 -15.70376014709473 323.3302917480469 -15.70376014709473 C 323.4136047363281 -15.70376014709473 323.493408203125 -15.73709011077881 323.552001953125 -15.79633045196533 L 325.5492858886719 -17.8120002746582 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_e6c0fm =
//     '<svg viewBox="-5.0 -5.0 27.0 20.7" ><path transform="translate(-293.67, 26.33)" d="M 288.6666870117188 -31.33333015441895 L 315.6666870117188 -31.33333015441895 L 315.6666870117188 -10.66666984558105 L 288.6666870117188 -10.66666984558105 L 288.6666870117188 -31.33333015441895 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_mulk0q =
//     '<svg viewBox="0.0 0.0 17.0 10.7" ><path transform="translate(-293.67, 26.33)" d="M 294.6666870117188 -19.66666984558105 L 295.6666870117188 -19.66666984558105 C 296.218994140625 -19.66666984558105 296.6666870117188 -19.21895027160645 296.6666870117188 -18.66666984558105 L 296.6666870117188 -16.66666984558105 C 296.6666870117188 -16.1143798828125 296.218994140625 -15.66666984558105 295.6666870117188 -15.66666984558105 L 294.6666870117188 -15.66666984558105 C 294.1144104003906 -15.66666984558105 293.6666870117188 -16.1143798828125 293.6666870117188 -16.66666984558105 L 293.6666870117188 -18.66666984558105 C 293.6666870117188 -19.21895027160645 294.1144104003906 -19.66666984558105 294.6666870117188 -19.66666984558105 L 294.6666870117188 -19.66666984558105 Z M 299.3333129882812 -21.66666984558105 L 300.3333129882812 -21.66666984558105 C 300.8855895996094 -21.66666984558105 301.3333129882812 -21.21895027160645 301.3333129882812 -20.66666984558105 L 301.3333129882812 -16.66666984558105 C 301.3333129882812 -16.1143798828125 300.8855895996094 -15.66666984558105 300.3333129882812 -15.66666984558105 L 299.3333129882812 -15.66666984558105 C 298.781005859375 -15.66666984558105 298.3333129882812 -16.1143798828125 298.3333129882812 -16.66666984558105 L 298.3333129882812 -20.66666984558105 C 298.3333129882812 -21.21895027160645 298.781005859375 -21.66666984558105 299.3333129882812 -21.66666984558105 Z M 304 -24 L 305 -24 C 305.5523071289062 -24 306 -23.55228042602539 306 -23 L 306 -16.66666984558105 C 306 -16.1143798828125 305.5523071289062 -15.66666984558105 305 -15.66666984558105 L 304 -15.66666984558105 C 303.4476928710938 -15.66666984558105 303 -16.1143798828125 303 -16.66666984558105 L 303 -23 C 303 -23.55228042602539 303.4476928710938 -24 304 -24 Z M 308.6666870117188 -26.33333015441895 L 309.6666870117188 -26.33333015441895 C 310.218994140625 -26.33333015441895 310.6666870117188 -25.8856201171875 310.6666870117188 -25.33333015441895 L 310.6666870117188 -16.66666984558105 C 310.6666870117188 -16.1143798828125 310.218994140625 -15.66666984558105 309.6666870117188 -15.66666984558105 L 308.6666870117188 -15.66666984558105 C 308.1144104003906 -15.66666984558105 307.6666870117188 -16.1143798828125 307.6666870117188 -16.66666984558105 L 307.6666870117188 -25.33333015441895 C 307.6666870117188 -25.8856201171875 308.1144104003906 -26.33333015441895 308.6666870117188 -26.33333015441895 L 308.6666870117188 -26.33333015441895 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_n5wzl =
//     '<svg viewBox="0.0 0.0 54.0 16.0" ><path transform="translate(-21.0, 35.0)" d="M 21 -19 L 75 -19 L 75 -35 L 21 -35 L 21 -19 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_w5e1ti =
//     '<svg viewBox="0.0 807.2 390.0 71.8" ><path transform="translate(0.0, 807.15)" d="M 0 0 L 390 0 L 390 37.91856384277344 C 390 56.656005859375 376.1291809082031 71.845703125 359.0186767578125 71.845703125 L 30.98130798339844 71.845703125 C 13.8708028793335 71.845703125 0 56.656005859375 0 37.91856384277344 L 0 0 Z" fill="#ffffff" stroke="#e8e8e8" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_hzweg1 =
//     '<svg viewBox="177.1 794.4 1.0 1.0" ><path transform="translate(-211.09, 794.37)" d="M 388.1818237304688 0" fill="none" fill-opacity="0.49" stroke="#d2d4db" stroke-width="1" stroke-opacity="0.49" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_b4adt =
//     '<svg viewBox="158.0 158.0 214.0 177.0" ><path transform="translate(158.0, 158.0)" d="M 20 0 L 194 0 C 205.0457000732422 0 214 8.954304695129395 214 20 L 214 157 C 214 168.0457000732422 205.0457000732422 177 194 177 L 20 177 C 8.954304695129395 177 0 168.0457000732422 0 157 L 0 20 C 0 8.954304695129395 8.954304695129395 0 20 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_ugxjxr =
//     '<svg viewBox="656.0 158.0 214.0 177.0" ><path transform="translate(656.0, 158.0)" d="M 20 0 L 194 0 C 205.0457000732422 0 214 8.954304695129395 214 20 L 214 157 C 214 168.0457000732422 205.0457000732422 177 194 177 L 20 177 C 8.954304695129395 177 0 168.0457000732422 0 157 L 0 20 C 0 8.954304695129395 8.954304695129395 0 20 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_hfzj =
//     '<svg viewBox="407.0 158.0 214.0 177.0" ><path transform="translate(407.0, 158.0)" d="M 20 0 L 194 0 C 205.0457000732422 0 214 8.954304695129395 214 20 L 214 157 C 214 168.0457000732422 205.0457000732422 177 194 177 L 20 177 C 8.954304695129395 177 0 168.0457000732422 0 157 L 0 20 C 0 8.954304695129395 8.954304695129395 0 20 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_j9fvpt =
//     '<svg viewBox="-91.0 158.0 214.0 177.0" ><path transform="translate(-91.0, 158.0)" d="M 20 0 L 194 0 C 205.0457000732422 0 214 8.954304695129395 214 20 L 214 157 C 214 168.0457000732422 205.0457000732422 177 194 177 L 20 177 C 8.954304695129395 177 0 168.0457000732422 0 157 L 0 20 C 0 8.954304695129395 8.954304695129395 0 20 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_qi2qka =
//     '<svg viewBox="37.5 130.9 9.4 17.1" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 86.85, 168.07)" d="M 40.77919006347656 37.14673233032227 C 40.57986450195312 37.14673233032227 40.38034057617188 37.07054901123047 40.22816467285156 36.91837692260742 C 39.92362213134766 36.61382675170898 39.92362213134766 36.12066650390625 40.22816467285156 35.81631088256836 L 47.47106170654297 28.57341957092285 L 40.22816467285156 21.33052253723145 C 39.92362213134766 21.02597618103027 39.92362213134766 20.53281402587891 40.22816467285156 20.22846221923828 C 40.53271484375 19.92410850524902 41.02587127685547 19.92391395568848 41.33022308349609 20.22846221923828 L 49.12415313720703 28.02238845825195 C 49.42870330810547 28.32693481445312 49.42870330810547 28.82009696960449 49.12415313720703 29.12444877624512 L 41.33022308349609 36.91837310791016 C 41.17804718017578 37.07054901123047 40.97852325439453 37.14673233032227 40.77919006347656 37.14673233032227 Z" fill="#f0f1f3" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_p2az1 =
//     '<svg viewBox="16.7 121.0 356.6 1.0" ><path transform="translate(7.96, 121.0)" d="M 365.3515625 0 L 8.718750953674316 0" fill="none" fill-opacity="0.25" stroke="#364863" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_pezc8l =
//     '<svg viewBox="0.0 0.0 18.3 17.5" ><path transform="translate(-407.03, -221.41)" d="M 410.6853637695312 221.4920349121094 C 412.8765563964844 221.7104187011719 414.9853210449219 222.4427947998047 416.8400573730469 223.629638671875 C 417.3940124511719 223.9821624755859 417.8804321289062 224.3228607177734 418.3331604003906 224.6695098876953 L 418.49072265625 224.7916412353516 C 419.3292846679688 225.4679260253906 420.1313781738281 226.1882629394531 420.8935241699219 226.9496765136719 C 422.4654541015625 228.5986633300781 423.9380187988281 230.3396606445312 425.30322265625 232.1635131835938 C 424.8593139648438 233.0625 424.4199829101562 234.0048522949219 423.9853210449219 234.9906005859375 C 423.4002380371094 236.3235473632812 422.8822021484375 237.6157836914062 422.423095703125 238.8565673828125 C 420.1388854980469 231.092041015625 414.487548828125 224.7643127441406 407.0294799804688 221.6205902099609 C 408.2339477539062 221.3869934082031 409.4674987792969 221.3436126708984 410.6853637695312 221.4920349121094 Z" fill="#f8ae00" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_fn68lq =
//     '<svg viewBox="0.7 17.4 20.4 18.6" ><path transform="translate(-409.92, -173.72)" d="M 414.9400024414062 191.2066955566406 C 417.5149536132812 191.4635925292969 419.992919921875 192.3244934082031 422.1725463867188 193.7193603515625 C 425.8494262695312 196.06884765625 428.882568359375 199.2977905273438 430.9978637695312 203.1141510009766 C 430.35498046875 204.1092224121094 429.7106323242188 205.1569519042969 429.06494140625 206.2573852539062 C 428.3731079101562 207.4388732910156 427.73388671875 208.5910949707031 427.1474609375 209.7139892578125 C 424.764892578125 201.3799285888672 418.675048828125 194.6085052490234 410.6395874023438 191.3583221435547 C 412.0562744140625 191.0830535888672 413.5073852539062 191.0318908691406 414.9400024414062 191.2066955566406 Z" fill="#5c9f32" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_vql9e =
//     '<svg viewBox="10.6 24.3 9.7 12.0" ><path transform="translate(-449.33, -201.53)" d="M 465.2610168457031 228.123291015625 C 466.0991516113281 228.71923828125 466.8917541503906 229.3768005371094 467.6322326660156 230.090576171875 C 468.3298034667969 230.75244140625 468.9855651855469 231.4570617675781 469.5956726074219 232.2003173828125 C 469.0926818847656 233.0001831054688 468.5831604003906 233.8680725097656 468.0812072753906 234.8040466308594 C 467.5085144042969 235.87548828125 467.0139465332031 236.9025268554688 466.5870056152344 237.8754272460938 C 465.8100891113281 234.914794921875 464.5472717285156 232.1036376953125 462.8500671386719 229.5563659667969 C 461.9710998535156 228.2426452636719 460.9798278808594 227.0075988769531 459.8874206542969 225.8651123046875 C 461.8102722167969 226.2554626464844 463.6365661621094 227.02294921875 465.2610168457031 228.123291015625 Z" fill="#a8c622" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_pmafs0 =
//     '<svg viewBox="0.0 0.0 24.8 20.9" ><path transform="translate(-414.95, -150.2)" d="M 420.056884765625 150.3607635498047 C 423.1109619140625 150.7214202880859 426.0368041992188 151.7975921630859 428.5967407226562 153.5018463134766 C 429.6278686523438 154.1817779541016 430.6165466308594 154.9240875244141 431.5572509765625 155.7246551513672 L 431.646728515625 155.80126953125 C 432.2322692871094 156.3053741455078 432.7273254394531 156.7698822021484 433.1307067871094 157.1663360595703 C 433.6707763671875 157.6972503662109 434.0646057128906 158.1221008300781 434.1737976074219 158.2378234863281 C 434.9136352539062 159.0365905761719 436.6178588867188 160.8169097900391 439.7621765136719 164.0667419433594 C 438.5497436523438 165.3450012207031 437.3025512695312 166.7642211914062 436.0542602539062 168.3339385986328 C 435.3196105957031 169.25830078125 434.635986328125 170.1661529541016 434.0034484863281 171.0576477050781 C 430.795654296875 161.8357696533203 423.8913879394531 154.3668823242188 414.9495849609375 150.4454193115234 C 416.63720703125 150.1505279541016 418.3605346679688 150.1219635009766 420.056884765625 150.3607635498047 Z" fill="#237ec3" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_bivjzw =
//     '<svg viewBox="11.5 8.4 11.4 12.5" ><path transform="translate(-461.18, -183.95)" d="M 479.0518798828125 195.165283203125 C 480.0227661132812 195.9061431884766 480.9489135742188 196.7038269042969 481.8255004882812 197.5541839599609 C 482.8026733398438 198.46923828125 483.5784301757812 199.2787628173828 484.123291015625 199.8691101074219 C 483.4241333007812 200.6727600097656 482.7105712890625 201.5299377441406 481.9921264648438 202.4557189941406 C 481.3409423828125 203.2936248779297 480.7372436523438 204.1125946044922 480.1807861328125 204.9126281738281 C 478.5831298828125 200.2671966552734 476.0427856445312 196.0020141601562 472.7189331054688 192.3847961425781 C 474.9937744140625 192.8811492919922 477.1469116210938 193.8264465332031 479.0518798828125 195.165283203125 Z" fill="#2abdec" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_cmgqc8 =
//     '<svg viewBox="5.1 0.2 18.8 17.2" ><path transform="translate(-435.4, -150.83)" d="M 455.2684326171875 159.5864410400391 C 456.087646484375 160.5286254882812 456.8516845703125 161.5174713134766 457.5565795898438 162.5480499267578 C 458.2040405273438 163.5033264160156 458.7973022460938 164.4942321777344 459.3336791992188 165.5160827636719 L 457.1611938476562 168.1771240234375 C 456.3604736328125 165.7613830566406 455.2257080078125 163.4695587158203 453.7897338867188 161.3683319091797 C 450.4929809570312 156.6667327880859 445.869384765625 153.0546569824219 440.5097045898438 150.99365234375 C 442.9534301757812 151.3452911376953 445.3225402832031 152.0968170166016 447.5220642089844 153.2180480957031 C 450.5000610351562 154.8075714111328 453.1329956054688 156.9721527099609 455.2684326171875 159.5864410400391 Z" fill="#28bce8" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_fqplel =
//     '<svg viewBox="5.0 17.5 16.1 14.5" ><path transform="translate(-427.14, -174.12)" d="M 444.7098083496094 198.6080932617188 C 445.413330078125 199.3888244628906 446.0714111328125 200.2093200683594 446.6807861328125 201.0655212402344 C 447.2400207519531 201.8596954345703 447.7543029785156 202.6846008300781 448.2210693359375 203.5364074707031 C 447.9542236328125 203.9292907714844 447.6863403320312 204.3400115966797 447.4174499511719 204.7686157226562 C 447.1359558105469 205.2164764404297 446.8700256347656 205.6561431884766 446.6197204589844 206.0876159667969 C 446.2611999511719 205.095458984375 445.8394470214844 204.1273345947266 445.3569946289062 203.1892242431641 C 444.8138732910156 202.1239624023438 444.1905822753906 201.1015167236328 443.4925537109375 200.1306762695312 C 440.5952758789062 196.2749786376953 436.665771484375 193.3182983398438 432.1583251953125 191.6026916503906 C 434.2200927734375 191.8611602783203 436.2252502441406 192.4573364257812 438.0932922363281 193.3674468994141 C 440.6236877441406 194.6595001220703 442.8726196289062 196.4407653808594 444.7098083496094 198.6080627441406 Z" fill="#81b82c" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_ctozx =
//     '<svg viewBox="4.8 0.0 25.8 25.2" ><path transform="translate(-426.23, -104.09)" d="M 436.8927612304688 104.598388671875 C 440.3439331054688 105.3309097290039 443.576171875 106.8594512939453 446.3320922851562 109.0622100830078 C 448.5141296386719 110.8063354492188 450.4834899902344 112.8010559082031 452.1995849609375 115.005241394043 C 454.0960998535156 117.443229675293 455.6634216308594 120.1203079223633 456.8611145019531 122.9674606323242 C 455.9942932128906 123.7671585083008 455.1157531738281 124.6116714477539 454.2257995605469 125.5009994506836 C 452.9340515136719 126.794303894043 451.7377624511719 128.0726013183594 450.6314086914062 129.3198089599609 C 449.2772216796875 124.2317733764648 446.9682922363281 119.4474868774414 443.8274536132812 115.2216720581055 C 440.4833984375 110.5821762084961 436.1005249023438 106.7891311645508 431.0289916992188 104.1456756591797 C 432.9952697753906 103.9943771362305 434.9731140136719 104.1470718383789 436.8927612304688 104.598388671875 Z" fill="#711866" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_si5kcy =
//     '<svg viewBox="16.7 10.0 12.5 15.8" ><path transform="translate(-473.88, -143.97)" d="M 497.9554138183594 158.3157348632812 C 499.0039367675781 159.2352752685547 499.9787292480469 160.2355346679688 500.8710021972656 161.3073120117188 C 501.6662902832031 162.2554168701172 502.3981018066406 163.2549285888672 503.0616149902344 164.2994689941406 C 502.3215637207031 164.9866485595703 501.5686340332031 165.7217102050781 500.8028869628906 166.5045776367188 C 499.7345886230469 167.6012725830078 498.7605895996094 168.6818542480469 497.8744812011719 169.7286987304688 C 496.7793884277344 163.9415435791016 494.2727355957031 158.5141448974609 490.5771179199219 153.9279632568359 C 493.2632141113281 154.9707183837891 495.7567443847656 156.4535980224609 497.9554138183594 158.3157348632812 Z" fill="#6e3088" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_y35l7 =
//     '<svg viewBox="10.7 0.5 20.0 21.3" ><path transform="translate(-449.71, -106.14)" d="M 476.3369445800781 117.9335098266602 C 477.1708068847656 119.0830459594727 477.9373474121094 120.2799301147461 478.6326599121094 121.518180847168 C 479.2686462402344 122.6635818481445 479.8392639160156 123.844108581543 480.3416442871094 125.054084777832 C 479.8002624511719 125.5862503051758 479.2539978027344 126.1196670532227 478.7028503417969 126.6543502807617 C 478.2385559082031 127.1032943725586 477.7763977050781 127.5497665405273 477.3163757324219 127.9937057495117 C 476.7799987792969 125.126823425293 475.8122863769531 122.3577499389648 474.4463806152344 119.7807388305664 C 470.2289733886719 111.8517150878906 463.3832702636719 108.0779342651367 460.3728332519531 106.6549758911133 C 463.1295471191406 107.3144302368164 465.7604675292969 108.4182281494141 468.1626281738281 109.9230499267578 C 471.3904724121094 112.0261154174805 474.1690368652344 114.7488479614258 476.3370666503906 117.9335098266602 Z" fill="#9d2483" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_i6xn =
//     '<svg viewBox="19.4 29.5 20.0 7.0" ><path transform="translate(-484.79, -222.33)" d="M 504.2093200683594 258.8572692871094 C 510.2703552246094 255.339599609375 517.5695190429688 254.6582946777344 524.1770629882812 256.993408203125 C 523.5797119140625 256.1887817382812 522.8877563476562 255.4590454101562 522.1160278320312 254.8198547363281 C 521.0467529296875 253.9448852539062 519.8441772460938 253.2470397949219 518.5538330078125 252.7529296875 C 516.8482666015625 252.1293640136719 515.0426025390625 251.8253479003906 513.2269287109375 251.8561706542969 C 511.7317810058594 251.8197021484375 510.2371520996094 251.946533203125 508.7695617675781 252.234375 C 506.9142761230469 254.19140625 505.3757019042969 256.4258728027344 504.2092590332031 258.8572692871094 Z" fill="#84b433" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_skh0i =
//     '<svg viewBox="19.1 31.8 13.2 4.9" ><path transform="translate(-483.49, -231.37)" d="M 505.2397155761719 263.2236022949219 C 508.8323059082031 262.9560546875 512.440673828125 263.4556884765625 515.825439453125 264.6893920898438 C 511.1876525878906 264.5406188964844 506.6002502441406 265.6893005371094 502.5797424316406 268.0061340332031 C 502.8840637207031 267.3700561523438 503.2165222167969 266.7171936035156 503.5773010253906 266.0474853515625 C 504.1253356933594 265.0328063964844 504.6847229003906 264.0914611816406 505.2397155761719 263.2236022949219 Z" fill="#c0d038" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_qq7f =
//     '<svg viewBox="19.8 29.2 17.5 5.8" ><path transform="translate(-486.46, -221.15)" d="M 509.5525512695312 251.2226104736328 C 511.7286987304688 250.6054229736328 517.9010620117188 249.1680145263672 522.4886474609375 252.5351715087891 C 522.9508056640625 252.8744964599609 523.3834228515625 253.2522735595703 523.7819213867188 253.6645355224609 C 521.5690307617188 252.8852996826172 519.2312622070312 252.5220489501953 516.8864135742188 252.5930633544922 C 513.0779418945312 252.7410430908203 509.3958740234375 253.9985198974609 506.2925415039062 256.2109375 C 506.8094482421875 255.2104339599609 507.3836669921875 254.2405853271484 508.0123291015625 253.3061065673828 C 508.5265502929688 252.5389251708984 509.0479125976562 251.8451385498047 509.5525512695312 251.2226104736328 Z" fill="#afca38" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_qcdhz6 =
//     '<svg viewBox="22.3 24.4 22.5 7.6" ><path transform="translate(-496.21, -201.66)" d="M 518.4835205078125 232.8945922851562 C 525.7275390625 229.8194580078125 533.9598388671875 230.100830078125 540.9769287109375 233.6633911132812 C 540.429931640625 232.6836242675781 539.7669677734375 231.7733154296875 539.002685546875 230.9519653320312 C 537.942626953125 229.825927734375 536.7088623046875 228.8771667480469 535.3482666015625 228.1419982910156 C 533.5433349609375 227.2107849121094 531.5849609375 226.6129760742188 529.5675048828125 226.3772277832031 C 527.7955322265625 226.0819091796875 525.99755859375 225.9714660644531 524.2025146484375 226.0477905273438 C 523.7291259765625 226.5176391601562 523.1138916015625 227.1438903808594 522.413818359375 227.9014587402344 C 521.98193359375 228.3685913085938 521.4124755859375 228.9847106933594 520.80224609375 229.7186889648438 C 519.96484375 230.7286987304688 519.1905517578125 231.7893676757812 518.4835205078125 232.8945922851562 Z" fill="#44a0db" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_k6w0ti =
//     '<svg viewBox="21.9 26.5 15.4 5.1" ><path transform="translate(-494.92, -210.17)" d="M 520.8936767578125 236.6580505371094 C 524.8694458007812 236.8064270019531 528.7611083984375 237.8444213867188 532.2825927734375 239.6957397460938 C 527.0554809570312 238.8163146972656 521.6846923828125 239.53271484375 516.8709106445312 241.7514038085938 C 518.0282592773438 239.9163818359375 519.3767700195312 238.2090759277344 520.8936767578125 236.6580505371094 Z" fill="#6dccf0" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_gk60 =
//     '<svg viewBox="23.8 24.3 19.7 5.8" ><path transform="translate(-502.25, -201.47)" d="M 530.1781616210938 225.9129943847656 C 532.7085571289062 225.6590270996094 540.0010986328125 225.2615356445312 544.4976196289062 230.0093078613281 C 544.9574584960938 230.4953002929688 545.3745727539062 231.0199279785156 545.7442626953125 231.5774230957031 C 543.3928833007812 230.2310791015625 540.8143310546875 229.3276977539062 538.13671875 228.912109375 C 534.034423828125 228.3023986816406 529.84326171875 228.8338012695312 526.02294921875 230.4480590820312 C 526.6348266601562 229.7166137695312 527.2864379882812 228.9712219238281 527.9779663085938 228.2118835449219 C 528.7215576171875 227.3978881835938 529.4548950195312 226.631591796875 530.1781616210938 225.9129943847656 Z" fill="#5dc7ec" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_kltrki =
//     '<svg viewBox="45.1 28.1 1.0 1.0" ><path transform="translate(-587.46, -216.54)" d="M 632.513671875 244.6156158447266" fill="#5dc7ec" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_itf7wb =
//     '<svg viewBox="27.5 18.9 25.0 11.0" ><path transform="translate(-517.07, -179.77)" d="M 544.5476684570312 205.237548828125 C 553.1383666992188 202.9716796875 562.290771484375 204.5948638916016 569.578369140625 209.6767578125 C 569.1189575195312 208.4909210205078 568.5184936523438 207.3647308349609 567.7900390625 206.3224487304688 C 566.7777709960938 204.8916625976562 565.54248046875 203.632568359375 564.1314086914062 202.5931091308594 C 562.2572631835938 201.2549285888672 560.1522827148438 200.2741546630859 557.922119140625 199.7001037597656 C 556.1071166992188 199.1520233154297 554.2376708984375 198.8040618896484 552.3472290039062 198.6623687744141 C 549.4212646484375 200.4352569580078 546.7898559570312 202.6536560058594 544.5476684570312 205.237548828125 Z" fill="#913585" stroke="#913585" stroke-width="1.866653561592102" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
// const String _svg_ndi27s =
//     '<svg viewBox="26.2 21.3 17.1 5.0" ><path transform="translate(-511.95, -189.24)" d="M 543.2457885742188 210.5006713867188 C 547.5261840820312 211.0760498046875 551.6209716796875 212.6117248535156 555.2239990234375 214.9928894042969 C 549.5873413085938 213.6875915527344 543.7094116210938 213.8551025390625 538.1561889648438 215.4793395996094 C 538.7116088867188 214.8868103027344 539.2883911132812 214.2898254394531 539.8867797851562 213.6883544921875 C 541.019287109375 212.5531311035156 542.1427612304688 211.4896545410156 543.2457885742188 210.5006713867188 Z" fill="#9a6aaa" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_vstu6 =
//     '<svg viewBox="29.4 18.5 22.1 9.0" ><path transform="translate(-524.83, -178.0)" d="M 560.0714721679688 196.4500732421875 C 562.4443359375 196.5481414794922 568.5335693359375 197.1401519775391 573.3735961914062 201.7539672851562 C 574.5225219726562 202.8524475097656 575.5220336914062 204.0973358154297 576.3463134765625 205.4564971923828 C 573.9178466796875 203.4815216064453 571.130859375 201.9942016601562 568.1382446289062 201.0762634277344 C 563.6105346679688 199.7248229980469 558.7910766601562 199.6947326660156 554.246826171875 200.9894714355469 C 555.9948120117188 199.2425689697266 557.9509887695312 197.7174377441406 560.0714721679688 196.448486328125 Z" fill="#a04291" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_sxgkw1 =
//     '<svg viewBox="16.6 34.3 19.0 8.1" ><path transform="translate(-473.33, -241.55)" d="M 489.8845825195312 283.9197998046875 C 495.28564453125 279.7543334960938 502.2353515625 278.1525573730469 508.9148559570312 279.5336608886719 C 508.23583984375 278.8384704589844 507.4754638671875 278.2278137207031 506.6502075195312 277.7148132324219 C 505.50732421875 277.0131530761719 504.2592163085938 276.499267578125 502.95361328125 276.1927490234375 C 501.2257080078125 275.8284301757812 499.4472045898438 275.771240234375 497.6995239257812 276.0239868164062 C 496.1342163085938 276.1666564941406 494.5859375 276.4565734863281 493.074951171875 276.8897399902344 C 492.5820922851562 277.7898254394531 492.0886840820312 278.7530822753906 491.6075439453125 279.7800903320312 C 490.9288330078125 281.2261047363281 490.3613891601562 282.6136474609375 489.8845825195312 283.9197998046875 Z" fill="#fac427" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_kmik56 =
//     '<svg viewBox="17.8 33.9 16.2 5.2" ><path transform="translate(-478.49, -240.01)" d="M 498.37646484375 274.9679565429688 C 500.7036743164062 274.22216796875 506.338134765625 272.7949829101562 511.1137084960938 275.6494140625 C 511.6270141601562 275.9564514160156 512.1154174804688 276.303466796875 512.5741577148438 276.6871643066406 C 510.2906494140625 275.8660583496094 507.8595581054688 275.5359802246094 505.439697265625 275.7185363769531 C 502.1395263671875 275.9887084960938 498.98388671875 277.1899108886719 496.3394775390625 279.1826477050781 C 496.654541015625 278.4718933105469 496.9915161132812 277.74560546875 497.3504638671875 277.0037841796875 C 497.6919555664062 276.3012390136719 498.033935546875 275.6225891113281 498.37646484375 274.9679565429688 Z" fill="#ffe12d" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_a1gzw =
//     '<svg viewBox="0.0 0.4 6.0 9.2" ><path transform="translate(-390.34, -319.03)" d="M 393.0540466308594 328.5711059570312 C 392.5667114257812 328.5725708007812 392.0803527832031 328.5304565429688 391.6005249023438 328.4452514648438 C 391.1687927246094 328.3704528808594 390.7465515136719 328.2482604980469 390.341552734375 328.0809326171875 L 390.5424499511719 326.5551147460938 C 390.98046875 326.7447204589844 391.4344482421875 326.8949279785156 391.8989868164062 327.0040588378906 C 392.3100891113281 327.1030578613281 392.7312927246094 327.1548156738281 393.1542053222656 327.1583862304688 C 393.5522766113281 327.1842651367188 393.9489440917969 327.0910034179688 394.2937316894531 326.8904418945312 C 394.550048828125 326.7151794433594 394.6964416503906 326.4189453125 394.6800231933594 326.1088562011719 C 394.6664123535156 325.6401977539062 394.3597717285156 325.2306213378906 393.9139404296875 325.0855407714844 L 392.5262756347656 324.4260864257812 C 391.9671936035156 324.1824340820312 391.4734802246094 323.8103637695312 391.085205078125 323.3400573730469 C 390.7509155273438 322.9166870117188 390.5726013183594 322.3911437988281 390.5799560546875 321.851806640625 C 390.5404968261719 321.1673889160156 390.8143615722656 320.5021057128906 391.3241271972656 320.043701171875 C 391.9254455566406 319.5815734863281 392.6739196777344 319.3531188964844 393.4306945800781 319.4007873535156 C 393.9678344726562 319.3949584960938 394.5013732910156 319.4898071289062 395.0036315917969 319.6803894042969 C 395.4930419921875 319.8731384277344 395.93994140625 320.1600036621094 396.3188781738281 320.5247497558594 L 395.2832946777344 321.6675415039062 C 395.0016174316406 321.4109191894531 394.6857299804688 321.1945190429688 394.3446350097656 321.0245971679688 C 394.0621643066406 320.8860473632812 393.752197265625 320.8128051757812 393.4376525878906 320.810302734375 C 393.1102294921875 320.7903137207031 392.7861022949219 320.8850402832031 392.52099609375 321.0781860351562 C 392.1295471191406 321.4449462890625 392.0843811035156 322.0503845214844 392.4170227050781 322.4711608886719 C 392.5965270996094 322.6736755371094 392.8152770996094 322.8377075195312 393.0599365234375 322.9533081054688 L 394.3093566894531 323.5747680664062 C 394.8724670410156 323.8341674804688 395.3743896484375 324.2097473144531 395.7821044921875 324.6767578125 C 396.1188049316406 325.0809326171875 396.3002624511719 325.5919799804688 396.2937316894531 326.1179504394531 C 396.3359069824219 326.82568359375 396.0271911621094 327.5088195800781 395.4681701660156 327.9448547363281 C 394.7524108886719 328.409423828125 393.9053039550781 328.6291809082031 393.0539855957031 328.5711059570312 Z" fill="#00628b" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_rh2yeo =
//     '<svg viewBox="7.5 2.6 6.0 6.9" ><path transform="translate(-420.42, -328.09)" d="M 431.5211486816406 337.6307373046875 C 430.5544738769531 337.6927490234375 429.6023254394531 337.3710327148438 428.8713073730469 336.7355346679688 C 428.2119750976562 336.0478515625 427.8724975585938 335.114501953125 427.9358520507812 334.1639099121094 C 427.8790893554688 333.2494201660156 428.1618347167969 332.3460693359375 428.7298889160156 331.627197265625 C 429.3031311035156 331.0057067871094 430.1246643066406 330.6738586425781 430.9687194824219 330.7228393554688 C 431.773681640625 330.6741333007812 432.5602111816406 330.9766845703125 433.1251220703125 331.5521545410156 C 433.6757202148438 332.2276000976562 433.9484558105469 333.0873107910156 433.8880310058594 333.9565734863281 C 433.8879699707031 334.261962890625 433.8755187988281 334.548583984375 433.8505249023438 334.8164672851562 L 429.053466796875 334.8164672851562 L 429.053466796875 333.6989135742188 L 432.4066772460938 333.6989135742188 C 432.435302734375 333.2760009765625 432.3011474609375 332.8581848144531 432.0316772460938 332.531005859375 C 431.7579040527344 332.2493896484375 431.3753356933594 332.1004028320312 430.9831848144531 332.1227722167969 C 430.5416870117188 332.1008911132812 430.1165466308594 332.2924499511719 429.8404846191406 332.6376037597656 C 429.5428771972656 333.0651245117188 429.3990173339844 333.5809020996094 429.4322204589844 334.1007385253906 C 429.3926086425781 334.6806640625 429.60546875 335.2494506835938 430.0161743164062 335.6607971191406 C 430.480224609375 336.0441284179688 431.0732116699219 336.2357482910156 431.673828125 336.1965637207031 C 431.9622802734375 336.1967468261719 432.2506408691406 336.1810607910156 432.5374145507812 336.1494445800781 C 432.8199462890625 336.1179809570312 433.1076049804688 336.0751037597656 433.4004821777344 336.0208435058594 L 433.5612487792969 337.4523315429688 C 433.1866149902344 337.5225830078125 432.8082580566406 337.5708618164062 432.4281311035156 337.5970153808594 C 432.0870361328125 337.6191711425781 431.7846984863281 337.63037109375 431.5211486816406 337.6307373046875 Z" fill="#00628b" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_b2c6eq =
//     '<svg viewBox="14.6 2.8 6.8 9.7" ><path transform="translate(-448.83, -328.6)" d="M 465.828857421875 338.0212097167969 L 463.4302978515625 331.3656921386719 L 465.0628051757812 331.3656921386719 L 466.9212646484375 336.7525939941406 L 467.1848754882812 336.7525939941406 L 467.1848754882812 338.0212097167969 L 465.828857421875 338.0212097167969 Z M 463.5557250976562 341.0348205566406 L 463.4930419921875 339.6724243164062 L 464.5977783203125 339.5465087890625 C 464.9686279296875 339.5087585449219 465.3278198242188 339.3953247070312 465.6531372070312 339.2132873535156 C 465.9635009765625 339.0238647460938 466.2222900390625 338.7607116699219 466.4063720703125 338.4471740722656 C 466.6480712890625 338.030517578125 466.8317260742188 337.5827026367188 466.9523315429688 337.1163635253906 L 468.5783081054688 331.3646240234375 L 470.210693359375 331.3646240234375 L 468.32275390625 337.4313659667969 C 468.1260375976562 338.1102600097656 467.8375854492188 338.7590942382812 467.465576171875 339.3600769042969 C 467.1806640625 339.8117980957031 466.7894287109375 340.1868896484375 466.3259887695312 340.4524536132812 C 465.8368530273438 340.7097473144531 465.30078125 340.8655700683594 464.7498779296875 340.9105224609375 L 463.5557250976562 341.0348205566406 Z" fill="#00628b" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_b9zf3k =
//     '<svg viewBox="22.4 2.7 6.8 6.9" ><path transform="translate(-480.03, -328.35)" d="M 504.6410522460938 337.8935241699219 C 504.0508422851562 337.930908203125 503.4677734375 337.7473754882812 503.0054321289062 337.3786926269531 C 502.6046752929688 337.0037841796875 502.3915405273438 336.4698486328125 502.4241943359375 335.9219970703125 C 502.388916015625 335.2685241699219 502.680908203125 334.6402282714844 503.203125 334.2456359863281 C 503.8553466796875 333.818359375 504.6283569335938 333.6135559082031 505.4066162109375 333.6617736816406 C 505.7384643554688 333.6589050292969 506.070068359375 333.6800231933594 506.3988647460938 333.7249755859375 C 506.6762084960938 333.76513671875 506.9495239257812 333.8301696777344 507.21533203125 333.91943359375 L 506.9388427734375 335.0749816894531 C 506.6896362304688 335.0155639648438 506.4356079101562 334.9788208007812 506.1796875 334.9652099609375 C 505.945068359375 334.9551391601562 505.7000732421875 334.9499816894531 505.4446411132812 334.9495849609375 C 504.456787109375 334.9495849609375 503.9627685546875 335.2405700683594 503.9627685546875 335.8223876953125 C 503.9490966796875 336.0478210449219 504.0462646484375 336.2658081054688 504.2232055664062 336.4063415527344 C 504.4464721679688 336.554931640625 504.7125244140625 336.625732421875 504.9801635742188 336.6078186035156 C 505.3150634765625 336.6189270019531 505.6473388671875 336.5466003417969 505.9472045898438 336.3972473144531 C 506.1868286132812 336.2749938964844 506.3887939453125 336.0897827148438 506.5311889648438 335.8615112304688 C 506.65673828125 335.6609497070312 506.7239990234375 335.4294128417969 506.7256469726562 335.19287109375 L 506.7256469726562 334.6533508300781 L 507.0272827148438 336.361328125 L 506.4915161132812 336.361328125 L 506.711181640625 336.1604309082031 C 506.7157592773438 336.5008239746094 506.622802734375 336.83544921875 506.4432373046875 337.1247863769531 C 506.2703247070312 337.3854370117188 506.0216064453125 337.5869750976562 505.7307739257812 337.7023010253906 C 505.3836059570312 337.8371887207031 505.0133056640625 337.9021606445312 504.6410522460938 337.8935241699219 Z M 506.9324340820312 337.830322265625 L 506.8134765625 335.8593444824219 L 506.7251586914062 335.1183776855469 L 506.7251586914062 333.6466979980469 C 506.7467651367188 333.2973937988281 506.5694580078125 332.9656677246094 506.26708984375 332.7895202636719 C 505.8421630859375 332.5792236328125 505.3720703125 332.4766845703125 504.8982543945312 332.4911499023438 L 503.2406616210938 332.4477233886719 L 503.3665161132812 331.0473022460938 L 504.7728271484375 331.0659790039062 C 505.6923217773438 331.0104064941406 506.6044311523438 331.260986328125 507.3663940429688 331.7785339355469 C 507.9492797851562 332.2762756347656 508.2633056640625 333.0195922851562 508.2139282226562 333.7843627929688 L 508.2139282226562 336.3709716796875 L 509.2184448242188 336.5092163085938 L 509.2184448242188 337.7649536132812 L 506.9324340820312 337.830322265625 Z" fill="#00628b" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_naygs =
//     '<svg viewBox="30.4 0.0 5.6 9.4" ><path transform="translate(-512.01, -317.54)" d="M 542.397216796875 326.9603881835938 L 542.397216796875 317.5420532226562 L 543.9476928710938 317.5420532226562 L 543.9476928710938 326.9603881835938 L 542.397216796875 326.9603881835938 Z M 546.3966064453125 326.9603881835938 L 546.3966064453125 322.8159790039062 C 546.4182739257812 322.4900512695312 546.3201293945312 322.1675415039062 546.1206665039062 321.9088745117188 C 545.9219970703125 321.6912841796875 545.6359252929688 321.5747680664062 545.3417358398438 321.591796875 C 544.4130859375 321.591796875 543.94873046875 322.1964111328125 543.94873046875 323.40576171875 L 543.560302734375 321.5098266601562 L 544.0999145507812 321.5098266601562 C 544.1185302734375 321.1276245117188 544.2864990234375 320.76806640625 544.5675659179688 320.5084228515625 C 544.9071044921875 320.264892578125 545.3214721679688 320.1483764648438 545.7380981445312 320.178955078125 C 546.350341796875 320.1427001953125 546.947509765625 320.3778686523438 547.37060546875 320.8218994140625 C 547.7835693359375 321.3307495117188 547.9898681640625 321.9764404296875 547.9480590820312 322.6305541992188 L 547.9480590820312 326.9625244140625 L 546.3966064453125 326.9603881835938 Z" fill="#00628b" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_wxh2r =
//     '<svg viewBox="37.5 2.7 6.8 6.9" ><path transform="translate(-540.37, -328.35)" d="M 580.0549926757812 337.8935241699219 C 579.4647827148438 337.930908203125 578.8819580078125 337.7473754882812 578.41943359375 337.3786926269531 C 578.0187377929688 337.0037841796875 577.805908203125 336.4698486328125 577.8386840820312 335.9219970703125 C 577.8034057617188 335.2685852050781 578.0951538085938 334.640380859375 578.6171264648438 334.2456359863281 C 579.2695922851562 333.818359375 580.0426635742188 333.6134948730469 580.8212890625 333.6616821289062 C 581.153076171875 333.6589050292969 581.4846801757812 333.6800231933594 581.8132934570312 333.7249145507812 C 582.0906372070312 333.76513671875 582.36376953125 333.8301696777344 582.6292724609375 333.91943359375 L 582.3529052734375 335.0749816894531 C 582.1036987304688 335.0155029296875 581.8496704101562 334.978759765625 581.59375 334.9652099609375 C 581.3590698242188 334.9551391601562 581.114013671875 334.9499816894531 580.858642578125 334.9495849609375 C 579.8712158203125 334.9495849609375 579.3772583007812 335.2405700683594 579.3772583007812 335.8223876953125 C 579.363525390625 336.0478210449219 579.4607543945312 336.2659606933594 579.6376342773438 336.4063415527344 C 579.8609008789062 336.554931640625 580.126708984375 336.625732421875 580.394287109375 336.6078186035156 C 580.72900390625 336.6190490722656 581.0613403320312 336.5466003417969 581.3612060546875 336.3972473144531 C 581.6010131835938 336.2751159667969 581.8028564453125 336.08984375 581.9451293945312 335.8615112304688 C 582.0706176757812 335.6608581542969 582.1378173828125 335.4294128417969 582.1396484375 335.19287109375 L 582.1396484375 334.6533508300781 L 582.4412841796875 336.361328125 L 581.905517578125 336.361328125 L 582.1251831054688 336.1604309082031 C 582.12939453125 336.5008239746094 582.0364379882812 336.8353881835938 581.8573608398438 337.1247863769531 C 581.68408203125 337.3853759765625 581.4354858398438 337.5869140625 581.1448364257812 337.7023010253906 C 580.7976684570312 337.8371276855469 580.4273681640625 337.9021606445312 580.0549926757812 337.8935241699219 Z M 582.3463745117188 337.830322265625 L 582.2276000976562 335.8593444824219 L 582.1396484375 335.1183776855469 L 582.1396484375 333.6466979980469 C 582.1613159179688 333.2971801757812 581.9837646484375 332.9654846191406 581.68115234375 332.7895202636719 C 581.2561645507812 332.5792236328125 580.7861328125 332.4766845703125 580.3121948242188 332.4911499023438 L 578.6546630859375 332.4477233886719 L 578.780517578125 331.0473022460938 L 580.1868896484375 331.0659790039062 C 581.1063842773438 331.0104675292969 582.0183715820312 331.2610473632812 582.7804565429688 331.7785339355469 C 583.3631591796875 332.2763366699219 583.6773071289062 333.0195922851562 583.6279907226562 333.7843627929688 L 583.6279907226562 336.3709716796875 L 584.6325073242188 336.5092163085938 L 584.6325073242188 337.7649536132812 L 582.3463745117188 337.830322265625 Z" fill="#00628b" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_xpsl5e =
//     '<svg viewBox="44.8 0.8 6.4 8.8" ><path transform="translate(-569.89, -320.56)" d="M 614.73193359375 324.7245788574219 L 614.73193359375 323.3182678222656 L 620.885009765625 323.3182678222656 L 620.885009765625 324.7245788574219 L 614.73193359375 324.7245788574219 Z M 616.3585205078125 326.7716979980469 L 616.3585205078125 321.3070678710938 L 617.9024658203125 321.3070678710938 L 617.9024658203125 326.7716979980469 L 616.3585205078125 326.7716979980469 Z M 619.4534912109375 330.0997009277344 C 618.6097412109375 330.1756286621094 617.767333984375 329.9388732910156 617.0865478515625 329.4343872070312 C 616.5523681640625 328.8604431152344 616.2874755859375 328.0862121582031 616.3585205078125 327.3052978515625 L 616.3585205078125 326.3323974609375 L 617.9024658203125 326.3323974609375 L 617.9024658203125 327.1799621582031 C 617.8648681640625 327.5934448242188 618.0067138671875 328.0032653808594 618.2919921875 328.3050231933594 C 618.6640625 328.5736694335938 619.1207275390625 328.6986389160156 619.577880859375 328.6570129394531 C 619.7896728515625 328.6561279296875 620.00146484375 328.64453125 620.2120361328125 328.6221618652344 C 620.4378662109375 328.5989379882812 620.6951904296875 328.568603515625 620.984130859375 328.5310668945312 L 621.1346435546875 329.94970703125 C 620.8543701171875 330.0001525878906 620.5792236328125 330.0377807617188 620.30908203125 330.0628051757812 C 620.0390625 330.0877990722656 619.75390625 330.0998840332031 619.4534912109375 330.0992736816406 Z" fill="#00628b" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_qjqu =
//     '<svg viewBox="52.3 2.8 6.8 9.7" ><path transform="translate(-599.69, -328.6)" d="M 654.3666381835938 338.0212097167969 L 651.9680786132812 331.3656921386719 L 653.6004638671875 331.3656921386719 L 655.458984375 336.7525939941406 L 655.7225341796875 336.7525939941406 L 655.7225341796875 338.0212097167969 L 654.3666381835938 338.0212097167969 Z M 652.0933837890625 341.0348205566406 L 652.0307006835938 339.6724243164062 L 653.135986328125 339.5465087890625 C 653.5066528320312 339.5087585449219 653.8656005859375 339.3952941894531 654.1908569335938 339.2132873535156 C 654.5013427734375 339.0241088867188 654.7601928710938 338.7608642578125 654.9441528320312 338.4471435546875 C 655.1860961914062 338.0305786132812 655.3699951171875 337.5828247070312 655.490478515625 337.1163635253906 L 657.1165771484375 331.3646240234375 L 658.7489013671875 331.3646240234375 L 656.85888671875 337.4313659667969 C 656.662109375 338.1102600097656 656.3737182617188 338.7590942382812 656.0016479492188 339.3600769042969 C 655.7166137695312 339.8119201660156 655.3251342773438 340.1869812011719 654.861572265625 340.4524536132812 C 654.3726196289062 340.7097473144531 653.8367919921875 340.8656005859375 653.2859497070312 340.9105224609375 L 652.0933837890625 341.0348205566406 Z" fill="#00628b" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_kntql5 =
//     '<svg viewBox="49.2 25.5 1.0 1.0" ><path transform="translate(-576.51, -419.58)" d="M 625.7302856445312 445.0624694824219" fill="#5dc7ec" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_prqi2e =
//     '<svg viewBox="0.0 4.6 7.0 7.1" ><defs><linearGradient id="gradient" x1="5.107" y1="0.439" x2="0.106" y2="0.505"><stop offset="0.0" stop-color="#a17a9f" /><stop offset="0.118" stop-color="#a573ac" /><stop offset="0.208" stop-color="#9286bc" /><stop offset="0.308" stop-color="#76a2d6" /><stop offset="0.42" stop-color="#66c7db" /><stop offset="0.543" stop-color="#8bcbb7" /><stop offset="0.669" stop-color="#92c361" /><stop offset="0.789" stop-color="#b9ce3e" /><stop offset="0.915" stop-color="#efdc48" /><stop offset="1.0" stop-color="#f8c441" /></linearGradient></defs><path transform="translate(-502.14, -429.26)" d="M 509.118896484375 436.5458068847656 C 508.0130615234375 440.5071411132812 500.1997680664062 438.346435546875 502.5999755859375 434.1746215820312 L 504.0946655273438 433.8606872558594 C 502.3743896484375 436.3009948730469 505.7785034179688 438.3314514160156 507.4730834960938 436.5458068847656 L 506.4551391601562 436.5458068847656 L 507.2351684570312 435.0297241210938 L 509.152099609375 435.0297241210938 L 509.152099609375 436.5458068847656 L 509.118896484375 436.5458068847656 Z M 504.7986450195312 440.9100036621094 C 503.7459106445312 440.9673156738281 503.7421875 439.2395324707031 504.7986450195312 439.2962951660156 C 505.8518676757812 439.2379455566406 505.8577880859375 440.9716186523438 504.798095703125 440.9100036621094 Z M 506.6068115234375 440.9100036621094 C 505.5540771484375 440.9673156738281 505.55078125 439.2395324707031 506.6068115234375 439.2962951660156 C 507.658447265625 439.2379455566406 507.66650390625 440.9716186523438 506.6068115234375 440.9100036621094 Z" fill="url(#gradient)" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_mb6wml =
//     '<svg viewBox="6.5 0.0 4.9 7.3" ><defs><linearGradient id="gradient" x1="5.949" y1="0.435" x2="-1.158" y2="0.52"><stop offset="0.0" stop-color="#a17a9f" /><stop offset="0.118" stop-color="#a573ac" /><stop offset="0.208" stop-color="#9286bc" /><stop offset="0.308" stop-color="#76a2d6" /><stop offset="0.42" stop-color="#66c7db" /><stop offset="0.543" stop-color="#8bcbb7" /><stop offset="0.669" stop-color="#92c361" /><stop offset="0.789" stop-color="#b9ce3e" /><stop offset="0.915" stop-color="#efdc48" /><stop offset="1.0" stop-color="#f8c441" /></linearGradient></defs><path transform="translate(-528.13, -410.82)" d="M 538.500244140625 416.5929565429688 L 539.5514526367188 416.5929565429688 L 539.5514526367188 418.1090393066406 C 538.833984375 418.0951538085938 537.6423950195312 418.225830078125 537.0933227539062 417.7409973144531 C 536.5189819335938 418.2231750488281 535.342041015625 418.0956420898438 534.6134033203125 418.1090393066406 L 534.6134033203125 416.5929565429688 C 536.9432983398438 416.914306640625 536.18896484375 415.6779174804688 536.302490234375 414.0706787109375 L 537.8723754882812 413.2364807128906 C 538.0770263671875 413.7979431152344 537.3156127929688 416.7847595214844 538.500244140625 416.5929565429688 Z M 535.5123901367188 412.4457092285156 C 534.447265625 412.5051879882812 534.438232421875 410.7581176757812 535.5123901367188 410.8218688964844 C 536.5618896484375 410.7575378417969 536.552734375 412.5062255859375 535.5123901367188 412.4457092285156 Z M 537.3204956054688 412.4457092285156 C 536.2555541992188 412.5051879882812 536.2463989257812 410.7581176757812 537.3204956054688 410.8218688964844 C 538.37060546875 410.7575378417969 538.362548828125 412.5062255859375 537.3204956054688 412.4457092285156 Z" fill="url(#gradient)" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_i4eje4 =
//     '<svg viewBox="10.9 2.2 6.2 5.1" ><defs><linearGradient id="gradient" x1="4.031" y1="0.426" x2="-1.615" y2="0.538"><stop offset="0.0" stop-color="#a17a9f" /><stop offset="0.118" stop-color="#a573ac" /><stop offset="0.208" stop-color="#9286bc" /><stop offset="0.308" stop-color="#76a2d6" /><stop offset="0.42" stop-color="#66c7db" /><stop offset="0.543" stop-color="#8bcbb7" /><stop offset="0.669" stop-color="#92c361" /><stop offset="0.789" stop-color="#b9ce3e" /><stop offset="0.915" stop-color="#efdc48" /><stop offset="1.0" stop-color="#f8c441" /></linearGradient></defs><path transform="translate(-545.6, -419.81)" d="M 556.449462890625 427.1015319824219 L 556.449462890625 425.5853881835938 C 557.9110717773438 425.6245422363281 559.9280395507812 425.6732482910156 560.91064453125 424.5894775390625 C 559.9216918945312 423.0213317871094 558.740966796875 423.262939453125 557.380615234375 424.4287719726562 L 557.380615234375 423.064697265625 C 559.0606689453125 420.8971252441406 562.4349365234375 422.5531311035156 562.6105346679688 425.0030212402344 C 561.21337890625 426.9242553710938 558.6852416992188 427.244140625 556.449462890625 427.1015319824219 Z" fill="url(#gradient)" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_ycgqp0 =
//     '<svg viewBox="18.5 0.3 3.3 7.0" ><defs><linearGradient id="gradient" x1="5.202" y1="0.434" x2="-5.341" y2="0.59"><stop offset="0.0" stop-color="#a17a9f" /><stop offset="0.118" stop-color="#a573ac" /><stop offset="0.208" stop-color="#9286bc" /><stop offset="0.308" stop-color="#76a2d6" /><stop offset="0.42" stop-color="#66c7db" /><stop offset="0.543" stop-color="#8bcbb7" /><stop offset="0.669" stop-color="#92c361" /><stop offset="0.789" stop-color="#b9ce3e" /><stop offset="0.915" stop-color="#efdc48" /><stop offset="1.0" stop-color="#f8c441" /></linearGradient></defs><path transform="translate(-576.15, -412.04)" d="M 596.7236328125 419.3315124511719 C 593.7127075195312 419.4996948242188 594.9019775390625 414.9089050292969 594.6775512695312 413.18115234375 L 596.2472534179688 412.3475036621094 L 596.2472534179688 417.18798828125 C 596.1375122070312 418.111083984375 597.4065551757812 417.7451782226562 597.9370727539062 417.8158264160156 L 597.9370727539062 419.3320617675781 L 596.7236328125 419.3315124511719 Z" fill="url(#gradient)" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_d4myki =
//     '<svg viewBox="21.2 2.4 4.9 7.4" ><defs><linearGradient id="gradient" x1="2.905" y1="0.482" x2="-4.192" y2="0.538"><stop offset="0.0" stop-color="#a17a9f" /><stop offset="0.118" stop-color="#a573ac" /><stop offset="0.208" stop-color="#9286bc" /><stop offset="0.308" stop-color="#76a2d6" /><stop offset="0.42" stop-color="#66c7db" /><stop offset="0.543" stop-color="#8bcbb7" /><stop offset="0.669" stop-color="#92c361" /><stop offset="0.789" stop-color="#b9ce3e" /><stop offset="0.915" stop-color="#efdc48" /><stop offset="1.0" stop-color="#f8c441" /></linearGradient></defs><path transform="translate(-587.06, -420.5)" d="M 612.145263671875 426.2691955566406 L 613.1964111328125 426.2691955566406 L 613.1964111328125 427.7853088378906 C 612.4794921875 427.7713928222656 611.28759765625 427.9020690917969 610.7384033203125 427.417236328125 C 610.1640014648438 427.8994445800781 608.9869384765625 427.7718811035156 608.2584228515625 427.7853088378906 L 608.2584228515625 426.2691955566406 C 610.5883178710938 426.5906372070312 609.8340454101562 425.3540954589844 609.9481201171875 423.7469177246094 L 611.517822265625 422.9127502441406 C 611.7219848632812 423.4736328125 610.961181640625 426.4609375 612.145263671875 426.2691955566406 Z M 609.2109985351562 428.7169494628906 C 610.2674560546875 428.6601867675781 610.2647705078125 430.388427734375 609.2109985351562 430.330078125 C 608.1464233398438 430.388427734375 608.1400146484375 428.6532287597656 609.2109985351562 428.7191772460938 Z M 611.0202026367188 428.7169494628906 C 612.0670776367188 428.6532287597656 612.0606079101562 430.388427734375 611.0202026367188 430.330078125 C 609.9544677734375 430.3879699707031 609.94873046875 428.6537170410156 611.0202026367188 428.7191772460938 Z" fill="url(#gradient)" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_nx4agv =
//     '<svg viewBox="25.6 2.4 10.8 5.0" ><defs><linearGradient id="gradient" x1="1.027" y1="0.483" x2="-2.222" y2="0.911"><stop offset="0.0" stop-color="#a17a9f" /><stop offset="0.118" stop-color="#a573ac" /><stop offset="0.208" stop-color="#9286bc" /><stop offset="0.308" stop-color="#76a2d6" /><stop offset="0.42" stop-color="#66c7db" /><stop offset="0.543" stop-color="#8bcbb7" /><stop offset="0.669" stop-color="#92c361" /><stop offset="0.789" stop-color="#b9ce3e" /><stop offset="0.915" stop-color="#efdc48" /><stop offset="1.0" stop-color="#f8c441" /></linearGradient></defs><path transform="translate(-604.53, -420.5)" d="M 630.10009765625 427.7853088378906 L 630.10009765625 426.2691955566406 C 632.1868286132812 426.4127197265625 631.9597778320312 426.1351928710938 631.93017578125 424.2552185058594 L 633.4999389648438 423.4211120605469 C 633.6799926757812 423.9793701171875 632.9904174804688 426.4385070800781 634.1279296875 426.2691955566406 C 636.1015625 426.5793762207031 635.5111694335938 425.3289489746094 635.5899658203125 423.9959716796875 L 637.1600952148438 423.1725463867188 C 637.3540649414062 423.72705078125 636.6292114257812 426.4480285644531 637.7772827148438 426.2691955566406 C 639.92041015625 426.6061401367188 639.1029052734375 425.1156616210938 639.2501831054688 423.7469177246094 L 640.8311157226562 422.9127502441406 C 641.0652465820312 426.6093139648438 640.7201538085938 428.9130554199219 636.3699951171875 427.3851623535156 C 635.2244262695312 427.9882202148438 633.8551635742188 427.9882202148438 632.7097778320312 427.3851623535156 C 632.1316528320312 427.9326477050781 630.8506469726562 427.7617492675781 630.10009765625 427.7853088378906 Z" fill="url(#gradient)" stroke="none" stroke-width="1.866653561592102" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_d6ide5 =
//     '<svg viewBox="16.7 328.0 356.6 1.0" ><path transform="translate(7.96, 328.0)" d="M 365.3515625 0 L 8.718750953674316 0" fill="none" fill-opacity="0.25" stroke="#364863" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
