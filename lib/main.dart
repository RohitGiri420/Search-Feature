import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Map<String, dynamic>> allNote =[
    {"title":"rohit","description": "descripton1"},
    {"title":"ajay","description": "descripton2"},
    {"title":"asif","description": "descripton3"},
    {"title":"inam","description": "descripton4"},
    {"title":"bansal","description": "descripton5"},
    {"title":"divanshu","description": "descripton6"},
    {"title":"hanan","description": "descripton7"},
    {"title":"harshit","description": "descripton8"},
  ];

  List<Map<String,dynamic>> foundNotes=[];

  _searchNote(String ChangedValue){
    List<Map<String,dynamic>>result=[];

    if(ChangedValue.isEmpty){
      result = allNote;
    }
    else{
     result = allNote.where((element) => element["title"].toLowerCase().contains(ChangedValue.toLowerCase()),).toList();
    }

    setState(() {
      foundNotes = result;
    });

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    foundNotes=allNote;
  }


  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(),
        body: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 10,),
                TextField(
                  onChanged: (value) {
                    _searchNote(value);
                  },
                    decoration: InputDecoration(
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: ListView.builder(itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text("${foundNotes[index]["title"]}"),
                        subtitle: Text("${foundNotes[index]["description"]}"),
                      ),
                    );
                  },
                  itemCount: foundNotes.length,),
                ),
              ],
            ),
          ),

        ),
      );
  }
}
