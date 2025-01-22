import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> requestPermissions(BuildContext context) async {
  if (await Permission.storage.request().isGranted) {
    // The permission is granted, proceed with your logic
  } else {
    // The permission is denied, show instructions to the user
    _showPermissionDialog(context);
  }
}

void _showPermissionDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Permission Required'),
      content: Text(
        'In order to access all files, please go to your device settings:\n'
        'Settings > Privacy > Permission manager > Files and media\n'
        'Select this app and click "Allowed for all files".',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('OK'),
        ),
      ],
    ),
  );
}