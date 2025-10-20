import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/index.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppTheme.lightTheme,
      dark: AppTheme.darkTheme,
      initial: AdaptiveThemeMode.light,
      debugShowFloatingThemeButton: true,
      builder: (theme, darkTheme) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          // 路由
          theme: theme,
          darkTheme: darkTheme,
          initialRoute: RouteNames.root,
          getPages: RoutePages.list,
        );
      },
    );
  }
}
