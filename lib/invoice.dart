// ignore_for_file: non_constant_identifier_names
class Invoice{
  String? cust_name;
  String? invoice_no;
  String? product_name;
  String? product_type;
  String? tax_type;
  String? address;
  String? sales_date;

  int? product_quantity;
  int? product_price;
  int? tax_rate;
  double? tax_amount;
  int? total;
  double? payamount;

  void display(){
    print("name $cust_name");
  }

}