import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,     
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DocumentReference documentReference = Firestore.instance.document("myData/Dummy");


  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: gSA.accessToken,
      idToken: gSA.idToken,
    );
    final AuthResult authResult = await _auth.signInWithCredential(credential);
    FirebaseUser user = authResult.user;
    print("User Name: ${user.displayName}");
    return user;
    
  }

  void _signOut(){
    googleSignIn.signOut();
    print("User Signed Out");
  }

  void _add(){
    Map<String, String> data = <String, String>{
      "b": "ppp",
      "a": "typedef",
      "c": "void",
      "a": "typedef",
      "b": "def",
      "d": "find",
      "b": "print",
      "d": "function",
      "b": "def",
      "b": "def",
    };
    documentReference.setData(data).whenComplete(() {
      print("Document Added");
    }).catchError((e) => print(e));

  }

  void _delete(){

  }

  void _update(){

  }

  void _fetch(){

  }

  @override

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Firebase Demo"),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new RaisedButton(
              onPressed: ()=> _signIn().then((FirebaseUser user)=>print(user)).catchError((e)=>print(e)),
              child: Text("Sign In"),
              color: Colors.green,
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            new RaisedButton(
              onPressed: ()=>_signOut(),
              child: new Text("Sign Out"),
              color: Colors.red,
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            new RaisedButton(
              onPressed: ()=>_add(),
              child: new Text("Add"),
              color: Colors.red,
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            new RaisedButton(
              onPressed: ()=>_update(),
              child: new Text("Update"),
              color: Colors.cyan,
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            new RaisedButton(
              onPressed: ()=>_delete(),
              child: new Text("Delete"),
              color: Colors.lightBlue,
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            new RaisedButton(
              onPressed: ()=>_fetch(),
              child: new Text("Fetch"),
              color: Colors.lime,
            ),
          ],
        )
      )
    );
  }
}