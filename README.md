# Folder Selector

[![pub_package](https://img.shields.io/pub/v/folder_selector?color=green)](https://pub.dev/packages/folder_selector)
<!-- ![1](https://user-images.githubusercontent.com/47639176/122762994-7d6dd780-d2bb-11eb-8e25-aca949d85576.jpeg) -->
<!-- ![2](https://user-images.githubusercontent.com/47639176/122763064-8f4f7a80-d2bb-11eb-91de-9cbd2ccb7ac7.jpeg)
![3](https://user-images.githubusercontent.com/47639176/122763086-924a6b00-d2bb-11eb-8108-d903bfa26ddc.jpeg)
![4](https://user-images.githubusercontent.com/47639176/122763106-95ddf200-d2bb-11eb-9b70-aab6bc4a9682.jpeg)
![5](https://user-images.githubusercontent.com/47639176/122763116-98d8e280-d2bb-11eb-8dff-4adad1719f43.jpeg)
![6](https://user-images.githubusercontent.com/47639176/122763122-9b3b3c80-d2bb-11eb-8cb0-d21e0a2ee8b4.jpeg) -->

A new Flutter Plugin for selecting Folder in Android and IOS

<img src="https://user-images.githubusercontent.com/47639176/122762994-7d6dd780-d2bb-11eb-8e25-aca949d85576.jpeg" width="256" height="455"> <img src="https://user-images.githubusercontent.com/47639176/122763064-8f4f7a80-d2bb-11eb-91de-9cbd2ccb7ac7.jpeg" width="256" height="455"> <img src="https://user-images.githubusercontent.com/47639176/122763086-924a6b00-d2bb-11eb-8108-d903bfa26ddc.jpeg" width="256" height="455"> <img src="https://user-images.githubusercontent.com/47639176/122763106-95ddf200-d2bb-11eb-9b70-aab6bc4a9682.jpeg" width="256" height="455"> <img src="https://user-images.githubusercontent.com/47639176/122763116-98d8e280-d2bb-11eb-8dff-4adad1719f43.jpeg" width="256" height="455"> <img src="https://user-images.githubusercontent.com/47639176/122763122-9b3b3c80-d2bb-11eb-8cb0-d21e0a2ee8b4.jpeg" width="256" height="455">

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
