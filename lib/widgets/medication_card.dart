import 'package:flutter/material.dart';

class MedicationCard extends StatelessWidget {
  final String name;
  final String time;
  final bool isDaily;

  MedicationCard({required this.name, required this.time, required this.isDaily});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDaily ? Color(0xFFDBDEFF) : Color(0xFFE88B8C),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(color: Color(0xFF12175D), fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            time,
            style: TextStyle(color: Color(0xFF12175D), fontSize: 14),
          ),
        ],
      ),
    );
  }
}