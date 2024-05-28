import 'dart:io';
import 'package:app/pages/SignInPages.dart';
import 'package:app/pages/profilePages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:app/config/constants.dart';
import 'package:app/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:app/config/themes/theme.dart';
import 'package:image_picker/image_picker.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  User? _user;
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        _user = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          right: kDefaultPadding / 2,
          top: kDefaultPadding,
          left: kDefaultPadding / 2,
          bottom: kDefaultPadding / 2),
      child: Column(
        children: [
          profileInfo(context),
          SizedBox(height: 30),
          profileMenuItems(context),
        ],
      ),
    );
  }

  Container profileInfo(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      margin: EdgeInsets.symmetric(vertical: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.background,
      ),
      child: Row(
        children: [
          // Display the image to the left of the text
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 5,
                color: Colors.transparent,
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: _user?.photoURL != null
                    ? NetworkImage(_user!.photoURL!)
                    : AssetImage('assets/images/logo1.jpg')
                        as ImageProvider<Object>,
              ),
            ),
          ),
          SizedBox(
              width: kDefaultPadding / 2), // Add spacing between image and text
          Expanded(
            child: Container(
              height: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),
                  Text(
                    _user?.email ?? 'Unknown',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Logout button
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignInScreen()),
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }

  Container profileMenuItems(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
        color: Theme.of(context).colorScheme.background,
      ),
      child: Column(
        children: [
          MenuItem(
            prefix: Iconsax.profile_circle4,
            text: 'Hồ sơ ',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            },
          ),
          MenuItemCategory(
            subitems: [
              SubMenuItem(
                icon: Iconsax.sun_1,
                text: 'Chế độ sáng / Chế độ tối',
                endWidget: ToggleThemeSwitcher(
                  value: themeProvider.isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      final provider =
                          Provider.of<ThemeProvider>(context, listen: false);
                      provider.toggleTheme(value);
                    });
                  },
                ),
              ),
              SubMenuItem(
                icon: Iconsax.language_circle,
                text: 'Ngôn ngữ',
                endWidget: Container(
                  child: Text(
                    'Vietnam',
                    style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
            prefix: Iconsax.setting_2,
            text: 'Cài đặt chung',
          )
        ],
      ),
    );
  }
}
