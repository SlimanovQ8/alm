
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';  //for date format



import 'login.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(

          backgroundColor: Color(0xfff3f2f8),



          appBar: AppBar(


            backgroundColor: Colors.white,
            title: Text("Vaccine Status", style: TextStyle(
                color: Colors.black
            )),
            actions: [

              Transform.scale(
                scale: 3,
                child: IconButton(
                  icon: Image.asset('images/MOH.png', scale: 5,)
                  ,
                  onPressed: () {

                  },
                ),
              ),
            ],




          ),



          body: new FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('Users')
                  .where('UserID', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .get(),
              builder:
                  (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (snapshot.data!.docs.length == 0) {
                  return
                      Text("f");

                } else {

                  return Column(

                    children: [
                      SizedBox(height: 20,),
                      Container(
                        height: 110,
                        decoration: new BoxDecoration(
                        ),
                        child: Card(

                          color: Color(0xfffcbc27),

                          clipBehavior: Clip.antiAlias,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 10,

                          margin: EdgeInsets.all(7),
                          child: Column(
                            children: <Widget>[
                              Center(

                                child: Text("\n" + snapshot.data!.docs[0].get("Name ").toString().substring(0, 17) + "\n" + snapshot.data!.docs[0].get("Name ").toString().substring(18) ,




                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                //      subtitle: ,
                              ),



                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          "Recovered from \n Covid-19 Infection", style: TextStyle( fontSize: 20,), textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Text(
                          "Recovered and has immunity form \n natural Infection", style: TextStyle( fontSize: 15,), textAlign: TextAlign.center,
                        ),
                      ),

                      Center(
                          child: Column(children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Table(
                                children: [
                                  TableRow( children: [
                                    Column(children:[
                                      Text('Civil ID')
                                    ]),
                                    Column(children:[
                                      Text('Passport No')
                                    ]),
                                    Column(children:[
                                      Text('Nationality')
                                    ]),
                                  ]),
                                  TableRow( children: [
                                    Column(children:[
                                      Text(snapshot.data!.docs[0].get("CivilID"), style: TextStyle( color: Color(0xff8acd9d)),)
                                    ]),
                                    Column(children:[
                                      Text('-', style: TextStyle( color: Color(0xff8acd9d)),)
                                    ]),
                                    Column(children:[
                                      Text(snapshot.data!.docs[0].get("Nationality"), style: TextStyle( color: Color(0xff8acd9d)),)
                                    ]),
                                  ]),
                                ],
                              ),
                            ),
                          ])),
                    ],
                  );
                }
              }),

          bottomNavigationBar: BottomNavigationBar(


            backgroundColor: Color(0xfff7f7f7),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xff8acd9d),
            unselectedLabelStyle: TextStyle(color: Colors.black),
            currentIndex: 0,


            items: [
              BottomNavigationBarItem(
                icon: new ImageIcon(
                  AssetImage("images/vaccine.png",)
                  ,
                ),
                label: 'Vaccine status',

              ),
              BottomNavigationBarItem(
                  label:'My PCR Status',
                  icon: Icon(Icons.insert_drive_file
                    , )
              ),

              BottomNavigationBarItem(
                icon: new ImageIcon(
                  AssetImage("images/Companion.png",)
                  ,
                ),
                label: 'Companions',

              ),

              BottomNavigationBarItem(
                icon: new ImageIcon(
                  AssetImage("images/ins.png",)
                  ,
                ),
                label: 'Instructions',

              ),


              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                label: 'Settings',
              ),
            ],
          )



      );
  }

}