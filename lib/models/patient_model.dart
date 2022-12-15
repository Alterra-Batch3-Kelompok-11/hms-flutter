class PatientModel {
  // int id;
  String nik;
  String name;
  String phone;
  String address;
  int age;
  int gender;
  String birthDate;
  int religionId;
  bool maritalStatus;

  PatientModel({
    // required this.id,
    required this.nik,
    required this.name,
    required this.phone,
    required this.address,
    required this.gender,
    required this.age,
    required this.birthDate,
    required this.religionId,
    required this.maritalStatus,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      //  id: json['id'],
      nik: json['nik'],
      name: json['name'],
      phone: json['phone'],
      address: json['address'],
      age: json['age'] ?? 0,
      gender: json['gender'] ?? 0,
      birthDate: json['birth_date'],
      religionId: json['religion_id'] ?? 0,
      maritalStatus: json['marital_status'],
    );
  }

  Map<String, dynamic> toJson(PatientModel patientModel) {
    return {
      //  'id': patientModel.id,
      'nik': patientModel.nik,
      'name': patientModel.name,
      'phone': patientModel.phone,
      'address': patientModel.address,
      'gender': patientModel.gender,
      'age': patientModel.age,
      'birth_date': patientModel.birthDate,
      'religion_id': patientModel.religionId,
      'marital_status': patientModel.maritalStatus,
    };
  }
}
