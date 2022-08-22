import 'dart:io';
import 'package:flutter/services.dart';
import 'package:madmooon/pages/Offer/api/pdf_api.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

import '../model/invoice.dart';
import '../utils.dart';

class PdfInvoiceApi {
  static Future<File> generate(Invoice invoice) async {
    var arabicFont = Font.ttf(await rootBundle.load("fonts/Hacen Tunisia.ttf"));
    final pdf = pw.Document();
    DateTime dateTime = DateTime.parse(invoice.supplier.date);
    String formateDate = "${dateTime.day}-${dateTime.month}-${dateTime.year}";
    // final paymentTerms = '${invoice.info.dueDate.difference(invoice.info.date).inDays} days';

    final image = await imageFromAssetBundle('images/Splach_Screen/splash.png');
    // final data = <String>[
    //   invoice. info.number,
    //   Utils.formatDate(invoice.info.date),
    //   paymentTerms,
    //   Utils.formatDate(invoice.info.dueDate),
    // ];
    pdf.addPage(MultiPage(
      theme: ThemeData.withFont(
        base: arabicFont,
      ),
      pageFormat: PdfPageFormat.a4,
      build: (context) => [
        ///       ///////////////////////////   1
        Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      pw.Container(
                        width: 100,
                        height: 100,
                        child: pw.Image(image),
                      )
                    ]),
                Row(
                  children: [
                    ///  buildSupplierAddress(invoice.supplier),

                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Center(
                                          child: Text('مؤسسة دار الرعاية',
                                              style: TextStyle(
                                                  font: arabicFont,
                                                  fontSize: 16)))),
                                  Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Center(
                                          child: Text(formateDate,
                                              style: TextStyle(
                                                  font: arabicFont,
                                                  fontSize: 16)))),
                                  Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Center(
                                          child: Text(

                                                  'رقم عرض السعر '+
                                                 invoice.supplier.offernumber +" : " ,
                                              style: TextStyle(
                                                  font: arabicFont,
                                                  fontSize: 16)))),
                                  //Text("invoice.customer.name", style: TextStyle(fontWeight: FontWeight.bold)),
                                  //Text(invoice.customer.address),
                                ],
                              ),

                              ///     //////////////////////  buildInvoiceInfo
                            ],
                          ),
                          SizedBox(width: 200),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(invoice.supplier.name,
                                  style: TextStyle(
                                      font: arabicFont, fontSize: 14)),
                              SizedBox(height: 1 * PdfPageFormat.mm),
                              Text(invoice.supplier.address,
                                  style: TextStyle(
                                      font: arabicFont, fontSize: 14)),
                              Container(
                                height: 20,
                                width: 20,
                                child: BarcodeWidget(
                                  barcode: Barcode.qrCode(),
                                  data: "عرض سعر من مضمون",
                                ),
                              ),
                            ],
                          ),
                        ])
                  ],
                ),

                ///        address

                ///   end address
              ],
            )),

        /// ///////////////////////////   2
        SizedBox(height: 1 * PdfPageFormat.cm),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Directionality(
                textDirection: TextDirection.rtl,
                child: Center(
                    child: Text('عرض سعر',
                        style: TextStyle(font: arabicFont, fontSize: 20)))),
            Directionality(
                textDirection: TextDirection.rtl,
                child: pw.Column(children: [
                  Divider(),

                  Text(invoice.supplier.body,
                      style: TextStyle(font: arabicFont)),
                  //   Directionality(
                  //       textDirection: TextDirection.rtl,
                  //       child:
                  //       pw.Column(
                  //           children: [
                  //             Divider(),
                  //             RichText(
                  //               text: TextSpan(
                  //                 text: 'Hello ',
                  //
                  //                 children: const <TextSpan>[
                  //
                  //                   TextSpan(text: 'لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أ غنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،غ،غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن ا'),
                  //
                  //
                  //
                  //                 ],
                  //               ),
                  //             ),
                  //
                  //
                  //
                  //           ]
                  //       )),
                ])),

            // Directionality(
            //     textDirection: TextDirection.rtl,
            //     child:
            //     pw.Column(
            //         children: [
            //           Divider(),
            //           RichText(
            //             text: TextSpan(
            //               text: 'Hello ',
            //
            //               children: const <TextSpan>[
            //
            //                 TextSpan(text: 'لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أ غنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،غ،غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن ا'),
            //
            //
            //
            //               ],
            //             ),
            //           ),
            //
            //
            //
            //         ]
            //     )),
            // Directionality(
            //     textDirection: TextDirection.rtl,
            //     child:
            //     pw.Column(
            //         children: [
            //           Divider(),
            //           RichText(
            //             text: TextSpan(
            //
            //
            //               children: const <TextSpan>[
            //
            //                 TextSpan(text:"لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك، من عمل عملا أشرك فيه معي غ،لى أنا أغنى الشركاء عن الشرك"),
            //
            //
            //
            //               ],
            //             ),
            //           ),
            //
            //
            //
            //         ]
            //     )),
          ],
        ),

        ///      /////////////////////   3

        Divider(),

        ///  /////////////////////////  4
        TotalAndPrice(arabicFont, invoice)
      ],
      footer: (context) => buildFooter(invoice),
    ));

    return PdfApi.saveDocument(name: 'مضمون.pdf', pdf: pdf);
  }

  static pw.Container TotalAndPrice(pw.Font arabicFont, Invoice invoice) {
    return Container(
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Spacer(flex: 6),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Directionality(
                    textDirection: TextDirection.rtl,
                    child: buildText(
                      title: '      الاجمالي',
                      value: Utils.formatPrice(
                          double.parse(invoice.supplier.offer_price)),
                      unite: true,
                      titleStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          font: arabicFont),
                    )),
                Directionality(
                    textDirection: TextDirection.rtl,
                    child: buildText(
                      title: '      الضريبه  ',
                      value:
                          Utils.formatPrice(double.parse(invoice.supplier.Vat)),
                      unite: true,
                      titleStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          font: arabicFont),
                    )),
                Divider(),
                Directionality(
                    textDirection: TextDirection.rtl,
                    child: buildText(
                      title: '       الاجمالي مع الضريبة         ',
                      titleStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          font: arabicFont),
                      value: Utils.formatPrice(
                          double.parse(invoice.supplier.offer_price) +
                              double.parse(invoice.supplier.Vat)),
                      unite: true,
                    )),
                SizedBox(height: 2 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
                SizedBox(height: 0.5 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildTotal(Invoice invoice) {
    // final netTotal = invoice.items
    //     .map((item) => item.unitPrice * item.quantity)
    //     .reduce((item1, item2) => item1 + item2);
    // final vatPercent = invoice.items.first.vat;
    // final vat = netTotal * vatPercent;
    // final total = netTotal + vat;

    return Container(
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Spacer(flex: 6),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // buildText(
                //   title: 'Net total',
                //   value: Utils.formatPrice(netTotal),
                //   unite: true,
                //   titleStyle: TextStyle(
                //     fontSize: 14,
                //     fontWeight: FontWeight.bold,
                //
                //   ),
                // ),
                // buildText(
                //   title: 'Vat ${vatPercent * 100} %',
                //   value: Utils.formatPrice(vat),
                //   unite: true,
                // ),
                Divider(),
                // buildText(
                //   title: 'Total amount due',
                //   titleStyle: TextStyle(
                //     fontSize: 14,
                //     fontWeight: FontWeight.bold,
                //   ),
                //   value: Utils.formatPrice(total),
                //   unite: true,
                //
                // ),
                SizedBox(height: 2 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
                SizedBox(height: 0.5 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildFooter(Invoice invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(),
          SizedBox(height: 2 * PdfPageFormat.mm),
          buildSimpleText(
            title: 'Address',
            value: invoice.supplier.address,
          ),
          SizedBox(height: 1 * PdfPageFormat.mm),
          buildSimpleText(title: 'Paypal', value: invoice.supplier.paymentInfo),
        ],
      );

  static buildSimpleText({
    required String title,
    required String value,
  }) {
    final style = TextStyle(
      fontWeight: FontWeight.bold,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        Text(title, style: style),
        SizedBox(width: 2 * PdfPageFormat.mm),
        Text(value),
      ],
    );
  }

  static buildText({
    required String title,
    required String value,
    double width = double.infinity,
    TextStyle? titleStyle,
    bool unite = false,
  }) {
    final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);

    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(title, style: style)),
          Text(value, style: unite ? style : null),
        ],
      ),
    );
  }
}
