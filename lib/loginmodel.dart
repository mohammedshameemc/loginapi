class loginmodel{
  String invoice;
  String Costomername;
  String pending;
  String amount;

  loginmodel(
      {required this.invoice,
    required this.Costomername,
    required this.pending,
        required this.amount

});


  factory loginmodel.fromJson(Map<String, dynamic> json) => loginmodel(
    invoice: json["VoucherNo"],
    Costomername: json["CustomerName"],
    pending: json["Status"],
    amount: json["GrandTotal"],

  );
}
