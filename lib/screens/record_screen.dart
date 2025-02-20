import 'package:demo_app/app_colors.dart';
import 'package:demo_app/model/patient.dart';
import 'package:flutter/material.dart';

class RecordScreen extends StatelessWidget {
  final Patient patient;
  const RecordScreen({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(patient.name),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
      child: Row(
        children: [
          Text(
            "$title:",
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.secondary,
                fontSize: 16,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.secondary),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(color: AppColors.secondary, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
