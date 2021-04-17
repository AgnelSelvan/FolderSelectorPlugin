import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import './../widget/text_field.dart';


class FolderSelector extends StatefulWidget {
  final Directory rootDir;
  final String title;

  const FolderSelector({Key key,@required this.rootDir, this.title}) : super(key: key);
  @override
  _FolderSelectorState createState() => _FolderSelectorState();
}

class _FolderSelectorState extends State<FolderSelector> {
  TextEditingController controller = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Directory rootDir, selectedDir;
  String title;
  List<FileSystemEntity> folderList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      rootDir = widget.rootDir;
      selectedDir = widget.rootDir;
      folderList = widget.rootDir.listSync();
      title = widget.title ?? "Select A Folder";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
              icon: Icon(Icons.create_new_folder_outlined),
              onPressed: () {
                showCreateFolderDialog();
              })
        ],
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(30.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        selectedDir.path,
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ],
              ),
            )),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            selectedDir != rootDir
                ? Container(
              child: IconButton(
                  icon: Icon(Icons.arrow_upward_rounded),
                  onPressed: () {
                    setState(() {
                      debugPrint(path.basename(selectedDir.path));
                      if (path.basename(selectedDir.path) !=
                          "emulated" &&
                          path.basename(selectedDir.path) != "storage" &&
                          path.basename(selectedDir.path) != "0") {
                        setState(() {
                          selectedDir = Directory(selectedDir.path
                              .replaceAll(
                              RegExp(
                                  path.basename(selectedDir.path)),
                              ""));
                          folderList = selectedDir.listSync();
                        });
                      }
                    });
                  }),
            )
                : Container(),
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: folderList.map((e) {
                  // debugPrint("${path.basename(e.path)}");
                  if (!path.basename(e.path).contains("."))
                    return ListTile(
                      onTap: () {
                        debugPrint(e.path);
                        setState(() {
                          selectedDir = Directory(e.path);
                          folderList = selectedDir.listSync();
                        });
                      },
                      title: Text(path.basename(e.path)),
                      leading: Icon(
                        Icons.folder_rounded,
                        color: Colors.yellow[600],
                      ),
                    );
                  else
                    return Container();
                }).toList()),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
          height: 50,
          child: TextButton(

            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),  ),
              onPressed: () {
                Navigator.of(context).pop(selectedDir.path);
              },
              child: Text("Save to this Folder", style: TextStyle(color: Colors.white),))),
    );
  }


  showCreateFolderDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Create A Folder"),
            content: CustomTextField(
              controller: controller,
              label: "Enter the Folder name",
              iconData: Icons.create_new_folder_sharp,
            ),
            actions: [
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor) ,
                ),
                  onPressed: () async {
                    Directory dir =
                    Directory(selectedDir.path + "/${controller.text}");
                    if (await dir.exists()) {
                      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Folder Already Exists"),
                        backgroundColor: Colors.red[400],

                      ));
                    } else {
                      dir.createSync(recursive: true);
                      setState(() {
                        folderList = selectedDir.listSync();
                      });
                    }
                    controller.clear();
                    Navigator.pop(context);
                  },
                  child: Text("Create", style: TextStyle(color: Colors.white),)),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              )
            ],
          );
        });
  }
}

