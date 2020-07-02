import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
        TextField(decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Email'
          ),),
         SizedBox(height: 10,),
      
        FlatButton(
          textColor: Colors.white,
          color: Colors.blueAccent,
          child: Text("Reset Password",),
        onPressed: (){

        },)
      ]
    )
    ,)
    ,);;
  }
}