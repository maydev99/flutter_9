import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'next.dart';


/*final FirebaseApp app = FirebaseApp(name: '[DEFAULT]');
final DatabaseReference db = FirebaseDatabase(app: firebaseApp).reference();
db.child('your_db_child').once().then((result) => print('result = $result'));*/



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppTitle',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }

}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final fb = FirebaseDatabase.instance;
  final myController = TextEditingController();
  final name = "Name";
  late var dataFromFB = "FB Data";

  updateText(value) {
    setState(() {
      dataFromFB = value.toString();
    });

  }

  @override
  Widget build(BuildContext context) {
    final ref = fb.reference();
    return Scaffold(
      appBar: AppBar(
        title: Text('First Flutter Firebase App'),
      ),
        body: Container(
            child: Column(
              children: <Widget>[
                Text(dataFromFB,
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(name),
                    SizedBox(width: 20),
                    Expanded(child: TextField(controller: myController)),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    ref.child(name).set(myController.text);
                  },
                  child: Text("Submit"),
                ),

                ElevatedButton(
                    onPressed: () {
                    ref.child('Name').once().then((DataSnapshot data) {
                      updateText(data.value);
                    });
                    }, child: Text('Retrieve')),
                
                MaterialButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Next()));
                      
                    },
                child: Text('Next'),
                color: Colors.purple,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)
                ),)
              ],
            ))
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
}
