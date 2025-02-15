import 'package:demo_app/app_colors.dart';
import 'package:demo_app/model/patient.dart';
import 'package:demo_app/model/share_pref_controller.dart';
import 'package:demo_app/screens/add_record_screen.dart';
import 'package:flutter/material.dart';

class PatientListScreen extends StatefulWidget {
  const PatientListScreen({super.key});

  @override
  State<PatientListScreen> createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> {
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
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: SharePrefController.patients.length,
              itemBuilder: (context, index) {
                return PatientCard(
                    patient: SharePrefController.patients[index]);
              },
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
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              patient.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.secondary,
              ),
            ),
            const Divider(color: AppColors.primary),
            const SizedBox(height: 5),
            _buildDetailRow("Age", patient.age.toString()),
            _buildDetailRow("Gender", patient.gender),
            _buildDetailRow("Refractive Error", patient.refractiveError),
            _buildDetailRow("Dioptric Value", patient.dioptricValue),
            _buildDetailRow("Dioptric Type", patient.nameOfDioptricValue),
            _buildDetailRow("BVD", patient.bvd),
            _buildDetailRow("IPD", patient.ipd),
            _buildDetailRow("C/C", patient.cheifComplain),
            _buildDetailRow("M/H", patient.mh),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Text(
            "$title:",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.secondary,
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(color: AppColors.secondary),
            ),
          ),
        ],
      ),
    );
  }
}
