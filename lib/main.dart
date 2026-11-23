import 'package:flutter/material.dart';

void main() {
  runApp(const NutriTrackApp());
}

class NutriTrackApp extends StatelessWidget {
  const NutriTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'NutriTrack',
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: Text('NutriTrack'))),
    );
  }
}
