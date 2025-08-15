import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sobes/utils/extensions.dart';
import '../../../data/session_repository.dart';
import '../../../models/session.dart';

class SessionController extends GetxController {
  final SessionRepository repository = Get.find();

  RxList<FlatItem> flatList = <FlatItem>[].obs;

  var isLoading = true.obs;
  var groupedSessions = <DateTime, List<Session>>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadSessions();
  }

  void computeFlatList() {
    final list = <FlatItem>[];
    groupedSessions.forEach((date, sessions) {
      final total = sessions.fold<int>(0, (sum, s) => sum + s.amount);
      list.add(FlatItem.dateHeader(date));
      for (int i = 0; i < sessions.length; i++) {
        list.add(
          FlatItem.session(sessions[i], i == 0, i == sessions.length - 1),
        );
      }
      list.add(FlatItem.total(total));
    });
    flatList.value = list;
  }

  Future<void> loadSessions() async {
    isLoading.value = true;
    final sessions = await repository.fetch();
    groupedSessions.value = groupByDate(sessions);
    computeFlatList();
    isLoading.value = false;
  }

  Map<DateTime, List<Session>> groupByDate(List<Session> list) {
    final map = <DateTime, List<Session>>{};
    for (var session in list) {
      map.putIfAbsent(session.date, () => []).add(session);
    }
    return map;
  }
}

class FlatItem {
  final DateTime? date;
  final Session? session;
  final int? total;
  final bool isFirst;
  final bool isLast;

  FlatItem.dateHeader(this.date)
    : session = null,
      total = null,
      isFirst = false,
      isLast = false;

  FlatItem.session(this.session, this.isFirst, this.isLast)
    : date = null,
      total = null;

  FlatItem.total(this.total)
    : date = null,
      session = null,
      isFirst = false,
      isLast = false;

  Widget buildWidget() {
    if (date != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        child: Text(
          '${date!.formattedWeekday}, ${date!.formattedDate}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      );
    } else if (session != null) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: isFirst ? const Radius.circular(12) : Radius.zero,
            bottom: isLast ? const Radius.circular(12) : Radius.zero,
          ),
          boxShadow: isFirst
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: ListTile(
          title: Text(session!.customer),
          trailing: Text('${session!.amount}'),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('$total', style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      );
    }
  }
}
