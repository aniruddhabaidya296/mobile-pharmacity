// ignore_for_file: prefer_const_constructors, unused_field

import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:pharmacity/blocs/healthcare/baby/baby_bloc.dart';
import 'package:pharmacity/blocs/healthcare/elder/elder_bloc.dart';
import 'package:pharmacity/blocs/healthcare/men/men_bloc.dart';
import 'package:pharmacity/blocs/healthcare/women/women_bloc.dart';
import 'package:pharmacity/ui/home/drawer_items/payment/payment_methods.dart';
import 'package:pharmacity/ui/saved/saved_screen.dart';
import 'blocs/bloc.dart';
import 'constants/colors.dart';
import 'constants/size_config.dart';

import 'ui/home/drawer_items/address/delivery_addresses.dart';
import 'ui/home/home_details.dart';
import 'ui/home/home_screen.dart';
import 'ui/main_screen.dart';
import 'ui/initial/login.dart';
import 'ui/initial/otp_screen.dart';
import 'ui/profile/profile_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Pharmacity',
      themeMode: ThemeMode.light, //or dark / system
      darkTheme: NeumorphicThemeData(
        baseColor: COLORS.primary,
        accentColor: COLORS.primary,
        lightSource: LightSource.topLeft,
        depth: 4,
        intensity: 0.3,
      ),
      materialTheme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: COLORS.primary,
          ),
          fontFamily: 'Visby'),

      theme: NeumorphicThemeData(
        baseColor: COLORS.primary,
        accentColor: Colors.cyan,
        lightSource: LightSource.topLeft,
        depth: 6,
        intensity: 0.5,
      ),
      home: BlocProvider(
        create: (BuildContext context) => AuthenticationBloc()
          ..add(
            AuthenticationCheck(),
          ),
        child: IntroSplashScreen(),
      ),
      routes: {
        '/authentication': (context) => BlocProvider(
              create: (context) =>
                  AuthenticationBloc()..add(AuthenticationCheck()),
              child: IntroSplashScreen(),
            ),
        '/login': (context) => LoginScreen(),
        '/otp': (context) => VerifyPhone(),
        '/home_details': (context) => HomeDetails(),
        '/home': (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (BuildContext context) => AuthenticationBloc(),
                ),
                BlocProvider(
                  create: (BuildContext context) => MedicineBloc()
                    ..add(
                      FetchAllMedicines(),
                    ),
                ),
                BlocProvider(
                  create: (context) => CartBloc(),
                ),
              ],
              child: Home(),
            ),
        // '/item_details': (context) => MainScreen(),
        '/saved': (context) => SavedScreen(),
        '/payment_methods': (context) => PaymentMethods(),
        '/delivery_addresses': (context) => DeliveryAddresses(),
        '/profile': (context) => Profile(),
        // '/my_account': (context) => MyAccount(),
        // '/shop_by_category': (context) => ShopByCategory(),
        // '/my_orders': (context) => MyOrders(),
        // '/order_details': (context) => OrderDetails(),
        // '/cart': (context) => Cart(),
        // '/add_card': (context) => AddCard(),
        // '/categories': (context) => Categories(),
        // '/add_upi': (context) => AddUpi(),
        // '/faq': (context) => Faq(),
        // '/notifications': (context) => Notifications(),
        // '/chat_screen': (context) => ChatScreen()
      },
    );
  }
}

class IntroSplashScreen extends StatefulWidget {
  const IntroSplashScreen({Key key}) : super(key: key);

  @override
  _IntroSplashScreenState createState() => _IntroSplashScreenState();
}

class _IntroSplashScreenState extends State<IntroSplashScreen> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    await Firebase.initializeApp();

    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initializeFlutterFire();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationLoading) {
          return Scaffold(
            backgroundColor: COLORS.secordary,
            body: Center(
              child: AnimatedContainer(
                duration: Duration(seconds: 2),
                curve: Curves.bounceIn,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Pharmacity",
                      style: TextStyle(
                          color: COLORS.primary,
                          fontFamily: 'Visby',
                          fontSize: SizeConfig.blockWidth * 8,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is AuthenticationSuccess) {
          return MultiBlocProvider(
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
            child: MainScreen(),
          );
        }
        return BlocProvider(
          create: (BuildContext context) => LoginBloc(),
          child: LoginScreen(),
        );
      },
    );
  }
}
