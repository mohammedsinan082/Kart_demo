import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

class apkIntegration extends StatefulWidget {
  const apkIntegration({super.key});

  @override
  State<apkIntegration> createState() => _apkIntegrationState();
}

class _apkIntegrationState extends State<apkIntegration> {

  TextEditingController codecontroller=TextEditingController();


  List a=[];
  getdata() async {
    var data=await http.get(Uri.tryParse("https://postpincode.in/api/getPostalArea.php?pincode=${codecontroller.text}")!);


    a=json.decode(data.body);

    print(data.request);
    print(data.runtimeType);
    setState(() {

    });

  }
  @override
  void initState() {
    getdata();
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: a.length,
              itemBuilder: (context, index) {
                return Container(
                  height: w*0.25,
                  width: w*1,
                  color: Colors.purple,
                  child: Column(
                    children: [
                      Text("Pincode:${a[index]["Pincode"]}"),
                      Text("PostOfficeAddress:${a[index]["PostOfficeAddress"]}"),
                      Text("District:${a[index]["District"]}"),
                      Text("State:${a[index]["State"]}"),
                    ],
                  ),
                );
              },),

            TextFormField(
              controller: codecontroller,
              onChanged: (value) {
                getdata();
              },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  // enabledBorder:InputBorder.none,
                  suffixIcon: Icon(Icons.search,color: Colors.grey,),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(w*0.02),
                      borderSide: BorderSide.none
                  ),
              ),
              keyboardType: TextInputType.number,


            ),
              InkWell(
                onTap: () => getdata(),
                child: Container(
                  height: w*0.1,
                  width: w*0.1,
                  color: Colors.red,
                  child: Text("click"),
                ),
              ),


          ],
        ),
      ),
    );
  }
}
