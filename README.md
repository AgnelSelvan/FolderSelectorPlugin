# Folder Selector

[![pub_package](https://img.shields.io/pub/v/folder_selector?color=green)](https://pub.dev/packages/folder_selector)

A new Flutter Plugin for selecting Folder in Android and IOS

![Screenshot](./outputs/1.jpeg){:height="36px" width="36px"}  ![Screenshot](./outputs/2.jpeg){:height="36px" width="36px"} ![Screenshot](./outputs/3.jpeg) ![Screenshot](./outputs/4.jpeg) ![Screenshot](./outputs/5.jpeg) ![Screenshot](./outputs/5.jpeg) ![Screenshot](./outputs/6.jpeg) 

## Usage

A File Selector Page is Available 
On Selecting a folder return the path as String Format
```dart
import 'package:folder_selector/folder_selector.dart';
String path = await Navigator.of(context).push<String>(MaterialPageRoute(builder: (context) => FolderSelector(rootDir: rootDir,) ));
```

## Parameters
- **rootDir** `Directory` *required* : To start from which Directory the path has to be selected
- **title** `String` : Title of the Folder Selector Page

## Permissions

```xml
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
```
