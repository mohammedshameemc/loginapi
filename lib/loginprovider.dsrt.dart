import 'dart:convert';
// import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loginapi/loginmodel.dart';
import 'package:loginapi/loginscreen.dart';

import 'List.dart';
// import 'package:logincredential/sales_list.dart';

class LoginProvider extends ChangeNotifier {
  List<loginmodel> loginlist=[];
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String apiUrl = "https://api.accounts.vikncodes.com/api/v1/users/login";
  String apiUrl1 = "https://www.api.viknbooks.com/api/v10/sales/sale-list-page/";
  String token = "";

  Future getDetials(BuildContext context) async {
    http.Response response;

    response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': usernameController.text,
        'password': passwordController.text,
        'is_mobile': true,
      }),
    );
    print(response.body);
    token = jsonDecode(response.body)['data']['access'];
    print("token=$token");
    if (response.statusCode == 200) {

      SalesDetials(context);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Listpage(),
          ));
    }

    notifyListeners();
  }

  Future SalesDetials(BuildContext context) async {

    Map<String, dynamic> parameters={
      'BranchID': 1,
    'CompanyID': "1901b825-fe6f-418d-b5f0-7223d0040d08",
    'CreatedUserID': 62,
    'PriceRounding': 3,
    'page_no': 1,
    'items_per_page': 10,
    'type': "Sales",
    'WarehouseID':1
    };
    http.Response response;
    response = await http.post(
      Uri.parse(apiUrl1),
      headers: {'Content-Type': 'application/json',
                  'Authorization':"Bearer $token"

      },
      body: jsonEncode(parameters),
    );


    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {

 final Map<String, dynamic> data=json.decode(response.body);
 final List<dynamic> results =data['data'];
 loginlist= results.map((e) => loginmodel(
     invoice:  e['VoucherNo'],
     Costomername: e['CustomerName'],
     pending: e['Status'],
     amount: e['GrandTotal'].toString())).toList();
 notifyListeners();
    }




    notifyListeners();


    notifyListeners();
  }
}
