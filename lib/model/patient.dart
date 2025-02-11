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

  // Convert Patient to Map for storage
  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
        'gender': gender,
        'refractiveError': refractiveError,
        'dioptricValue': dioptricValue,
        'nameOfDioptricValue': nameOfDioptricValue,
        'bvd': bvd,
        'ipd': ipd,
        'hirschberg': hirschberg,
      };

  // Convert JSON Map to Patient
  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        name: json['name'],
        age: json['age'],
        gender: json['gender'],
        refractiveError: json['refractiveError'],
        dioptricValue: json['dioptricValue'],
        nameOfDioptricValue: json['nameOfDioptricValue'],
        bvd: json['bvd'],
        ipd: json['ipd'],
        hirschberg: json['hirschberg'],
      );
}

final List<Patient> dummyPatients = [
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
