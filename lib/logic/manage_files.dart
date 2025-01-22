
import 'dart:io';
import 'package:path/path.dart' as p;

// Lists files in the given folder.
List<FileSystemEntity> listFilesInFolder(String folderPath) {
  final directory = Directory(folderPath);
  if (directory.existsSync()) {
    // Filter out directories and include only files
    return directory.listSync().whereType<File>().toList();
  } else {
    return [];
  }
}

// Returns the basename of the given file object
String getBasename(FileSystemEntity file) {
  return p.basename(file.path);
}



    // // Fetch files, excluding directories like .thumbnails
    
    //   ? Directory('/storage/emulated/0/Pictures/')
    //       .listSync()
    //       .where((file) => FileSystemEntity.isFileSync(file.path)) // Filter only files
    //       .map((file) => p.basename(file.path)) // Extract filenames
    //       .toList()
    //   : [];

