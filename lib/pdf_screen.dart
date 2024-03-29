// ignore_for_file: prefer_const_constructors, avoid_web_libraries_in_flutter, non_constant_identifier_names

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'invoice.dart';

class PDFscreen extends StatefulWidget {
  const PDFscreen({super.key});

  @override
  State<PDFscreen> createState() => _PDFscreenState();
}

class _PDFscreenState extends State<PDFscreen> {
  Invoice? myInvoice;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    myInvoice = ModalRoute.of(context)?.settings.arguments as Invoice?;
    myInvoice?.display();


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF SCREEN"),
        centerTitle: true,
      ),
      body: PdfPreview(
        build: (format) {
          return genPdf();
        },
      ),
    );
  }




  Future<Uint8List> genPdf() {
    pw.Document doc = pw.Document();

    doc.addPage(pw.Page(
      build: (context) {

        return pw.Container(
          decoration: pw.BoxDecoration(
            border: pw.Border.all(color: PdfColors.lightGreen),
          ),
          child: pw.Column(
            children: [
              pw.Container(
                margin: pw.EdgeInsets.only(top: 8, left: 8, right: 8),
                padding: pw.EdgeInsets.all(8),
                color: PdfColors.grey,
                width: double.infinity,
                height: 30,
                child: pw.Center(child: pw.Text("INVOICE")),
              ),
              pw.Container(
                margin: pw.EdgeInsets.only(left: 8, right: 8),
                width: double.infinity,
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.white),
                  color: PdfColors.white,
                ),
                // padding: pw.EdgeInsets.all(8),
                height: 90,
                child: pw.Column(
                  children: [
                    pw.Center(
                        child: pw.Text("Red&White Multimedia Educatoin.LTD",
                            style: pw.TextStyle(fontSize: 20))),
                    pw.SizedBox(height: 5),
                    pw.Center(
                        child: pw.Text(
                            "Bapasitaram Chowk,Mavdibypass road,Rajkot",
                            style: pw.TextStyle(fontSize: 15))),
                    pw.SizedBox(height: 2),
                    pw.Center(
                        child: pw.Text("Tel:- 0281 2380707,9025719",
                            style: pw.TextStyle(fontSize: 15))),
                    pw.SizedBox(height: 2),
                    pw.Center(
                        child: pw.Text("Mo:- 6351087705,",
                            style: pw.TextStyle(fontSize: 15))),
                  ],
                ),
              ),
              pw.Divider(),
              pw.Container(
                margin: pw.EdgeInsets.only(top: 8, left: 8, right: 8),
                padding: pw.EdgeInsets.all(8),
                color: PdfColors.grey,
                width: double.infinity,
                height: 30,
                child: pw.Center(
                    child: pw.Text("Customer Details",
                        style: pw.TextStyle(fontSize: 15))),
              ),
              pw.SizedBox(height: 5),
              pw.Row(
                children: [
                  pw.Container(
                    margin: pw.EdgeInsets.only(left: 45),
                    width: 100,
                    height: 30,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black),
                    ),
                    child: pw.Center(
                        child: pw.Text(
                          "Customer Name",
                          style: pw.TextStyle(fontSize: 13),
                        )),
                  ),
                  pw.Container(
                    width: 100,
                    height: 30,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black),
                    ),
                    child: pw.Center(
                        child: pw.Text(
                          "${myInvoice?.cust_name??""}",
                          style: pw.TextStyle(fontSize: 13),
                        )),
                  ),
                  pw.Container(
                    width: 100,
                    height: 30,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black),
                    ),
                    child: pw.Center(
                        child: pw.Text(
                          "Invoice Number",
                          style: pw.TextStyle(fontSize: 13),
                        )),
                  ),
                  pw.Container(
                    margin: pw.EdgeInsets.only(right: 4),
                    width: 100,
                    height: 30,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black),
                    ),
                    child: pw.Center(
                        child: pw.Text(
                          "${myInvoice?.invoice_no??""}",
                          style: pw.TextStyle(fontSize: 13),
                        )),
                  ),
                ],
              ),
              pw.Row(
                children: [
                  pw.Container(
                    margin: pw.EdgeInsets.only(left: 45),
                    width: 100,
                    height: 30,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black),
                    ),
                    child: pw.Center(
                        child: pw.Text(
                          "Customer Address",
                          style: pw.TextStyle(fontSize: 11),
                        )),
                  ),
                  pw.Container(
                    width: 100,
                    height: 30,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black),
                    ),
                    child: pw.Center(
                        child: pw.Text(
                          "${myInvoice?.address??""}",
                          style: pw.TextStyle(fontSize: 10),
                        )),
                  ),
                  pw.Container(
                    width: 100,
                    height: 30,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black),
                    ),
                    child: pw.Center(
                        child: pw.Text(
                          "Sales Date",
                          style: pw.TextStyle(fontSize: 10),
                        )),
                  ),
                  pw.Container(
                    margin: pw.EdgeInsets.only(right: 4),
                    width: 100,
                    height: 30,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black),
                    ),
                    child: pw.Center(
                        child: pw.Text(
                          "${myInvoice?.sales_date??""}",
                          style: pw.TextStyle(fontSize: 10),
                        )),
                  ),
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Row(
                children: [
                  pw.Container(
                    margin: pw.EdgeInsets.only(left: 45),
                    width: 300,
                    height: 30,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black),
                      color: PdfColors.grey700,
                    ),
                    child: pw.Center(
                        child: pw.Text(
                          "Description",
                          style: pw.TextStyle(fontSize: 16),
                        )),
                  ),
                  pw.Container(
                    margin: pw.EdgeInsets.only(right: 4),
                    width: 100,
                    height: 30,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black),
                      color: PdfColors.grey700,
                    ),
                    child: pw.Center(
                        child: pw.Text(
                          "AMOUNT",
                          style: pw.TextStyle(fontSize: 16),
                        )),
                  ),
                ],
              ),
              pw.Row(
                children: [
                  pw.Container(
                    padding: pw.EdgeInsets.all(7),
                    margin: pw.EdgeInsets.only(left: 45),
                    width: 300,
                    height: 300,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black),
                      // color: PdfColors.grey700,
                    ),
                    child: pw.Column(
                      children: [
                        pw.Text("Product Name :- ${myInvoice?.product_name??""}",
                            style: pw.TextStyle(fontSize: 16)),
                        pw.SizedBox(height: 4),
                        pw.Text("Product Type:- ${myInvoice?.product_type??""}",
                            style: pw.TextStyle(fontSize: 16)),
                        pw.Text("Product Price:- ${myInvoice?.product_price??""}",
                            style: pw.TextStyle(fontSize: 16)),
                        pw.SizedBox(height: 170),
                        pw.Divider(),
                        pw.Text("Tax Type :~ ${myInvoice?.tax_type??""}",
                            style: pw.TextStyle(fontSize: 16)),
                        pw.Text("Tax Rate :~ ${myInvoice?.tax_rate??""}",
                            style: pw.TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                  pw.Container(
                    margin: pw.EdgeInsets.only(right: 4),
                    padding: pw.EdgeInsets.all(7),
                    width: 100,
                    height: 300,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black),
                      // color: PdfColors.grey700,
                    ),
                    child: pw.Column(
                      children: [
                        pw.SizedBox(height: 20),
                        pw.Text("${myInvoice?.total??""}", style: pw.TextStyle(fontSize: 16)),
                        pw.SizedBox(height: 190),
                        pw.Divider(),
                        pw.Text("${myInvoice?.tax_amount??""}", style: pw.TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ],
              ),
              pw.Row(
                children: [
                  pw.Container(
                    margin: pw.EdgeInsets.only(left: 45),
                    padding: pw.EdgeInsets.all(7),
                    width: 300,
                    height: 30,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black),
                    ),
                    child: pw.Center(
                        child: pw.Text(
                          "Total Payable Amount :~ ",
                          style: pw.TextStyle(fontSize: 13,fontBold:pw.Font.courierBold()),
                        )),
                  ),
                  pw.Container(
                    margin: pw.EdgeInsets.only(right: 4),
                    width: 100,
                    height: 30,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black),
                    ),
                    child: pw.Center(
                        child: pw.Text(
                          "${myInvoice?.payamount??""} ",
                          style: pw.TextStyle(fontSize: 16),
                        )),
                  ),
                ],
              ),
              pw.SizedBox(height: 60),
              pw.Text("his is Autogenerated Invoice it's Doesn't Need Signature"),
            ],
          ),
        );
      },
    ));

    return doc.save();
  }
}

/*
String? cust_name;
String? invoice_no;
String? product_name;
String? product_type;
String? tax_type;

String? product_quantity1;
String? product_price1;
String? tax_rate1;
String? total1;

 */
