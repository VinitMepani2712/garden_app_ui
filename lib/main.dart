import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garden_app_ui/bottombar/bottom_nav_bar.dart';
import 'package:garden_app_ui/pages/splash_screen.dart';
import 'package:garden_app_ui/provider/cart_screen_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'provider/homes_screen_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool hasOpenedApp = prefs.getBool('hasOpenedApp') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProviderScreen(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: MyApp(hasOpenedApp: hasOpenedApp),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool hasOpenedApp;

  const MyApp({Key? key, required this.hasOpenedApp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: hasOpenedApp ? BottomNavBarScreen() : SplashScreen(),
      ),
    );
  }
}
