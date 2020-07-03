import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String currentUserId;
  HomeScreen({this.currentUserId});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Second page"),),
    body: Container(),);
  }
}