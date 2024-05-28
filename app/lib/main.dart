import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:app/config/themes/theme.dart';
import 'package:app/pages/homePage.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:app/services/disease_provider.dart';
import 'package:app/src/home_page/models/disease_model.dart';
import 'package:app/src/suggestions_page/suggestions.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(DiseaseAdapter());
  await Hive.openBox<Disease>('plant_diseases');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => DiseaseService()),
      ],
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'PlantAi',
          themeMode: themeProvider.themeMode,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          onGenerateRoute: (RouteSettings routeSettings) {
            switch (routeSettings.name) {
              case Suggestions.routeName:
                return MaterialPageRoute(builder: (_) => const Suggestions());
              case HomePage.route:
                return MaterialPageRoute(builder: (_) => HomePage());
            }
          },
        );
      },
    );
  }
}
