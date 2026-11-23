import 'package:flutter/material.dart';

import '../data/meal_store.dart';
import '../widgets/section_card.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key, required this.store});

  final MealStore store;

  static const _weekdays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  static const _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  String _dateLabel(DateTime d) =>
      '${_weekdays[d.weekday - 1]}, ${_months[d.month - 1]} ${d.day}';

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: store,
      builder: (context, _) {
        return ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
          children: [
            ScreenHeader(
              eyebrow: _dateLabel(DateTime.now()),
              title: '${store.greeting},\n${store.userName}',
            ),
          ],
        );
      },
    );
  }
}
