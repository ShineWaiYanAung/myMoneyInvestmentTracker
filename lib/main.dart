import 'package:flutter/material.dart';
import 'package:money_investment_track/Presentation/bloc/Provider_Data.dart';
import 'package:provider/provider.dart';
import 'Presentation/pages/main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return ProviderData();
      },
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: Color(0xff5E6BB3),
            focusColor: Color(0xff232A53),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: MainScreenPage()),
    );
  }
}
