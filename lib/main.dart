import 'package:flutter/material.dart';
import 'package:money_investment_track/Presentation/bloc/Provider_Data.dart';
import 'package:money_investment_track/Presentation/pages/subpages/minSubPage/microSubPage/currency_detail_data.dart';
import 'package:provider/provider.dart';
import 'Presentation/pages/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
          Provider(create: (context) => ProviderData(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff5E6BB3),
          focusColor: Color(0xff232A53),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MainScreenPage()
      ),
    );
  }
}

