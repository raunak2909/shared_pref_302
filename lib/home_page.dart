import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  String name_key = "name";

  SharedPreferences? prefs;

  String? name;

  @override
  void initState() {
    super.initState();
    getValueFromPrefs();
  }

  @override
  Widget build(BuildContext context){


    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          ///get value
          Text('Welcome, your last name saved was : ${name ?? "Default"}', style: TextStyle(fontSize: 20),),
          TextField(
            controller: nameController,
          ),
          SizedBox(
            height: 11,
          ),
          ElevatedButton(onPressed: (){
            ///set value
            prefs!.setString(name_key, nameController.text);
          }, child: Text('Save'))
        ],
      ),
    );
  }

  void getValueFromPrefs() async{
    prefs = await SharedPreferences.getInstance();
    name = prefs!.getString(name_key);
    setState(() {

    });
  }
}