import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class HomeScreen extends StatefulWidget {
  final String currentUserId;
  HomeScreen({this.currentUserId});
  @override
  _HomeScreenState createState() => _HomeScreenState(currentUserId: currentUserId);
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState({this.currentUserId});
  final String currentUserId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Second page"),),
    body: Stack(
     children: <Widget>[
       Container(
         // Retrieving data from users collection in firebase
         child:StreamBuilder(
           stream:Firestore.instance.collection('users').snapshots(),
           builder: (context, snapshot){
             if (!snapshot.hasData){
               return CircularProgressIndicator();
             }
             else {
               return ListView.builder(
                 padding: EdgeInsets.all(8.0),
                 itemBuilder: (context,index) => buildItem(context,snapshot.data.documents[index]),
               itemCount: snapshot.data.documents.length,
               );

             }
           })
       
       )
    
     ], 
    )
    );
  }
  Widget buildItem(BuildContext context, DocumentSnapshot document){
    if (document['id']== currentUserId){
      return Container();
    } else {
      return ListTile(title: Text(document['email']),
      onTap:(){
        print(document['email']);
      }
      );
    }
  }
}