import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class User extends StatefulWidget {
  User({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  final dbRef = FirebaseDatabase.instance.reference().child("user");
  List<Map<dynamic, dynamic>> lists = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Users'),
        ),
        body: FutureBuilder(
            future: dbRef.once(),
            builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
              if (snapshot.hasData) {
                lists.clear();
                Map<dynamic, dynamic> values = snapshot.data!.value;
                values.forEach((key, values) {
                  lists.add(values);
                });
                return new ListView.builder(
                    shrinkWrap: true,
                    itemCount: lists.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4.0),
                        child: Card(
                          elevation: 2,
                        color: Colors.greenAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                            topLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16)
                          )
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Name: " + lists[index]["name"]),
                                Text("Age: " + lists[index]["age"]),
                                Text("City: " + lists[index]["city"]),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }
              return CircularProgressIndicator();
            }));
  }
}

//https://petercoding.com/firebase/2020/02/16/using-firebase-queries-in-flutter/
//https://github.com/PeterHdd/Firebase-Flutter-tutorials/blob/master/firebase_database_tutorial/lib/User.dart




