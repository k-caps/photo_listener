//import 'dart:io';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../logic/app_state.dart';
import '../logic/manage_files.dart';

import 'dart:developer';
import 'package:path/path.dart' as p;

class SelectedFileDisplay extends StatelessWidget {
  const SelectedFileDisplay({
    super.key,
    required this.folderName,
  });

  final String? folderName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.bodyMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    String noFolderChosenMessage = 'No folder chosen yet.';
    bool noFolderChosen = folderName == noFolderChosenMessage;
    String watchedFolderMessage = noFolderChosen
      ? noFolderChosenMessage
      : "You are watching\n${folderName.toString()}\nfor changes.";

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Text(watchedFolderMessage, 
          style: style, 
        ),
      ),
    );
  }
}

class ManageFiles extends StatelessWidget {
  const ManageFiles({super.key});

  @override
  Widget build(BuildContext context) {
    
    var appState = context.watch<AppState>();
    var pickedFolder = appState.folderName;
    log("$pickedFolder");
    //var fileList = listFilesInFolder(pickedFolder.toString());
    // Fetch files, excluding directories like .thumbnails
    var fileList = pickedFolder != null
      ? Directory('/storage/emulated/0/Pictures/')
          .listSync()
          .where((file) => FileSystemEntity.isFileSync(file.path)) // Filter only files
          .map((file) => p.basename(file.path)) // Extract filenames
          .toList()
      : [];

    // Debugging: Print the fileList to check if it's empty
    log("File List: $fileList");
  
    return Column(
      children: [
        Text('Files in folder:'),
        Expanded(
          child: ListView.builder(
            itemCount: fileList.length,
            itemBuilder: (context, index) {
              return ListTile(
                //title: Text(fileList[index]),
                title: Text('hihihihihihih'),
              );
            },
          ),
        ),
      ],
    );
  }
}

