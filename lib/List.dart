import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginapi/loginprovider.dsrt.dart';
import 'package:provider/provider.dart';

class Listpage extends StatelessWidget {
  const Listpage({super.key});

  @override
  Widget build(BuildContext context) {
    

    return  SafeArea(
      child: Scaffold(

appBar: AppBar(toolbarHeight: 100,elevation: 5,shadowColor: Colors.black,title:Text("Sales Estimate") ,leading: Icon(Icons.arrow_back_ios_new),actions: [Icon(Icons.add,color: Colors.blue,size:40,)]),
        body:

Padding(
  padding: const EdgeInsets.all(8.0),
  child:   SingleChildScrollView(
    child: Column(

      children: [

              Container(color: Colors.grey.shade200

              ,child: TextFormField(style: TextStyle(color: Colors.grey,),decoration: InputDecoration(suffix: Padding(

                padding: const EdgeInsets.all(8.0),

                child: Icon(Icons.search),

              )))),

          Consumer<LoginProvider>(
            builder: (context,value,child) {
              return SizedBox(height: 600,

                child:value.loginlist.isNotEmpty?
                
                ListView.builder(

                    itemCount: value.loginlist.length,

                  itemBuilder: (context, index) {
                      var item=value.loginlist[index];

                    return Column(

                      children: [

                        ListTile(title: Text(item.invoice,style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),),

                          subtitle:  Text(item.Costomername,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),

                          trailing: Column(

                            children: [



                              Text(item.pending,style: TextStyle(color:Colors.red,fontSize: 12,fontWeight: FontWeight.bold),),

                              Text(item.amount,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),

                            ],

                          ),),

                        Divider(thickness: 2,)

                      ],

                    );







                  },):
                    Text("list not found")

              );
            }
          ),

      ],

    ),
  ),
)



      ),
    );
  }
}
