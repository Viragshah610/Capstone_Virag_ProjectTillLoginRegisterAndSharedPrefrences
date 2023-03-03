import 'dart:convert';

import 'package:app/home.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class editprofile extends StatefulWidget {
  const editprofile({Key? key}) : super(key: key);

  @override
  State<editprofile> createState() => _editprofileState();
}

class _editprofileState extends State<editprofile> {
  TextEditingController ename=new TextEditingController();
  TextEditingController eemail=new TextEditingController();
  TextEditingController ephone=new TextEditingController();
  TextEditingController epincode=new TextEditingController();
  TextEditingController ecity=new TextEditingController();
  Future edit() async {
    var url = Uri.http("192.168.125.11", '/flutter_app/editprofile.php', {'q': '{http}'});
    var response = await http.post(url, body: {
      "name": ename.text,
      "email":eemail.text,
      "phone":ephone.text,
      "pincode":epincode.text,
      "city":ecity.text,
      "id":id,
    });
      var Data=json.decode(response.body);

    if (Data.toString() == "Error") {

      Fluttertoast.showToast(
        backgroundColor: Colors.red,
        textColor: Colors.white,
        msg: 'cancel',
        toastLength: Toast.LENGTH_SHORT,
      );


    } else {
       SharedPreferences preferences=await SharedPreferences.getInstance();
       await preferences.setString('name', Data['name']);
       await preferences.setString('email', Data['email']);
       await preferences.setString('phone', Data['phone']);
       await preferences.setString('pincode', Data['pincode']);
       await preferences.setString('city', Data['city']);

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return home();
      },));
    }

  }
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
          TextField(
            controller: ename,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: name,
            ),
          ),
          TextField(
            controller: eemail,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: email,
            ),
          ),
          TextField(
            controller: ephone,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: phone,
            ),
          ),
          TextField(
            controller: epincode,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: pincode,
            ),
          ),
          TextField(
            controller: ecity,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: city,
            ),
          ),
          ElevatedButton(onPressed: () => edit(), child: Text("submit")),
        ],
      ),
    );
  }
}
