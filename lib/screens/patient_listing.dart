import 'package:demo_app/app_colors.dart';
import 'package:demo_app/model/patient.dart';
import 'package:demo_app/model/share_pref_controller.dart';
import 'package:demo_app/screens/add_record_screen.dart';
import 'package:demo_app/screens/record_screen.dart';
import 'package:flutter/material.dart';

class PatientListScreen extends StatefulWidget {
  const PatientListScreen({super.key});

  @override
  State<PatientListScreen> createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Patient Records"),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: SharePrefController.patients.isEmpty
          ? const Center(child: Text("No patients found"))
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: controller,
                    cursorColor: AppColors.primary,
                    onChanged: (val) {
                      SharePrefController.searchPatientsByName(val);
                      setState(() {});
                    },
                    style: const TextStyle(fontSize: 15, color: Colors.grey),
                    decoration: const InputDecoration(
                        hintText: 'Search Patient Name',
                        hintStyle:
                            TextStyle(fontSize: 15, color: AppColors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: Icon(Icons.search, color: AppColors.grey),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.primary)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.primary)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.primary))),
                  ),
                  const SizedBox(height: 10),
                  if (controller.text.isNotEmpty)
                    if (SharePrefController.searchPatients.isNotEmpty)
                      Expanded(
                        child: ListView.builder(
                          itemCount: SharePrefController.searchPatients.length,
                          itemBuilder: (context, index) {
                            return PatientCard(
                                patient:
                                    SharePrefController.searchPatients[index]);
                          },
                        ),
                      )
                    else
                      const SizedBox(
                          height: 400,
                          child: Center(
                              child: Text(
                            "No patients found",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          )))
                  else
                    Expanded(
                      child: ListView.builder(
                        itemCount: SharePrefController.patients.length,
                        itemBuilder: (context, index) {
                          return PatientCard(
                              patient: SharePrefController.patients[index]);
                        },
                      ),
                    ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddRecordScreen(),
            ),
          );
        },
      ),
    );
  }
}

class PatientCard extends StatelessWidget {
  final Patient patient;

  const PatientCard({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RecordScreen(patient: patient),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text(
              patient.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.secondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
