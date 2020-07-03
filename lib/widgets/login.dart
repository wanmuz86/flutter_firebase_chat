import 'package:firebase_chat_app/widgets/forgot_password.dart';
import 'package:flutter/material.dart';
import 'forgot_password.dart';
import 'register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homescreen.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _success;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  SharedPreferences prefs;
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
        SizedBox(height: 5,),
        Image.network("https://anak2u.com.my/wp-content/uploads/2020/06/cropped-rsz_anak2ulogo.png"),
         SizedBox(height: 5,),
        TextField(
          controller: emailController,
          decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Email'
          ),),
         SizedBox(height: 5,),
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Password'),
        ),
         SizedBox(height: 5,),
        FlatButton(
          textColor: Colors.white,
          color: Colors.blueAccent,
          child: Text("Login",),
        onPressed: () async {
          
          final FirebaseUser user = (await _auth.signInWithEmailAndPassword(email: 
          emailController.text, password: passwordController.text)).user;
          if (user!=null){
            // Fix the prefs part!!
            print('succesfully logged in!');
          prefs = await SharedPreferences.getInstance();
           await prefs.setString('id', user.uid);
           await prefs.setString('email', user.email);
           print('finish save!');
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => 
          HomeScreen(currentUserId: user.uid)));
          }
          else {
            setState(() {
              _success = false;
            });
          }

        },),
        _success == true ? Text("Succesfully Log in") : _success == false ? Text("Something is wrong") : 
        SizedBox(),
        FlatButton(
          child:Text("No Account? Sign Up Now!"),
          onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=> Register()));
          },
        ),
        FlatButton(onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPassword()));
        },
        child: Text("Forgot Password"),
        
        )
      ]
    )
    ,)
    ,);
  }
}