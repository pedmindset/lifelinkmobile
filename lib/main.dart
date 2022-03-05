import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/providers/theme_provider.dart';
import 'src/screens/splash_screen.dart';
import 'src/utils/colors.dart';
import 'src/utils/shared_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PreferenceUtils.init();
  PreferenceUtils.setBool(prefLoggedIn, true);
  var darkMode = await SharedPrefs.getDarkMode();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(darkMode ? darkTheme : lightTheme),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'life link ghana',
      theme: themeNotifier.getTheme(),
      home: const SplashScreen(),
      // onGenerateRoute: (RouteSettings settings) {
      //   switch (settings.name) {
      //     case '/login':
      //       return MyCustomRoute(
      //         builder: (_) => const LoginScreen(),
      //         settings: settings,
      //       );

      //     case '/home':
      //       return MyCustomRoute(
      //         builder: (_) => const MainScreen(),
      //         settings: settings,
      //       );
      //     default:
      //       return MyCustomRoute(
      //         builder: (_) => const SplashScreen(),
      //         settings: settings,
      //       );
      //   }
      // },
    );
  }
}
