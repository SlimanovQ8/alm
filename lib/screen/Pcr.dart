
import 'package:almamari/screen/Main.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(PCR());

class PCR extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Car',
      home: Scaffold(
        appBar: AppBar(

          leading:  IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => HomePage()),),

          ),
          title: Text('PCR History', style: TextStyle(
              color: Colors.white
          ),),



          backgroundColor: Color(0xff74be71),

        ),

        body: Column(
          children: [
            SizedBox(height: 20,),
            Center(
              child: Text("There is no PCR result for the past 3 months", style: TextStyle(
    color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
      ),
            ),
          ],
        ),
    )
    );
  }
}