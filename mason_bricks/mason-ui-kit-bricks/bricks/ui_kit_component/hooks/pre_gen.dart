// // import 'dart:io';
// // import 'package:mason/mason.dart';
// // import 'package:yaml/yaml.dart';

// // void run(HookContext context) async {
// //   final logger = context.logger;

// //   // Check if properties key is present in the vars. If not, prompt the user for input.
// //   if (!context.vars.containsKey('properties')) {
// //     final numberOfProperties = int.parse(logger.prompt(
// //       'How many properties does your component have?: ',
// //       defaultValue: '0',
// //     ));

// //     List<Map<String, dynamic>> properties = [];

// //     for (var i = 0; i < numberOfProperties; i++) {
// //       var propertyName = logger.prompt(
// //         'Enter the name of property ${i + 1}: ',
// //       );
// //       var propertyType = logger.prompt(
// //         'Enter the type of property ${i + 1} (according to Flutter, e.g., String): ',
// //       );
// //       var isRequired = logger.confirm(
// //         'Is property ${i + 1} required? (yes/no): ',
// //         defaultValue: false,
// //       );
// //       var defaultValue = logger.prompt(
// //         'Enter the default value for property ${i + 1}: ',
// //         defaultValue: '',
// //       );

// //       properties.add({
// //         'name': propertyName,
// //         'type': propertyType,
// //         'isRequired': isRequired,
// //         'default': defaultValue,
// //       });
// //     }

// //     context.vars = {
// //       ...context.vars,
// //       'properties': properties,
// //     };
// //   }

// //   // Check if enums key is present in the vars. If not, prompt the user for input.
// //   if (!context.vars.containsKey('enums')) {
// //     final hasEnums = logger.confirm(
// //       'Does this component have any enum classes? (yes/no): ',
// //       defaultValue: false,
// //     );

// //     List<Map<String, dynamic>> enums = [];

// //     if (hasEnums) {
// //       final numberOfEnums = int.parse(logger.prompt(
// //         'How many enum classes does your component have?: ',
// //         defaultValue: '0',
// //       ));

// //       for (var i = 0; i < numberOfEnums; i++) {
// //         var enumName = logger.prompt(
// //           'Enter the name of enum class ${i + 1}: ',
// //         );

// //         List<String> enumValues = [];

// //         var numberOfEnumValues = int.parse(logger.prompt(
// //           'How many values does ${enumName} have?: ',
// //           defaultValue: '0',
// //         ));

// //         for (var j = 0; j < numberOfEnumValues; j++) {
// //           var enumValue = logger.prompt(
// //             'Enter the value for ${enumName} (Value ${j + 1}): ',
// //           );

// //           enumValues.add(enumValue);
// //         }

// //         enums.add({
// //           'name': enumName,
// //           'values': enumValues,
// //         });
// //       }
// //     }

// //     context.vars = {
// //       ...context.vars,
// //       'enums': enums,
// //     };
// //   }

// //   final directory = '${Directory.current.path}${Platform.pathSeparator}lib';
// //   List<String> folders;

// //   try {
// //     folders = directory.split(Platform.pathSeparator).toList();

// //     final libIndex = folders.indexWhere((folder) => folder == 'lib');

// //     final pubSpecFile =
// //         File('${folders.sublist(0, libIndex).join('/')}/pubspec.yaml');
// //     final content = await pubSpecFile.readAsString();
// //     final yamlMap = loadYaml(content);
// //     final packageName = yamlMap['name'];

// //     if (packageName == null) {
// //       throw PubspecException();
// //     }

// //     context.vars = {
// //       ...context.vars,
// //       'packageName': packageName,
// //       'componentPath':
// //           'src/components/${(context.vars['name'] as String).snakeCase}',
// //     };
// //   } on RangeError catch (_) {
// //     logger.alert(red.wrap('Could not find lib folder in $directory'));
// //     logger.alert(red.wrap('Re-run this brick inside your lib folder'));
// //     throw Exception();
// //   } on FileSystemException {
// //     logger.alert(
// //       red.wrap(
// //         'Could not find pubspec.yaml in ${directory.replaceAll('\\lib', '')}',
// //       ),
// //     );
// //   } on PubspecException {
// //     logger.alert(red.wrap('Could not read package name in pubspec.yaml'));
// //   } catch (e) {
// //     throw e;
// //   }
// // }

// // class PubspecException implements Exception {}

// ///////////
// ///
// ///
// ///
// import 'dart:io';
// import 'package:mason/mason.dart';
// import 'package:yaml/yaml.dart';

// void run(HookContext context) async {
//   final logger = context.logger;

//   // Prompt user for properties if not provided
//   if (!context.vars.containsKey('properties')) {
//     final numberOfProperties = int.parse(logger.prompt(
//       'How many properties does your component have?: ',
//       defaultValue: '0',
//     ));

//     final properties = <Map<String, dynamic>>[];

//     for (var i = 0; i < numberOfProperties; i++) {
//       final propertyName =
//           logger.prompt('Enter the name of property ${i + 1}: ');
//       final propertyType =
//           logger.prompt('Enter the type of property ${i + 1} (e.g., String): ');
//       final isRequired = logger.confirm(
//           'Is property ${i + 1} required? (yes/no): ',
//           defaultValue: false);
//       final defaultValue = logger.prompt(
//           'Enter the default value for property ${i + 1}: ',
//           defaultValue: '');

//       properties.add({
//         'name': propertyName,
//         'type': propertyType,
//         'isRequired': isRequired,
//         'default': defaultValue,
//       });
//     }

//     context.vars = {...context.vars, 'properties': properties};
//   }

//   // Prompt user for enums if not provided
//   if (!context.vars.containsKey('enums')) {
//     final hasEnums = logger.confirm(
//         'Does this component have any enum classes? (yes/no): ',
//         defaultValue: false);

//     final enums = <Map<String, dynamic>>[];

//     if (hasEnums) {
//       final numberOfEnums = int.parse(logger.prompt(
//           'How many enum classes does your component have?: ',
//           defaultValue: '0'));

//       for (var i = 0; i < numberOfEnums; i++) {
//         final enumName =
//             logger.prompt('Enter the name of enum class ${i + 1}: ');

//         final enumValues = <String>[];

//         final numberOfEnumValues = int.parse(logger.prompt(
//             'How many values does $enumName have?: ',
//             defaultValue: '0'));

//         for (var j = 0; j < numberOfEnumValues; j++) {
//           final enumValue =
//               logger.prompt('Enter the value for $enumName (Value ${j + 1}): ');
//           enumValues.add(enumValue);
//         }

//         enums.add({
//           'name': enumName,
//           'values': enumValues,
//         });
//       }
//     }

//     context.vars = {...context.vars, 'enums': enums};
//   }

//   // Determine the package name from pubspec.yaml
//   final libDirectory = '${Directory.current.path}${Platform.pathSeparator}lib';
//   try {
//     final libPathParts = libDirectory.split(Platform.pathSeparator);

//     final libIndex = libPathParts.indexWhere((part) => part == 'lib');
//     if (libIndex == -1) {
//       throw DirectoryNotFoundException('lib folder not found in $libDirectory');
//     }

//     final pubspecFilePath =
//         '${libPathParts.sublist(0, libIndex).join(Platform.pathSeparator)}/pubspec.yaml';
//     final pubspecFile = File(pubspecFilePath);
//     final pubspecContent = await pubspecFile.readAsString();
//     final yamlMap = loadYaml(pubspecContent);
//     final packageName = yamlMap['name'];

//     if (packageName == null) {
//       throw PackageNameNotFoundException();
//     }

//     context.vars = {
//       ...context.vars,
//       'packageName': packageName,
//       'componentPath':
//           'src/components/${(context.vars['name'] as String).snakeCase}',
//     };
//   } on FileSystemException {
//     logger.alert(red.wrap('Could not find pubspec.yaml in $libDirectory'));
//     throw Exception('Could not find pubspec.yaml');
//   } on DirectoryNotFoundException catch (e) {
//     logger.alert(red.wrap(e.message));
//     throw e;
//   } on PackageNameNotFoundException {
//     logger.alert(red.wrap('Could not read package name in pubspec.yaml'));
//     throw Exception('Could not read package name');
//   } catch (e) {
//     rethrow;
//   }
// }

// class DirectoryNotFoundException implements Exception {
//   final String message;
//   DirectoryNotFoundException(this.message);
// }

// class PackageNameNotFoundException implements Exception {}

///////
///
///
///
import 'dart:io';
import 'package:mason/mason.dart';
import 'package:yaml/yaml.dart';

// Main entry point for the hook
void run(HookContext context) async {
  final logger = context.logger;

  // Prompt user for properties if not already provided
  if (!context.vars.containsKey('properties')) {
    context.vars['properties'] = await _getPropertiesFromUser(logger);
  }

  // Prompt user for enums if not already provided
  if (!context.vars.containsKey('enums')) {
    context.vars['enums'] = await _getEnumsFromUser(logger);
  }

  // Determine the package name and component path
  await _determinePackageNameAndPath(context);
}

// Prompts user for properties
Future<List<Map<String, dynamic>>> _getPropertiesFromUser(Logger logger) async {
  final numberOfProperties = int.parse(logger.prompt(
    'How many properties does your component have?: ',
    defaultValue: '0',
  ));

  final properties = <Map<String, dynamic>>[];

  for (var i = 0; i < numberOfProperties; i++) {
    final propertyName = logger.prompt('Enter the name of property ${i + 1}: ');
    final propertyType =
        logger.prompt('Enter the type of property ${i + 1} (e.g., String): ');
    final isRequired = logger.confirm(
        'Is property ${i + 1} required? (yes/no): ',
        defaultValue: false);
    final defaultValue = logger.prompt(
        'Enter the default value for property ${i + 1}: ',
        defaultValue: '');

    properties.add({
      'name': propertyName,
      'type': propertyType,
      'isRequired': isRequired,
      'default': defaultValue,
    });
  }

  return properties;
}

// Prompts user for enums
Future<List<Map<String, dynamic>>> _getEnumsFromUser(Logger logger) async {
  final hasEnums = logger.confirm(
      'Does this component have any enum classes? (yes/no): ',
      defaultValue: false);

  final enums = <Map<String, dynamic>>[];

  if (hasEnums) {
    final numberOfEnums = int.parse(logger.prompt(
        'How many enum classes does your component have?: ',
        defaultValue: '0'));

    for (var i = 0; i < numberOfEnums; i++) {
      final enumName = logger.prompt('Enter the name of enum class ${i + 1}: ');
      final enumValues = <String>[];

      final numberOfEnumValues = int.parse(logger
          .prompt('How many values does $enumName have?: ', defaultValue: '0'));

      for (var j = 0; j < numberOfEnumValues; j++) {
        final enumValue =
            logger.prompt('Enter the value for $enumName (Value ${j + 1}): ');
        enumValues.add(enumValue);
      }

      enums.add({
        'name': enumName,
        'values': enumValues,
      });
    }
  }

  return enums;
}

// Determines the package name and component path
Future<void> _determinePackageNameAndPath(HookContext context) async {
  final libDirectory = '${Directory.current.path}${Platform.pathSeparator}lib';

  try {
    final pubspecFilePath = _findPubspecFilePath(libDirectory);
    final packageName = await _getPackageNameFromFile(pubspecFilePath);

    if (packageName == null) {
      throw PackageNameNotFoundException();
    }

    context.vars = {
      ...context.vars,
      'packageName': packageName,
      'componentPath':
          'src/components/${(context.vars['name'] as String).snakeCase}',
    };
  } on FileSystemException {
    context.logger.alert('Could not find pubspec.yaml in $libDirectory');
    throw Exception('Could not find pubspec.yaml');
  } on DirectoryNotFoundException catch (e) {
    context.logger.alert(e.message);
    throw e;
  } on PackageNameNotFoundException {
    context.logger.alert('Could not read package name in pubspec.yaml');
    throw Exception('Could not read package name');
  } catch (e) {
    rethrow;
  }
}

// Finds the path to pubspec.yaml
String _findPubspecFilePath(String libDirectory) {
  final libPathParts = libDirectory.split(Platform.pathSeparator);
  final libIndex = libPathParts.indexWhere((part) => part == 'lib');

  if (libIndex == -1) {
    throw DirectoryNotFoundException('lib folder not found in $libDirectory');
  }

  return '${libPathParts.sublist(0, libIndex).join(Platform.pathSeparator)}/pubspec.yaml';
}

// Reads the package name from pubspec.yaml
Future<String?> _getPackageNameFromFile(String filePath) async {
  final pubspecFile = File(filePath);
  final pubspecContent = await pubspecFile.readAsString();
  final yamlMap = loadYaml(pubspecContent) as Map;
  return yamlMap['name'] as String?;
}

class DirectoryNotFoundException implements Exception {
  final String message;
  DirectoryNotFoundException(this.message);
}

class PackageNameNotFoundException implements Exception {}
