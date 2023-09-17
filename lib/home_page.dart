// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:invoice_gen/invoice.dart';
import 'package:invoice_gen/util.dart';

import 'constant.dart';

class HomePage extends StatefulWidget {
  // const HomePage({super.key});
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
TextEditingController customernameController = TextEditingController();
TextEditingController invoice_numberController = TextEditingController();
TextEditingController product_nameController = TextEditingController();
TextEditingController product_typeController = TextEditingController();
TextEditingController quantityController = TextEditingController();
TextEditingController priceController = TextEditingController();
TextEditingController tax_typeController = TextEditingController();
TextEditingController tax_percentageController = TextEditingController();
TextEditingController address_Controller = TextEditingController();
TextEditingController sales_dateController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();
class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
          appBar: (AppBar(
          title: Text("Invoice Generator"),
          centerTitle: true,
        )),
        body:Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: customernameController,
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return "Enter Customer Name";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(hintText: "Customer Name", hintStyle: TextStyle(color: Colors.grey),contentPadding: EdgeInsets.all(5)),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: address_Controller,
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return "Enter Customer Address";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(hintText: "Customer City", hintStyle: TextStyle(color: Colors.grey),contentPadding: EdgeInsets.all(5)),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: sales_dateController,
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return "Enter Sales Date";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(hintText: "Sales Date", hintStyle: TextStyle(color: Colors.grey),contentPadding: EdgeInsets.all(5)),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: invoice_numberController,
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return "Enter Invoice Number";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(hintText: "Invoide Number", hintStyle: TextStyle(color: Colors.grey),contentPadding: EdgeInsets.all(5)),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: product_nameController,
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return "Enter Product Name";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(hintText: "Product Name", hintStyle: TextStyle(color: Colors.grey),contentPadding: EdgeInsets.all(5)),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: product_typeController,
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return "Enter Product Type";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(hintText: "Type", hintStyle: TextStyle(color: Colors.grey),contentPadding: EdgeInsets.all(5)),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                        child:TextFormField(
                          controller: quantityController,
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return "Enter Quantity ";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(hintText: "Quantity", hintStyle: TextStyle(color: Colors.grey),contentPadding: EdgeInsets.all(5)),
                        ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child:TextFormField(

                        controller: priceController,
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return "Enter Price";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(hintText: "Price", hintStyle: TextStyle(color: Colors.grey),contentPadding: EdgeInsets.all(5)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                      child:TextFormField(
                        controller: tax_typeController,
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return "Enter Tax Type";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(hintText: "Tax Type", hintStyle: TextStyle(color: Colors.grey),contentPadding: EdgeInsets.all(5)),
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child:TextFormField(
                        controller: tax_percentageController,
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return "Enter Tax Percentage";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(hintText: "Tax %", hintStyle: TextStyle(color: Colors.grey),contentPadding: EdgeInsets.all(5)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60),
                ElevatedButton(
                    onPressed: ()  {
                      if (formKey.currentState?.validate() ?? false) {
                        FocusScope.of(context).unfocus(); // For keyboard Close
                        formKey.currentState?.save();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Save Successfully"),
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.red,
                          action: SnackBarAction(
                            label: "Send",
                            onPressed: () {},
                          ),
                        ));
                        invoice.cust_name=customernameController.text;
                        invoice.invoice_no=invoice_numberController.text;
                        invoice.product_name=product_nameController.text;
                        invoice.product_type=product_typeController.text;
                        invoice.tax_type=tax_typeController.text;
                        invoice.address=address_Controller.text;
                        invoice.sales_date=sales_dateController.text;

                        invoice.product_price = int.parse(priceController.text);
                        invoice.product_quantity = int.parse(quantityController.text);
                        invoice.tax_rate = int.parse(tax_percentageController.text);

                        invoice.total=(invoice.product_quantity!*invoice.product_price!);

                        invoice.tax_amount=(invoice.tax_rate!/100*invoice.total!);

                        invoice.payamount=(invoice.total!+invoice.tax_amount!);
                        Navigator.pushNamed(context,pdfScreenRoute,arguments: invoice);
                      } else {
                        print("Invalid");
                      }
                    },
                    child: Text("Save")),
              ],
            ),
          ),
        )
      ),
    );
  }
}
