import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../logic/app_state.dart';
import '../logic/manage_files.dart';
import '../logic/permissions.dart'; // Import the permissions logic
import 'selected_file_display.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    requestPermissions(context); // Request permissions
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var pickedFolder = appState.folderName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectedFileDisplay(folderName: pickedFolder),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                appState.getFolder();
              },
              child: Text('Pick a folder to watch'),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ManageFiles(),
            ),
          ],
        ),
      ),
    );
  }
}