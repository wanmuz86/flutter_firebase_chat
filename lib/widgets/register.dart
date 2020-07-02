import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _success;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailCotroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.yellow,),
      backgroundColor: Colors.yellow,
      body:
    Padding(
    
      padding: EdgeInsets.all(10.0),
      child: 
    Column(
    
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
      
        Text("Chat app", style: TextStyle(color: Colors.red, fontSize: 32),
      
        ),
        SizedBox(height: 10,),
        Image.network("https://anak2u.com.my/wp-content/uploads/2020/06/cropped-rsz_anak2ulogo.png"),
         SizedBox(height: 10,),
        TextField(
          controller: emailCotroller,
          decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Email'
          ),),
         SizedBox(height: 10,),
        TextField(
          obscureText: true,
          controller: passwordController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Password'),
        ),
         SizedBox(height: 10,),
        FlatButton(
          textColor: Colors.white,
          color: Colors.blueAccent,
          child: Text("Register",),
        onPressed: () async {
final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
  email: emailCotroller.text, password: passwordController.text)).user;
  if (user!= null){
    setState(() {
      _success = true;

    });
  }
  else {
    _success = false;
  }
        },),
        _success == true ? Text("Succesfully Registered") : _success == false 
        ? Text("Error during login") : SizedBox()
      ]
    )
    ,)
    ,);
  }
}