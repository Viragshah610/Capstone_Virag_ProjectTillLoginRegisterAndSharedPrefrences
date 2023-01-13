import 'dart:convert';
import 'package:app/home.dart';
import 'package:app/login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;


  //const signup({Key? key}) : super(key: key);
  class signup extends StatefulWidget {
  //const signup({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
  }

  class _SignUpState extends State<signup> {
  TextEditingController username=new TextEditingController();
  TextEditingController name=new TextEditingController();
  TextEditingController email=new TextEditingController();
  TextEditingController phone=new TextEditingController();
  TextEditingController pincode=new TextEditingController();
  TextEditingController city=new TextEditingController();
  TextEditingController password=new TextEditingController();

  Future signup() async {
    var url = Uri.http("192.168.245.11", '/flutter_app/register.php', {'q': '{http}'});
    var response = await http.post(url, body: {
      "username": username.text.toString(),
      "name": name.text.toString(),
      "email": email.text.toString(),
      "phone": phone.text.toString(),
      "pincode": pincode.text.toString(),
      "city": city.text.toString(),
      "password": password.text.toString(),
  });
  var data = json.decode(response.body);
  if (data == "Error") {
  Fluttertoast.showToast(
  backgroundColor: Colors.orange,
  textColor: Colors.white,
  msg: 'User already exit!',
  toastLength: Toast.LENGTH_SHORT,
  );
  }
  else {
  Fluttertoast.showToast(
  backgroundColor: Colors.green,
  textColor: Colors.white,
  msg: 'Registration Successful',
  toastLength: Toast.LENGTH_SHORT
  );
  Navigator.push(context,MaterialPageRoute(builder:(context)=>home(),),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Sign up")),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,),
      body: Container(
        color: Colors.black,
        child: ListView(
          children:[Container(
          color: Colors.black,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 10.0),
                    child: SizedBox(
                      width: 350.0,

                      child: TextFormField(
                        controller: username,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_circle),
                          fillColor: Colors.grey.withOpacity(0.4),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(15.0))
                          ),
                          labelText: "Username",
                        ),
                      ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 10.0),
                    child: SizedBox(
                      width: 350.0,

                      child: TextFormField(
                        controller: name,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_circle),
                          fillColor: Colors.grey.withOpacity(0.4),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(15.0))
                          ),
                          labelText: "Enter name",
                        ),
                      ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 10.0),
                    child: SizedBox(
                      width: 350.0,

                      child: TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                          fillColor: Colors.grey.withOpacity(0.4),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(15.0))
                          ),
                          labelText: "Enter Email-id",
                        ),
                      ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 10.0),
                    child: SizedBox(
                      width: 350.0,

                      child: TextFormField(
                        controller: phone,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.call),
                          fillColor: Colors.grey.withOpacity(0.4),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(15.0))
                          ),
                          labelText: "Enter phone no.",
                        ),
                      ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 10.0),
                    child: SizedBox(
                      width: 350.0,

                      child: TextFormField(
                        controller: pincode,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.pin_drop),
                          fillColor: Colors.grey.withOpacity(0.4),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(15.0))
                          ),
                          labelText: "enter Pincode",
                        ),
                      ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 10.0),
                    child: SizedBox(
                      width: 350.0,

                      child: TextFormField(
                        controller: city,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.map),
                          fillColor: Colors.grey.withOpacity(0.4),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(15.0))
                          ),
                          labelText: "city",
                        ),
                      ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 10.0),
                    child: SizedBox(
                      width: 350.0,

                      child: TextFormField(
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          fillColor: Colors.grey.withOpacity(0.4),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(15.0))
                          ),
                          labelText: "password",
                        ),
                      ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 00.0),
                    child: SizedBox(
                      width: 100.0,
                      height: 35.0,
                      child: ElevatedButton(style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ), onPressed: () {
                        signup();
                      }, child: Text("Sign up", style: TextStyle(
                        color: Colors.white,
                      ),),),
                    ),
                  ),
                  TextButton(onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Login()));
                  }, child: Text("Already have an account?", style: TextStyle(
                    fontSize: 13.0,
                  ),))

                ],
              ),
            ),
          ),
        ),
        ],
    ),
      ),);
  }
}
