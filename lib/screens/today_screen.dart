import 'package:flutter/material.dart';

import '../app_theme.dart';
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
        final streak = store.currentStreak;
        final best = store.bestStreak;
        return ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
          children: [
            ScreenHeader(
              eyebrow: _dateLabel(DateTime.now()),
              title: '${store.greeting},\n${store.userName}',
            ),
            _StreakCard(streak: streak, best: best),
          ],
        );
      },
    );
  }
}

class _StreakCard extends StatelessWidget {
  const _StreakCard({required this.streak, required this.best});

  final int streak;
  final int best;

  @override
  Widget build(BuildContext context) {
    final isRecord = streak > 0 && streak >= best;
    return SectionCard(
      color: AppColors.blue,
      padding: const EdgeInsets.fromLTRB(24, 22, 18, 22),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Label('Logging streak'),
                const SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '$streak',
                      style: const TextStyle(
                        fontSize: 72,
                        height: 1,
                        fontWeight: FontWeight.w900,
                        color: AppColors.ink,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            streak == 1 ? 'DAY' : 'DAYS',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: AppColors.ink,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Pill('BEST $best'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Transform.rotate(
                angle: 0.12,
                child: Container(
                  width: 76,
                  height: 76,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.fromBorderSide(popBorder),
                    boxShadow: popShadow,
                  ),
                  child: const Icon(
                    Icons.local_fire_department,
                    size: 40,
                    color: AppColors.ink,
                  ),
                ),
              ),
              if (isRecord) ...[
                const SizedBox(height: 12),
                Transform.rotate(
                  angle: 0.08,
                  child: const Pill(
                    'NEW PR',
                    color: AppColors.ink,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
