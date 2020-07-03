import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Chat extends StatefulWidget {
  final String peerId;
  Chat({this.peerId});
  @override
  _ChatState createState() => _ChatState(peerId:peerId);
}

class _ChatState extends State<Chat> {
  final String peerId;
  String groupChatId = '';
  String id = '';
  SharedPreferences prefs;

  var textEditingController = TextEditingController();
  _ChatState({this.peerId});

  @override
  void initState() {
    readLocal();
    super.initState();
  }
  readLocal() async{
    prefs = await SharedPreferences.getInstance();
    id = prefs.getString('id') ?? '';
    if (id.hashCode <= peerId.hashCode) {
      groupChatId = '$id-$peerId';
    } else {
      groupChatId = '$peerId-$id';
    }
    Firestore.instance.collection('users').document(id).updateData({'chattingWith': peerId});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat"),),
      body:Stack(
        children: <Widget>[
          buildListMessages(),
          buildInput()
        ],
      )
      
    );
  }
  Widget buildListMessages(){
return Container();
  }
  Widget buildInput(){
    return Row(children: <Widget>[
      Expanded(child: TextField(controller: textEditingController,
       decoration: InputDecoration.collapsed(
                  hintText: 'Type your message...',
                 
                ),

      ),),
IconButton(icon:Icon(Icons.send),onPressed: (){
onSendMessage(textEditingController.text,0);
},)
    ],);
  }
  void onSendMessage(String content, int type){
       if (content.trim() != '') {
       var documentReference = Firestore.instance.collection('messages')
       .document(groupChatId)
       .collection(groupChatId)
       .document(DateTime.now().millisecondsSinceEpoch.toString());

Firestore.instance.runTransaction((transaction) async{
await transaction.set(documentReference, {
  'idFrom':id,
  'idTo':peerId,
  'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
            'content': content,
            'type': type
            }
            );
            
});

       }
  }
}