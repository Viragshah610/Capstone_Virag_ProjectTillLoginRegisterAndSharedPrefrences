import 'dart:convert';
import 'dart:html';
import 'package:app/editprofile.dart';
import 'package:app/login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class home extends StatefulWidget {

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String id='';
  String username="";
  String name="";
  String email="";
  String phone="";
  String pincode="";
  String city="";

  Future getUsername()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    setState(() {
      id=preferences.getString('id')!;
      username=preferences.getString('username')!;
      name=preferences.getString('name')!;
      email=preferences.getString('email')!;
      phone=preferences.getString('phone')!;
      pincode=preferences.getString('pincode')!;
      city=preferences.getString('city')!;
    });
  }
 Future logout(BuildContext context)async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    preferences.remove('username');
    Fluttertoast.showToast(msg: "logout",toastLength: Toast.LENGTH_SHORT,fontSize: 16.0);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
 }
    @override
    void initState(){
    super.initState();
    getUsername();
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Column(
          children: [
            Center(child: id==''? Text(''):Text(id),),
            Center(child: username==''? Text(''):Text(username),),
             Center(child: name==''? Text(''):Text(name),),
             Center(child: email==''? Text(''):Text(email),),
             Center(child: phone==''? Text(''):Text(phone.toString()),),
             Center(child: pincode==''? Text(''):Text(pincode.toString()),),
            Center(child: city==''? Text(''):Text(city),),
            MaterialButton(onPressed: () {
              logout(context);
            },child: Text("logout"),),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return editprofile();
              },));
            }, child: Text("edit"))
          ],
        )
      );
    }

}
