import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/session_controller.dart';
import '../widgets/session_group_card.dart';

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
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: entries.length,
            itemBuilder: (context, index) {
              final entry = entries[index];
              final date = entry.key;

              return Obx(() {
                final sessions = controller.groupedSessions[date] ?? [];
                final total = sessions.fold<int>(
                  0,
                  (sum, s) => sum + s.amount,
                );
                return SessionGroupCard(
                  date: date,
                  sessions: sessions,
                  total: total,
                );
              });
            },
          );
        }),
      ),
    );
  }
}
