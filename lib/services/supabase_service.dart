import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> saveMedication(String name, DateTime date, TimeOfDay time, String frequency) async {
  final response = await Supabase.instance.client.from('medications').insert({
    'name': name,
    'date': '${date.year}-${date.month}-${date.day}',
    'time': '${time.hour}:${time.minute}',
    'frequency': frequency,
  }).execute();

  if (response.error == null) {
    print('Medication saved successfully!');
  } else {
    print('Error: ${response.error!.message}');
  }
}

Future<List<Map<String, dynamic>>> fetchMedications() async {
  final response = await Supabase.instance.client.from('medications').select().execute();
  if (response.error == null) {
    return (response.data as List<dynamic>).cast<Map<String, dynamic>>();
  } else {
    print('Error: ${response.error!.message}');
    return [];
  }
}