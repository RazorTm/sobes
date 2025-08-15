import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/session_controller.dart';

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

          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    final item = controller.flatList[index];
                    return item.buildWidget();
                  },
                  childCount: controller.flatList.length,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
