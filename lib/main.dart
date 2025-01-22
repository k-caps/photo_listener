import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'logic/app_state.dart';
import 'ui/main_screen.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(PhotoListener());
}

class PhotoListener extends StatelessWidget {
  const PhotoListener({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'Photo Listener',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        ),
        home: MainScreen(),
      ),
    );
  }
}



