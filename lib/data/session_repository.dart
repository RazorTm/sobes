import 'dart:math';

import '../models/session.dart';

class SessionRepository {
  final _random = Random();

  Future<List<Session>> fetch() async {
    final int totalDates = _random.nextInt(365) + 1;
    final int totalClients = _random.nextInt(1000) + 1;

    final now = DateTime.now();
    final dates = List.generate(totalDates, (i) {
      final d = now.subtract(Duration(days: i));
      return DateTime(d.year, d.month, d.day);
    });

    final sessions = <Session>[];

    final clientsPerDate = (totalClients / totalDates).ceil();
    int clientCounter = 0;

    for (final date in dates) {
      for (int i = 0; i < clientsPerDate; i++) {
        if (clientCounter >= totalClients) break;

        sessions.add(
          Session(
            date,
            'Клиент ${clientCounter + 1}',
            _random.nextInt(1000) + 1,
          ),
        );

        clientCounter++;
      }
    }

    return sessions;
  }
}
