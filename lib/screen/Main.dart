
import 'package:almamari/screen/Pcr.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

import 'package:intl/intl.dart';  //for date format



import 'login.dart';

class HomePage extends StatefulWidget {
  @override

  _StatefulWrapperState createState() => _StatefulWrapperState();
}
class _StatefulWrapperState extends State<HomePage>  {
  int CurrentIndex = 0;
  // ignore: deprecated_member_use
  List<String> ib = ["a"];
  List <String> im = ["a"];
  Widget build(BuildContext context) {
    ib.add("Terms and Conditions");
    ib.add("Instructions");
    ib.add("Registration Of Vaccination Document Issued Abroad");

    im.add("images/inst.jpeg");
    im.add("images/qm.jpeg");
    im.add("images/reg.jpeg");
    return
      Scaffold(

          backgroundColor: CurrentIndex == 3 || CurrentIndex == 4 ? Colors.white : Color(0xfff3f2f8),







          body: Column(
            children: [
              Expanded(
                child: new CustomScrollView(
                  slivers: <Widget> [

                    new SliverAppBar(
                      expandedHeight: 120.0,
                      floating: false,

                      leading:  CurrentIndex == 1 ?GestureDetector(
                          child: new Image.asset('images/accesstime.jpeg',),
                          onTap:  () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (ctx) => PCR()),),

                      ):

                          new Container(),
                      backgroundColor: Colors.white,
                      pinned: true,


                      flexibleSpace: new FlexibleSpaceBar(



                        title: Container(
                          alignment: Alignment.bottomLeft,
                          child:  CurrentIndex == 0 ? new Text("Vaccine Status",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,

                            ),
                            textAlign: TextAlign.left,
                          ) : CurrentIndex == 1 ?
                              new Text("My PCR Results",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,

                                ),
                                textAlign: TextAlign.left,
                              ) :
                          CurrentIndex == 2 ?
                          new Text("Companions",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,

                            ),
                            textAlign: TextAlign.left,
                          ) :
                          CurrentIndex == 3 ?
                          new Text("Instructions",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,

                            ),
                            textAlign: TextAlign.left,
                          ) :  new Text("Settings",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,

                            ),
                            textAlign: TextAlign.left,
                          ),
                            transform:  Matrix4.translationValues(-35.0, 0.0, 0.0),

                        ),
                        background: Container(
                          width: 40,
                            height: 40,
                            child: CurrentIndex == 0 || CurrentIndex == 1 ? new Image.asset('images/MOH.png',
                              alignment: Alignment(1, 0.2), scale: 1.3,) : new Container() ),


                      ),
                    ),
                    new SliverList(
                    delegate: SliverChildListDelegate([
                      new FutureBuilder(
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

                              return CurrentIndex == 0 ? Column(

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
                                      elevation: 0,

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
                                                  Text(snapshot.data!.docs[0].get("CivilID"), style: TextStyle( color: Color(0xfF57ad63), fontSize: 17),)
                                                ]),
                                                Column(children:[
                                                  Text('-', style: TextStyle( color: Color(0xfF57ad63), fontSize: 17),)
                                                ]),
                                                Column(children:[
                                                  Text(snapshot.data!.docs[0].get("Nationality"), style: TextStyle( color: Color(0xfF57ad63), fontSize: 17),)
                                                ]),
                                              ]),
                                            ],
                                          ),
                                        ),
                                      ])),
                                ],
                              ) : CurrentIndex == 1 ?
                              Column(

                                children: [
                                  SizedBox(height: 20,),
                                  Container(
                                    height: 110,
                                    decoration: new BoxDecoration(
                                    ),
                                    child: Card(

                                      color: Color(0xffaaaaaa),

                                      clipBehavior: Clip.antiAlias,

                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),

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

                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Text(
                                      "You do not have PCR test result \n for the past 10 days.", style: TextStyle( fontSize: 15,), textAlign: TextAlign.center,
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
                                                  Text('Nationaghlity')
                                                ]),
                                              ]),
                                              TableRow( children: [
                                                Column(children:[
                                                  Text(snapshot.data!.docs[0].get("CivilID"), style: TextStyle( color: Color(0xfF57ad63), fontSize: 17),)
                                                ]),
                                                Column(children:[
                                                  Text('-', style: TextStyle( color: Color(0xfF57ad63), fontSize: 17),)
                                                ]),
                                                Column(children:[
                                                  Text(snapshot.data!.docs[0].get("Nationality"), style: TextStyle( color: Color(0xfF57ad63), fontSize: 17),)
                                                ]),
                                              ]),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        RaisedButton(
                                          textColor: Colors.white,
                                          color: Color(0xffaaaaaa),
                                          child: Text("Show PCR History"),
                                          onPressed: () => Navigator.of(context).push(
                                            MaterialPageRoute(builder: (ctx) => PCR()),),

                                          shape: new RoundedRectangleBorder(
                                            borderRadius: new BorderRadius.circular(30.0),
                                          ),
                                        ),
                                      ],

                                      )),
                                ],
                              ):

                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 500,
                                      child: ListView.separated(
                                          separatorBuilder: (context, index) {
                                            return Divider(thickness: 0.0,
                                              indent: 0,
                                              endIndent: 0,
                                            );

                                          },
                                          itemCount: 1,


                                          itemBuilder: (context,index){
                                            return new Card(
                                              child: new Column(
                                                //mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                       Container(
                                                         child: new Text("App", style: TextStyle (fontSize: 20, color: Color(0Xff656565)),),
                                                transform:  Matrix4.translationValues(-175.0, 0.0, 0.0),

                                            ),
                                                        SizedBox(height: 10,),
                                                        Container(
                                                          decoration: BoxDecoration(
                                                            border: Border.all(
                                                              color: Color(0xffe0e0e0),
                                                              width: 1.5// red as border color
                                                            ),
                                                          ),
                                                          child: new ListTile(
                                                            title: Container(child: new Text("Language"),
                                            transform:  Matrix4.translationValues(-15.0, 0.0, 0.0),
                                            ),
                                                            leading: Container(
                                                              padding: EdgeInsets.only(right: 0.0),

                                                              child: Transform.scale(scale: 0.5,
                                                                child: new Image.asset('images/lang.jpeg',)
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                  SizedBox(height: 30,),

                                                  Container(
                                                    child: new Text("About", style: TextStyle (fontSize: 20, color: Color(0Xff656565)),),
                                                    transform:  Matrix4.translationValues(-175.0, 0.0, 0.0),

                                                  ),
                                                  SizedBox(height: 30,),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Color(0xffe0e0e0),
                                                        width: 1.5,
                                                    ),
                                            ),
                                                    child:  Row(
                                                      children: [
                                                        Expanded(
                                                          child: SizedBox(
                                                            height: 210,
                                                            child: ListView.separated(
                                                                separatorBuilder: (context, index) => Divider(
                                                                  color: Colors.black,
                                                                ),
                                                                itemCount: 3,
                                                                itemBuilder: (context, index) {

                                                                  return ListTile(
                                                                    title: Container(child: new Text(ib[index+1]),
                                                                      transform: Matrix4.translationValues(-15.0, 0.0, 0.0),
                                                                    ),
                                                                    leading: Container(
                                                                      padding: EdgeInsets.only(right: 0.0),

                                                                      child: Transform.scale(scale: 0.5,
                                                                          child: new Image.asset(im[index+1],)
                                                                      ),
                                                                    ),
                                                                  );
                                                                }),

                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ),

                                                  SizedBox(height: 18,),
                                                  Container(
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Color(0xffe0e0e0),
                                                          width: 1.5// red as border color
                                                      ),
                                                    ),

                                                    child: new ListTile(
                                                      title: Container(child: new Text("Logout", style: TextStyle(
                                                        color: Color(0xfF57ad63),

                                                      ),),
                                                        transform:  Matrix4.translationValues(-15.0, 0.0, 0.0),
                                                      ),
                                                      subtitle: Container(child: new Text("Immune (2.5)", style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 10

                                                      ),),
                                                        transform:  Matrix4.translationValues(250.0, -20.0, 0.0),
                                                      ),
                                                      leading: Container(
                                                        padding: EdgeInsets.only(right: 0.0),

                                                        child: Transform.scale(scale: 0.5,
                                                            child: new Image.asset('images/logout.jpeg',)
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox( height: 12,),
                                                  Text("Powered By"),
                                                  SizedBox( height: 10,),
                                                  Text("Information System Department"),

                                                  SizedBox( height: 10,),

                                                  new Image.asset('images/MOH.png',),
                                                ],
                                              ),
                                            );

                                          }),

                                    ),

                                  ),

                                ],
                              );
                            }
                          })
                    ]),
                    ),

                  ],
                ),
              ),
            ],
          ),

          bottomNavigationBar: BottomNavigationBar(


            backgroundColor: Color(0xfff7f7f7),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xfF57ad63),
            unselectedFontSize: 12,
            selectedFontSize: 12,
            unselectedLabelStyle: TextStyle(color: Colors.black),
            currentIndex: CurrentIndex,
            onTap: (index) {
              setState(() {
                CurrentIndex = index;

              });
            },


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