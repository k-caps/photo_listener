import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AppState extends ChangeNotifier {
  static const String noFolderChosen = 'No folder chosen yet.';
  String? _folderName = noFolderChosen;
  String? get folderName => _folderName;

  Future<void> getFolder() async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    if (selectedDirectory != null) {
      _folderName = selectedDirectory;
    } else {
      // User canceled the picker
      _folderName = noFolderChosen;
    }
    notifyListeners();
  }
}