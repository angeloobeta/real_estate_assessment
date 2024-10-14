import 'package:flutter/material.dart';
import 'package:real_estate_assessment/resources/resources.dart';
import 'package:real_estate_assessment/views/pages/chat/chatScreen.dart';
import 'package:real_estate_assessment/views/pages/favourite/favouriteScreen.dart';
import 'package:real_estate_assessment/views/pages/home/homeScreen.dart';
import 'package:real_estate_assessment/views/pages/location/locationScreen.dart';
import 'package:real_estate_assessment/views/pages/profile/profile.dart';
import 'package:real_estate_assessment/views/reusableWidgets/home/bottomNavBar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<Widget> screens;
  ValueNotifier<int> index = ValueNotifier(2);

  @override
  void initState() {
    super.initState();
    screens = [
      const LocationScreen(),
      const ChatScreen(),
      const HomeScreen(),
      const FavouriteScreen(),
      const ProfileScreen(),
    ];
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      precacheImage(const AssetImage(AppImage.mapImage), context);
    });
  }

  @override
  void dispose() {
    index.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: index,
      builder: (context, selectedIndex, _) {
        return Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: screens[selectedIndex],
              ),
              Align(
                alignment: const Alignment(0, 0.92),
                child: BottomNavBar(
                    currentIndex: selectedIndex,
                    onChanged: (value) {
                      index.value = value;
                    }),
              ),
            ],
          ),
        );
      },
    );
  }
}
