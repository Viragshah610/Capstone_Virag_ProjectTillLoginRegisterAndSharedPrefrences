import 'package:app/home.dart';
import 'package:flutter/material.dart';
import 'package:app/login.dart';
import 'package:app/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences=await SharedPreferences.getInstance();
  var username =preferences.getString('username');
  runApp(MaterialApp(
    home:username==null?Login():home(),
  ));
 }
//  class home1 extends StatelessWidget {
//    const home1({Key? key}) : super(key: key);
//
//    @override
//    Widget build(BuildContext context) {
//      return Scaffold(
//        body:Container(
//          color: Colors.black,
//          child: Center(
//            child: Column(
//              children: [
//                Padding(
//                  padding: const EdgeInsets.fromLTRB(0.0,30.0,0.0,120.0),
//                  child: Text("",style: TextStyle(
//                    color: Colors.white,
//                    fontSize: 30.0,
//                    fontWeight: FontWeight.bold,
//                  ),),
//                ),
//                SizedBox
//                  (
//                  child: Image.asset('assets/home.png'),
//                  width: 300.0,
//                  height: 260.0,
//                ),
//                Padding(
//                  padding: const EdgeInsets.all(10.0),
//                  child: Text("Book My Ground",style: TextStyle(
//                    color: Color(0xFFA5C53C),
//                    fontSize: 20.0,
//                    fontWeight: FontWeight.bold,
//
//                  ),),
//                ),
//                Text("- Book your cricket ground -",style: TextStyle(
//                  color: Colors.white,
//                ),),
//                Padding(
//                  padding: const EdgeInsets.fromLTRB(00.0,40.0,0.0,0.0),
//                  child: SizedBox(
//                    width: 100.0,
//                    child: ElevatedButton(style:OutlinedButton.styleFrom(
//                      backgroundColor: Colors.green,
//                    ),onPressed: () {
//                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>signup()));
//                    }, child: Text("Sign up",)),
//                  ),
//                ),
//
//                SizedBox(
//                  width: 100.0,
//                  child: ElevatedButton(style:OutlinedButton.styleFrom(
//                    backgroundColor: Colors.white,
//
//                  ),onPressed:() {
//                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));
//                  }, child: Text("Log In",style: TextStyle(
//                    color: Colors.green,
//                  ),),),
//                ),
//              ],
//            ),
//          ),
//        )
//      );
//    }
//  }
//
