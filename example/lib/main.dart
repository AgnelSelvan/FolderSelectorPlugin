import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:folder_selector/folder_selector.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Directory rootDir;
  String selectedPath = "Click on Select Folder to get the path";

  performInit()async{

    Directory dir = await getApplicationDocumentsDirectory();
    setState(() {
      rootDir = dir;
    });
  }

  @override
  void initState() {
    super.initState();
    performInit();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Folder Selector App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(onPressed: ()async{
                String path = await Navigator.of(context).push<String>(MaterialPageRoute(builder: (context) => FolderSelector(rootDir: rootDir,) ));
                if(path != null)
                setState(() {
                  selectedPath = path;
                });

              }, child: Text("Select a Folder", style: TextStyle(color: Colors.white),), style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue[400])),  ),
              Text(selectedPath)
            ],
          ),
        ),

    );
  }
}
