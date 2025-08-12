import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/session_controller.dart';
import '../widgets/session_group_card.dart';

// SessionScreen
class SessionScreen extends StatelessWidget {
  const SessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SessionController>();

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          final entries = controller.groupedSessions.entries.toList();
          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final entry = entries[index];
                  final date = entry.key;
                  final sessions = controller.groupedSessions[date] ?? [];
                  final total = sessions.fold<int>(
                    0,
                    (sum, s) => sum + s.amount,
                  );

                  return SessionGroupCard(
                    key: ValueKey(date),
                    date: date,
                    sessions: sessions,
                    total: total,
                  );
                }, childCount: entries.length),
              ),
            ],
          );
        }),
      ),
    );
  }
}
