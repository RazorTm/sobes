import 'package:flutter/material.dart';
import '../../../models/session.dart';

class CustomerCard extends StatelessWidget {
  final Session session;
  final bool isFirst;
  final bool isLast;

  const CustomerCard({
    super.key,
    required this.session,
    required this.isFirst,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: isLast
              ? BorderSide.none
              : BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: isFirst ? const Radius.circular(12) : Radius.zero,
            bottom: isLast ? const Radius.circular(12) : Radius.zero,
          ),
        ),
        title: Text(session.customer),
        trailing: Text('${session.amount}'),
      ),
    );
  }
}
