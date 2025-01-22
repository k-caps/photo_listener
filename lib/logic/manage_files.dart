
import 'dart:io';

// Lists files in the given folder.
List<FileSystemEntity> listFilesInFolder(String folderPath) {
  final directory = Directory(folderPath);
  if (directory.existsSync()) {
    return directory.listSync();
  } else {
    return [];
  }
}

// // Lists files in the given folder.
// List<FileSystemEntity> listFilesInFolder(String folderPath) {
//   final directory = Directory(folderPath);
//   if (directory.existsSync()) {
//     return directory.listSync();
//   } else {
//     return [];
//   }
// }

