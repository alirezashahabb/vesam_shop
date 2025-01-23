import 'package:flutter/material.dart';
import 'package:online_shop/screens/basket/basket.dart';
import 'package:online_shop/screens/home/home.dart';
import 'package:online_shop/screens/profile/profil.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

int _selctedIndex = 0;

final GlobalKey<NavigatorState> homeKey = GlobalKey();
final GlobalKey<NavigatorState> basketKey = GlobalKey();
final GlobalKey<NavigatorState> profileKey = GlobalKey();

Widget selectedScreen = HomeScreen();

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        unselectedFontSize: 12,
        currentIndex: _selctedIndex,
        onTap: (value) {
          setState(() {
            _selctedIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'خانه',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_rounded), label: 'سبد خرید'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
            ),
            label: 'پروفایل',
          ),
        ],
      ),
      body: IndexedStack(index: _selctedIndex, children: [
        Navigator(
          key: homeKey,
          onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => HomeScreen(),
            settings: settings,
          ),
        ),
        Navigator(
          key: basketKey,
          onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => BasketScreen(),
            settings: settings,
          ),
        ),
        Navigator(
          key: profileKey,
          onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => ProfileScreen(),
            settings: settings,
          ),
        ),
      ]),
    );
  }
}
