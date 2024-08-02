import 'package:flutter/material.dart';
import 'package:/.dart';

class ANTINNAComponentInitTest extends StatelessWidget {
  const ANTINNAComponentInitTest({
    super.key, 
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) => ANTINNAComponentInit(
    builder: (_) => MaterialApp(
      title: 'Antinna UI Kit',
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
      home: child,
    ),
  );
}
