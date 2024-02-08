import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginapi/loginprovider.dsrt.dart';
import 'package:provider/provider.dart';

import 'List.dart';

class loginscreen extends StatelessWidget {
  const loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: AlignmentDirectional.topEnd,
              colors: [
            Colors.blue.shade200,
            Colors.white,
            Colors.blue.shade500
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            title: Text(
          "LOGIN SCREEN",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  color: Colors.blue.shade50,
                  child:
                      Consumer<LoginProvider>(builder: (context, val, child) {
                    return TextFormField(controller: val.usernameController,
                      decoration: InputDecoration(
                        labelText: "User Name",
                      ),
                    );
                  })),
              SizedBox(
                height: 30,
              ),
              Container(
                  color: Colors.blue.shade50,
                  child: Consumer<LoginProvider>(
                    builder: (context,val,child) {
                      return TextFormField(controller: val.passwordController,
                        decoration: InputDecoration(labelText: "Password "),
                      );
                    }
                  )),
              SizedBox(
                height: 30,
              ),
              Consumer<LoginProvider>(
                builder: (context,value,child) {
                  return InkWell(
                    onTap: () {
                      value.getDetials(context);

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => Listpage(),
                      //     ));
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade400,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: Text("Login",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white))),
                    ),
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
