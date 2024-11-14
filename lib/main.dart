import 'package:flutter/material.dart';
import 'package:money_investment_track/Presentation/bloc/Provider_Data.dart';
import 'package:money_investment_track/enter_screen.dart';
import 'package:provider/provider.dart';
import 'DataBase/HiveDataBase/Domain/Crypto/crypto.dart';
import 'DataBase/HiveDataBase/Domain/Crypto/file_adapter.dart';
import 'DataBase/HiveDataBase/Domain/CurrencyData/currency_data.dart';
import 'DataBase/HiveDataBase/Domain/LoginName/user_name.dart';
import 'Presentation/pages/main_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized

  // Initialize Hive with Flutter support
  await Hive.initFlutter();

  // Register Hive adapters for the custom objects
  Hive.registerAdapter(UserNameAdapter());
  Hive.registerAdapter(CryptoAdapter());
  Hive.registerAdapter(CurrencyInvestmentDataAdapter());
  Hive.registerAdapter(FileAdapter());

  // Open the boxes needed for storing data
  await Hive.openBox<UserName>("UserName"); // Open the UserName box
  await Hive.openBox<Crypto>("CryptoData");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        final provider = ProviderData();
        provider.loadNameData(); // Load data here before building the widget
        return provider;
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff5E6BB3),
          focusColor: Color(0xff232A53),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Consumer<ProviderData>(
          builder: (BuildContext context, ProviderData value, Widget? child) {
            // Use the value to decide which screen to show
            if (value.name?.isEmpty ?? true) {
              return EnterScreen();
            } else {
              return MainScreenPage();
            }
          },
        ),
      ),
    );
  }
}
