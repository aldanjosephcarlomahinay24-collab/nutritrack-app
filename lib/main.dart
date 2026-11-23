import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'widgets/section_card.dart';

void main() {
  runApp(const NutriTrackApp());
}

class NutriTrackApp extends StatelessWidget {
  const NutriTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NutriTrack',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      home: const Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: SectionCard(child: Text('NutriTrack')),
          ),
        ),
      ),
    );
  }
}
