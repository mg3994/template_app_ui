import 'package:flutter/material.dart';
import 'package:antinna_ui_kit/antinna_ui_kit.dart';

class AComponentInitTest extends StatelessWidget {
  const AComponentInitTest({
    super.key, 
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) => AComponentInit(
    builder: (_) => MaterialApp(
      title: 'Antinna UI Kit',
      theme: ATheme.main().copyWith(
        extensions: <ThemeExtension<dynamic>>[
          AColorTheme.light,
        ],
      ),
      darkTheme: ATheme.main().copyWith(
        extensions: <ThemeExtension<dynamic>>[
          AColorTheme.dark,
        ],
      ),
      home: child,
    ),
  );
}
