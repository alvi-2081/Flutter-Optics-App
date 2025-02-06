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
        title: const Text("Patient Records"),
        backgroundColor: Colors.orange.shade700,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: patients.length,
        itemBuilder: (context, index) {
          return PatientCard(patient: patients[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
          onPressed: () {}),
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
      color: Colors.orange.shade50,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              patient.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange.shade900,
              ),
            ),
            Divider(color: Colors.orange.shade300),
            const SizedBox(height: 5),
            _buildDetailRow("Age", patient.age.toString()),
            _buildDetailRow("Gender", patient.gender),
            _buildDetailRow("Refractive Error", patient.refractiveError),
            _buildDetailRow("Dioptric Value", patient.dioptricValue),
            _buildDetailRow("Dioptric Type", patient.nameOfDioptricValue),
            _buildDetailRow("BVD", patient.bvd),
            _buildDetailRow("IPD", patient.ipd),
            _buildDetailRow("Hirschberg", patient.hirschberg),
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
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.orange.shade800,
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(color: Colors.orange.shade700),
            ),
          ),
        ],
      ),
    );
  }
}

class Patient {
  final String name;
  final int age;
  final String gender;
  final String refractiveError;
  final String dioptricValue;
  final String nameOfDioptricValue;
  final String bvd;
  final String ipd;
  final String hirschberg;

  Patient({
    required this.name,
    required this.age,
    required this.gender,
    required this.refractiveError,
    required this.dioptricValue,
    required this.nameOfDioptricValue,
    required this.bvd,
    required this.ipd,
    required this.hirschberg,
  });
}

final List<Patient> patients = [
  Patient(
    name: "Zakiya Ahmed",
    age: 30,
    gender: "Female",
    refractiveError: "Myopia",
    dioptricValue: "OD -2.00DS OS -2.00DS",
    nameOfDioptricValue: "Sphere",
    bvd: "14mm",
    ipd: "59mm",
    hirschberg: "20 degree temporal",
  ),
  Patient(
    name: "Saima",
    age: 21,
    gender: "Female",
    refractiveError: "Astigmatism",
    dioptricValue: "OD -2.00DS /-3.00DCx175 OS -2.00DS /-3.00DCx175",
    nameOfDioptricValue: "Sphere + Cylinder",
    bvd: "14mm",
    ipd: "50mm",
    hirschberg: "Normal",
  ),
  Patient(
    name: "Farooq",
    age: 55,
    gender: "Male",
    refractiveError: "Hyperopia",
    dioptricValue: "OD +4.00DS OS +4.00DS",
    nameOfDioptricValue: "Sphere",
    bvd: "16mm",
    ipd: "63mm",
    hirschberg: "15 degree nasal",
  ),
  Patient(
    name: "Mushtaq Raza",
    age: 35,
    gender: "Male",
    refractiveError: "Astigmatism",
    dioptricValue: "OD -0.5DS/-3.5DCx90 OS -0.5DS/3.00DCx90",
    nameOfDioptricValue: "Sphere / Cyl",
    bvd: "15mm",
    ipd: "62mm",
    hirschberg: "15 degree temporal",
  ),
  Patient(
    name: "Faiza",
    age: 18,
    gender: "Female",
    refractiveError: "Myopia",
    dioptricValue: "OD -8.00DS OS -6.05DS",
    nameOfDioptricValue: "Sphere",
    bvd: "16mm",
    ipd: "61mm",
    hirschberg: "20 degree temporal",
  ),
  Patient(
    name: "Rabiya Wasim",
    age: 45,
    gender: "Female",
    refractiveError: "Astigmatism",
    dioptricValue: "OD +2.00/+4.00X45 OS +2.00DS/+1.00DCx10",
    nameOfDioptricValue: "Sphere / Cyl",
    bvd: "14mm",
    ipd: "63mm",
    hirschberg: "15 degree nasal",
  ),
  Patient(
    name: "Kashif Haider",
    age: 3,
    gender: "Male",
    refractiveError: "Hyperopia",
    dioptricValue: "OD +5.00DS OS +5.00DS",
    nameOfDioptricValue: "Sphere",
    bvd: "12mm",
    ipd: "43mm",
    hirschberg: "On center",
  ),
  Patient(
    name: "Fatima",
    age: 28,
    gender: "Female",
    refractiveError: "Astigmatism",
    dioptricValue: "OD -2.75DCX180 OS -3.75DCX175",
    nameOfDioptricValue: "Sphere / Cyl",
    bvd: "15mm",
    ipd: "58mm",
    hirschberg: "35 degree temporal",
  ),
  Patient(
    name: "Suman",
    age: 6,
    gender: "Female",
    refractiveError: "Hyperopia",
    dioptricValue: "OD +4.05DS OS +4.00DS",
    nameOfDioptricValue: "Sphere",
    bvd: "12mm",
    ipd: "49mm",
    hirschberg: "On center",
  ),
  Patient(
    name: "Hafiz Ali",
    age: 28,
    gender: "Male",
    refractiveError: "Myopia",
    dioptricValue: "OD -10DS/-0.5DCX180 OS -10.75DS/-0.5DCX15",
    nameOfDioptricValue: "Sphere / Cyl",
    bvd: "15mm",
    ipd: "63mm",
    hirschberg: "20 degree nasal",
  ),
  Patient(
    name: "Muhammad Osama",
    age: 70,
    gender: "Male",
    refractiveError: "Hyperopia",
    dioptricValue: "OD +7.00DS OS +2.00DS",
    nameOfDioptricValue: "Sphere",
    bvd: "16mm",
    ipd: "63mm",
    hirschberg: "35 degree temporal",
  ),
];
