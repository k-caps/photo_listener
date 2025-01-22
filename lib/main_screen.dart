import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'logic/app_state.dart';
import 'ui/selected_file_display.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var pickedFolder = appState.folderName;

    return Scaffold(
      /*appBar: AppBar(
        title: Text('Main Screen'),
      ),
      */
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: buildChildren(appState, pickedFolder),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // The file picker button and the selected file display
  List<Widget> buildChildren(AppState appState, String? pickedFolder) {
    return [
      SelectedFileDisplay(folderName: pickedFolder),
      SizedBox(height: 10),
      ElevatedButton(
        onPressed: () {
          appState.getFolder();
        },
        child: Text('Pick a folder to watch'),
      ),
      SizedBox(height: 10),
      Flexible(
        child: SizedBox(
          height: 20, // set vertical center by
          child: ManageFiles(),
        ),
      ),
    ];
  }
}