import 'dart:convert';

import 'package:demo_app/model/patient.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePrefController {
  static List<Patient> patients = [];
  static late final SharedPreferences prefs;

  static Future<void> loadPatients() async {
    prefs = await SharedPreferences.getInstance();
    final String? patientsJson = prefs.getString('patients');

    if (patientsJson != null) {
      final List<dynamic> decoded = jsonDecode(patientsJson);
      patients = decoded.map((json) => Patient.fromJson(json)).toList();
    } else {
      for (var pat in dummyPatients) {
        addPatient(pat);
      }
    }
  }

  static Future<void> addPatient(Patient patient) async {
    final prefs = await SharedPreferences.getInstance();
    patients.add(patient);
    final String encodedPatients =
        jsonEncode(patients.map((p) => p.toJson()).toList());
    await prefs.setString('patients', encodedPatients);
  }
}
