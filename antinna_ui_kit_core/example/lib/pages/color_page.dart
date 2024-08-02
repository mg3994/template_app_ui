import 'package:flutter/material.dart';
import 'package:/.dart';

class ColorPage extends StatelessWidget {
  const ColorPage({super.key});

  @override
  Widget build(BuildContext context) {
    var antinnaColors = Theme.of(context).extension<ANTINNAColorTheme>()!;
    var names = antinnaColors
        .toString()
        .replaceAll('ANTINNAColorTheme(', '')
        .replaceAll(')', '')
        .split(', ');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Colors'),
      ),
      body: ListView(
        children: List.generate(colorCollection(antinnaColors).length, 
        (index) {
          var color = colorCollection(antinnaColors)[index];
          var name = names[index].split(': ')[0];

          return ListTile(
            tileColor: color,
            title: SelectableText(
              '$color - $name',
            ),
          );
        },
        ),
      ),
    );
  }


  List<Color?> colorCollection(ANTINNAColorTheme antinnaColors) => [
    
    antinnaColors.red1,
    
    
  ];
}
