import 'dart:convert';

import 'package:dummy_api_hit/models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsersHome extends StatefulWidget {
  const UsersHome({super.key});
  

  @override
  State<UsersHome> createState() => _UsersHomeState();
}

class _UsersHomeState extends State<UsersHome> {
  AllUserModel? userModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade200,
      appBar: AppBar(title: Text('Users'),backgroundColor: Colors.teal,),
      body: userModel!=null && userModel!.users!.isNotEmpty ?
      ListView.builder(
        itemCount: userModel!.users!.length,
        itemBuilder: (_,indext){
          var userData=userModel!.users![indext];
        return Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("First Name : ${userData.firstName!}"),
                  Text("Last Name : ${userData.lastName!}"),
                  Text("Maiden Name :${userData.maidenName!}"),
                  Text("Age : ${userData.age!}"),
                  Text("Gender : ${userData.gender!}"),
                  Text("Email : ${userData.email!}"),
                  Text("Phone : ${userData.phone!}"),
                ],
              ),
              Image.network(userData.image!,height: 90,width: 80,),
            ],
          ),
        );

      }) :Center(child: Text('no users..'),),
      
    );
  }

  //get user data from http..
  void getUserData()async{
    var uri=Uri.parse("https://dummyjson.com/users");
    var response=await http.get(uri);
    print(response.statusCode);
    var data=jsonDecode(response.body);
    userModel=AllUserModel.fromJson(data);
    setState(() {
      
    });
  }
}