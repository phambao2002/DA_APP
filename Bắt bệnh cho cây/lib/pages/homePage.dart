import 'package:app/pages/CameraPage.dart';
import 'package:flutter/material.dart';
import 'package:app/config/themes/theme.dart';
import 'package:app/services/disease_provider.dart';
import 'package:app/src/suggestions_page/suggestions.dart';
import 'package:provider/provider.dart';
import 'package:iconsax/iconsax.dart';
import 'package:app/pages/accountPage.dart';
import 'package:app/pages/plantPage.dart';
import 'package:flutter/widgets.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DiseaseService()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Builder(
        builder: (context) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Plant Disease Detector',
            themeMode: themeProvider.themeMode,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            initialRoute: '/',
            routes: {
              '/camera': (context) => CameraPage(),
              '/plant': (context) => PlantPage(),
              '/account': (context) => AccountPage(),

              Suggestions.routeName: (context) =>
                  const Suggestions(), // Add this route
            },
          );
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  static const String route = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  final List pages = [PlantPage(), CameraPage(), AccountPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            label: 'Home',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Iconsax.home),
          //   label: 'My Plants',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.profile_circle4),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
