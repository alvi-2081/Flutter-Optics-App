import 'package:demo_app/app_colors.dart';
import 'package:demo_app/model/patient.dart';
import 'package:demo_app/model/share_pref_controller.dart';
import 'package:demo_app/screens/patient_listing.dart';
import 'package:demo_app/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class AddRecordScreen extends StatefulWidget {
  const AddRecordScreen({super.key});

  @override
  State<AddRecordScreen> createState() => _AddRecordScreenState();
}

class _AddRecordScreenState extends State<AddRecordScreen> {
  bool isLoading = true;

  final formKey = GlobalKey<FormState>();
  final fullName = TextEditingController();
  final age = TextEditingController();
  final gender = TextEditingController();
  final chiefComplain = TextEditingController();
  final medicalHistory = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Record"),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: isLoading
              ? const SizedBox(
                  height: 400,
                  child: Center(child: CircularProgressIndicator()),
                )
              : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  TextFieldWidget(
                    label: "Patient's Full Name",
                    hintText: 'Enter Patient Name',
                    controller: fullName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required';
                      }
                      return null;
                    },
                  ),
                  TextFieldWidget(
                    label: "Patient's Age",
                    hintText: 'Enter Patient Age',
                    controller: age,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                  ),
                  TextFieldWidget(
                    label: "Patient's Gender",
                    hintText: 'Enter Patient Gender',
                    controller: gender,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required';
                      }
                      return null;
                    },
                  ),
                  TextFieldWidget(
                      label: "C/C (optional)",
                      hintText: 'Enter Patient Chief Complain',
                      controller: chiefComplain,
                      validator: (value) {
                        return null;
                      }),
                  TextFieldWidget(
                      label: "M/H (optional)",
                      hintText: 'Enter Medical History',
                      controller: medicalHistory,
                      validator: (value) {
                        return null;
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildDetailRow("Refractive Error", "Myopia"),
                  _buildDetailRow("Dioptric Value", "-2.5"),
                  _buildDetailRow("Dioptric Type", "Sphere"),
                  _buildDetailRow("BVD", "12mm"),
                  _buildDetailRow("IPD", "64mm"),
                  _buildDetailRow("Hirschberg", "Centered"),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          minimumSize: const Size(double.infinity, 50)),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          SharePrefController.addPatient(Patient(
                            name: fullName.text,
                            age: int.parse(age.text),
                            gender: gender.text,
                            refractiveError: "Myopia",
                            dioptricValue: "-2.5",
                            nameOfDioptricValue: "Sphere",
                            bvd: "12mm",
                            ipd: "64mm",
                            hirschberg: "Centered",
                            cheifComplain: chiefComplain.text.isEmpty
                                ? "N/A"
                                : chiefComplain.text,
                            mh: medicalHistory.text.isEmpty
                                ? "N/A"
                                : medicalHistory.text,
                          ));
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PatientListScreen()),
                              (route) => false);
                        }
                      },
                      child: const Text("Save Record",
                          style: TextStyle(color: Colors.white, fontSize: 18)))
                ]),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(children: [
        Text(
          "$title : ",
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.secondary,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.secondary,
          ),
        ),
      ]),
    );
  }
}
