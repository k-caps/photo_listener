import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:developer';

class PermissionsHandler {
  // Request permissions and show dialog if necessary
  static Future<void> requestPermissions(BuildContext context) async {
    var status = await Permission.manageExternalStorage.request();

    if (status.isGranted) {
      log("All Files Access permission granted.");
    } else if (status.isDenied || status.isPermanentlyDenied) {
      _showPermissionDialog(context);
    }
  }

  // Open settings dialog
  static void _showPermissionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Permission Required'),
          content: const Text(
            'In order to access all files, please go to your device settings:\n'
            'Settings > Privacy > Permission manager > Files and media\n'
            'Select this app and click "Allowed for all files".',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await openAppSettings();
              },
              child: const Text('Open Settings'),
            ),
          ],
        );
      },
    );
  }
}
