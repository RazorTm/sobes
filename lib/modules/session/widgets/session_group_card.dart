import 'package:flutter/material.dart';
import 'package:sobes/utils/extensions.dart';
import '../../../models/session.dart';
import 'customer_card.dart';

class SessionGroupCard extends StatelessWidget {
  final DateTime date;
  final List<Session> sessions;
  final int total;

  const SessionGroupCard({
    super.key,
    required this.date,
    required this.sessions,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Date:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${date.formattedWeekday}, ${date.formattedDate}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: List.generate(sessions.length, (index) {
                final s = sessions[index];
                final isFirst = index == 0;
                final isLast = index == sessions.length - 1;
                return CustomerCard(
                  session: s,
                  isFirst: isFirst,
                  isLast: isLast,
                );
              }),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                ),
                const SizedBox(width: 10),
                Text('$total'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
