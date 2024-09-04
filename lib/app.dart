import 'package:example_ci_cd/app_update_utility.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'flavors.dart';
import 'pages/my_home_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AppUpdateUtility.checkAppUpdate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: F.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _flavorBanner(
        child: MyHomePage(),
        show: kDebugMode,
      ),
    );
  }

  Widget _flavorBanner({
    required Widget child,
    bool show = true,
  }) =>
      show
          ? Banner(
              location: BannerLocation.topStart,
              message: F.name,
              color: Colors.green.withOpacity(0.6),
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12.0,
                  letterSpacing: 1.0),
              textDirection: TextDirection.ltr,
              child: child,
            )
          : Container(
              child: child,
            );
}
