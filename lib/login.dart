import 'dart:convert';
//import 'dart:js';

import 'package:app/signup.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:app/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Login extends StatefulWidget {
  //const Login({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  Future login() async {
    var url = Uri.http("192.168.125.11", '/flutter_app/login.php', {'q': '{http}'});
    var response = await http.post(url, body: {
      "username": username.text,
      "password": password.text,

    });

    var data = json.decode(response.body);

    if (data.toString() == "Error") {

      Fluttertoast.showToast(
        backgroundColor: Colors.red,
        textColor: Colors.white,
        msg: 'Username and password invalid',
        toastLength: Toast.LENGTH_SHORT,
      );
      /*Navigator.of(context).push(MaterialPageRoute(builder: (context)=>home(widget.id)));*/

    } else {

        SharedPreferences preferences=await SharedPreferences.getInstance();
        preferences.setString('id', data['id']);
        preferences.setString('username', data['username']);
        preferences.setString('name', data['name']);
        preferences.setString('email', data['email']);
        preferences.setString('phone', data['phone']);
        preferences.setString('pincode', data['pincode']);
        preferences.setString('city', data['city']);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return home();
      },));
    }
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(

      body:Container(
        color: Color(0xFF252525),

          child: Column(
            
            children: [
          Padding(
          padding: const EdgeInsets.fromLTRB(20.0,100.0,0.0,0.0),
            child: Text("welcome Back,",style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          // /fontWeight: FontWeight.bold,
        ),),),

              Center(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: Image.asset("assets/login.png")),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0,4.0,0.0,10.0),
                  child: SizedBox(
                    width: 350.0,

                      child: TextFormField(
                        controller: username,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_circle),
                          fillColor: Colors.grey.withOpacity(0.4),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0))
                          ),
                          labelText: "Username",
                        ),
                      ),

                  ),
                ),
              ),
              Center(
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
                          borderRadius: BorderRadius.all(Radius.circular(15.0))
                      ),
                      labelText: "Password",
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 17.0, 0.0, 10.0),
                  child: SizedBox(
                    width: 100.0,
                    height: 35.0,
                    child: ElevatedButton(style:OutlinedButton.styleFrom(
                      backgroundColor: Colors.green,

                    ),onPressed:() {
                      login();
                    }, child: Text("Log In",style: TextStyle(
                      color: Colors.white,
                    ),),),
                  ),
                ),
              ),
              Center(
                child: TextButton(onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>signup()));
                }, child: Text("Don't have an account?",style: TextStyle(
                  fontSize: 13.0,
                ),)),
              )
            ],

        ),
      ),
    );
  }
}
