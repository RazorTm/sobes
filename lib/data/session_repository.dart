import '../models/session.dart';

class SessionRepository {
  Future<List<Session>> fetch() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Session(DateTime(2025, 7, 1), 'Customer A', 100),
      Session(DateTime(2025, 7, 1), 'Customer B', 200),
      Session(DateTime(2025, 7, 1), 'Customer C', 300),
      Session(DateTime(2025, 7, 2), 'Customer D', 400),
      Session(DateTime(2025, 7, 2), 'Customer E', 500),
      Session(DateTime(2025, 7, 2), 'Customer F', 600),
      Session(DateTime(2025, 7, 2), 'Customer A', 700),
      Session(DateTime(2025, 7, 3), 'Customer B', 800),
      Session(DateTime(2025, 7, 4), 'Customer C', 150),
      Session(DateTime(2025, 7, 4), 'Customer D', 250),
      Session(DateTime(2025, 7, 5), 'Customer E', 350),
      Session(DateTime(2025, 7, 5), 'Customer F', 450),
      Session(DateTime(2025, 7, 6), 'Customer G', 550),
      Session(DateTime(2025, 7, 6), 'Customer H', 650),
      Session(DateTime(2025, 7, 7), 'Customer I', 750),
      Session(DateTime(2025, 7, 7), 'Customer J', 850),
      Session(DateTime(2025, 7, 8), 'Customer K', 950),
      Session(DateTime(2025, 7, 8), 'Customer L', 1050),
    ];
  }
}