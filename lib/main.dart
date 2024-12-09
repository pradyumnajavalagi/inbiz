import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'home_page.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Test the path_provider functionality
  await testPathProvider();
  await dotenv.load(fileName: ".env");

  runApp(MyApp());
}

Future<void> testPathProvider() async {
  final directory = await getApplicationSupportDirectory();
  print("App Support Directory: ${directory.path}");
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData.dark(),
    );
  }
}