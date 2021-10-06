import 'package:flutter/material.dart';

class Next extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Next'),
     ),
     body: NextPage(),
   );
  }

}

class NextPage extends StatefulWidget {
  NextPage({Key? key}) : super(key: key);


  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final cityController = TextEditingController();
  final

  String name = "";
  String age = "";
  String city = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Name',
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: ageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Age',
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: cityController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'City',
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(onPressed: () {

            },
            child: Text('Send'),
            color: Colors.blue,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0)
            ),),
          )
        ],
      ),
    );
  }

}
//https://www.woolha.com/tutorials/flutter-using-firebase-realtime-database

class UserData {
/*  UserData({
    this.name,
    this.age,
    this.city
});*/

 /* String name;
  String age;
  String city;*/
}

