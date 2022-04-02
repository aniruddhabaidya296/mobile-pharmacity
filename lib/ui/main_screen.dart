// ignore_for_file: prefer_const_constructors

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pharmacity/blocs/bloc.dart';
import 'package:pharmacity/constants/colors.dart';
import 'package:pharmacity/constants/size_config.dart';
import 'package:pharmacity/ui/saved/saved_screen.dart';

import 'cart/cart_screen.dart';
import 'home/home_screen.dart';
import 'profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  final selectedTab;
  const MainScreen({Key key, this.selectedTab = SelectedTab.home})
      : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

enum SelectedTab { home, saved, cart, profile }

class _MainScreenState extends State<MainScreen> {
  var _selectedTab;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = SelectedTab.values[i];
    });
  }

  Widget getBody() {
    List<Widget> pages = [
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthenticationBloc(),
          ),
          BlocProvider(
            create: (context) => MedicineBloc()..add(FetchAllMedicines()),
          ),
          BlocProvider(
            create: (context) => MenBloc()..add(FetchAllMens()),
          ),
          BlocProvider(
            create: (context) => WomenBloc()..add(FetchAllWomens()),
          ),
          BlocProvider(
            create: (context) => ElderBloc()..add(FetchAllElders()),
          ),
          BlocProvider(
            create: (context) => BabyBloc()..add(FetchAllBabys()),
          )
        ],
        child: Home(),
      ),
      SavedScreen(),
      BlocProvider(
        create: (context) => MedicineBloc()..add(FetchAllMedicines()),
        child: CartScreen(),
      ),
      Profile()
    ];
    return IndexedStack(
      index: SelectedTab.values.indexOf(_selectedTab),
      children: pages,
    );
  }

  Widget body;

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedTab = widget.selectedTab;
      body = getBody();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: SizeConfig.blockWidth * 8,
        elevation: 2,
        backgroundColor: COLORS.white,
        enableFeedback: false,
        currentIndex: SelectedTab.values.indexOf(_selectedTab),
        onTap: _handleIndexChanged,
        items: [
          /// Home
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              _selectedTab == SelectedTab.home
                  ? Icons.home
                  : Icons.home_outlined,
              size: SizeConfig.blockWidth * 9,
              color: COLORS.primary,
            ),
            backgroundColor: Colors.white,
          ),

          /// Likes
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              _selectedTab == SelectedTab.saved
                  ? FontAwesome.bookmark
                  : Feather.bookmark,
              size: SizeConfig.blockWidth * 8,
              color: COLORS.primary,
            ),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              _selectedTab == SelectedTab.cart
                  ? Icons.shopping_cart
                  : Icons.shopping_cart_outlined,
              size: SizeConfig.blockWidth * 8,
              color: COLORS.primary,
            ),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              _selectedTab == SelectedTab.profile
                  ? Icons.person
                  : Icons.person_outline,
              size: SizeConfig.blockWidth * 8,
              color: COLORS.primary,
            ),
            backgroundColor: Colors.white,
          ),
        ],
      ),
      // extendBody: true,
    );
  }
}
