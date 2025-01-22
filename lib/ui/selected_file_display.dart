//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../logic/app_state.dart';
import '../logic/manage_files.dart';
import 'dart:developer';

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
    log("Picked folder: $pickedFolder");
    var fileList = listFilesInFolder(pickedFolder!);

    log("File List: $fileList");
  
    return Column(
      children: [
        Text('Files in folder:'),
        Expanded(
          child: ListView.builder(
            itemCount: fileList.length,
            itemBuilder: (context, index) {
              String fileName = getBasename(fileList[index]);
              return ListTile(
                title: Text(fileName),
              );
            },
          ),
        ),
      ],
    );
  }
}

