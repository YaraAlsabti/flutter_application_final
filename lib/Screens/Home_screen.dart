import 'package:flutter/material.dart';
import 'Add_medication_screen.dart';
import '../widgets/medication_card.dart';
import '../services/supabase_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> medications = [];

  @override
  void initState() {
    super.initState();
    fetchMedications().then((data) {
      setState(() {
        medications = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4FFFD),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Today',
          style: TextStyle(color: Color(0xFF12175D), fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: medications.isEmpty
          ? Center(child: Text('No medications added yet'))
          : ListView.builder(
              itemCount: medications.length,
              itemBuilder: (context, index) {
                final medication = medications[index];
                final isDaily = medication['frequency'] == 'Daily';
                return MedicationCard(
                  name: medication['name'],
                  time: medication['time'],
                  isDaily: isDaily,
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFF70A6),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddMedicationScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}