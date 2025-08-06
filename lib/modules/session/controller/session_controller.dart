import 'package:get/get.dart';
import '../../../data/session_repository.dart';
import '../../../models/session.dart';

class SessionController extends GetxController {
  final SessionRepository repository = Get.find();

  var isLoading = true.obs;
  var groupedSessions = <DateTime, List<Session>>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadSessions();
  }

  Future<void> loadSessions() async {
    isLoading.value = true;
    final sessions = await repository.fetch();
    groupedSessions.value = groupByDate(sessions);
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
