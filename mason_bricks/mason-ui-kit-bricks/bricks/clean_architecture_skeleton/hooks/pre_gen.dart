// import 'dart:io';
// import 'package:mason/mason.dart';

// void run(HookContext context) async {
//   final logger = context.logger;
//   var name = context.vars['name'] as String;

//   final assetsDirectoryProcess =
//       logger.progress('Checking if the assets directory exists...');
//   var result = await Process.run(
//     'ls',
//     ['assets'],
//   );

//   if (result.exitCode != 0) {
//     assetsDirectoryProcess.fail(
//       'You must create the "assets/logo" directory and add all its assets first!',
//     );
//     exit(1);
//   } else {
//     assetsDirectoryProcess.complete(
//       'Assets directory exists!',
//     );
//   }

//   final launcherIconProcess =
//       logger.progress('Checking if the logo for the launcher icon exists...');
//   result = await Process.run(
//     'test',
//     [
//       '-e',
//       'assets/logo/${name.snakeCase}_icons.png',
//     ],
//   );

//   if (result.exitCode != 0) {
//     launcherIconProcess.fail(
//       'You must create a launcher icon with the name "${name.snakeCase}_icons.png" in the "assets/logo" directory before continuing the process!',
//     );
//     exit(1);
//   } else {
//     launcherIconProcess.complete(
//       'Launcher icon exists!',
//     );
//   }
// }

import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) {
  final logger = context.logger;
  var name = context.vars['name'] as String;

  final assetsDirectoryProcess =
      logger.progress('Checking if the assets directory exists...');

  final assetsDir = Directory('assets/logo');
  if (!assetsDir.existsSync()) {
    assetsDirectoryProcess.fail(
      'You must create the "assets/logo" directory and add all its assets first!',
    );
    exit(1);
  } else {
    assetsDirectoryProcess.complete(
      'Assets directory exists!',
    );
  }

  final launcherIconProcess =
      logger.progress('Checking if the logo for the launcher icon exists...');
  final launcherIcon = File('assets/logo/${name.snakeCase}_icons.png');

  if (!launcherIcon.existsSync()) {
    launcherIconProcess.fail(
      'You must create a launcher icon with the name "${name.snakeCase}_icons.png" in the "assets/logo" directory before continuing the process!',
    );
    exit(1);
  } else {
    launcherIconProcess.complete(
      'Launcher icon exists!',
    );
  }
}
