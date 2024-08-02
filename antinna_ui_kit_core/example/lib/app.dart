import 'package:flutter/material.dart';
import 'package:/.dart';

import '/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => ANTINNAComponentInit(
        builder: (_) => MaterialApp(
          title: 'Antinna UI KIT',
          theme: ANTINNATheme.main().copyWith(
            extensions: <ThemeExtension<dynamic>>[
              ANTINNAColorTheme.light,
            ],
          ),
          darkTheme: ANTINNATheme.main().copyWith(
            extensions: <ThemeExtension<dynamic>>[
              ANTINNAColorTheme.dark,
            ],
          ),
          home: const HomePage(),
        ),
      );
}
