import 'package:get/get.dart';
import '../../../data/session_repository.dart';
import '../modules/session/controller/session_controller.dart';

class SessionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SessionRepository());
    Get.put(SessionController());
  }
}
