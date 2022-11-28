class PatientModel {
  final String nik;
  final String name;
  final String gender;
  final String birthDate;
  final String religion;
  final String maritalStatus;
  final String address;
  final String visitingTime;
  final String visitingDate;
  final String complaints;

  PatientModel({
    required this.nik,
    required this.name,
    required this.gender,
    required this.birthDate,
    required this.religion,
    required this.maritalStatus,
    required this.address,
    required this.visitingDate,
    required this.visitingTime,
    required this.complaints,
  });

  factory PatientModel.fromJson(Map<String, dynamic> data) {
    return PatientModel(
        nik: data['nik'],
        name: data['name'],
        gender: data['gender'],
        birthDate: data['birth_date'],
        religion: data['religion'],
        maritalStatus: data['marital_status'],
        address: data['address'],
        visitingDate: data['visiting_date'],
        visitingTime: data['visiting_time'],
        complaints: data['complaints']);
  }

  Map<String, dynamic> toJson(PatientModel patientModel) {
    return {
      "nik": patientModel.nik,
      "name": patientModel.name,
      "gender": patientModel.gender,
      "birth_date": patientModel.birthDate,
      "religion": patientModel.religion,
      "martital_status": patientModel.maritalStatus,
      "address": patientModel.address,
      "visiting_time": patientModel.visitingTime,
      "visiting_date": patientModel.visitingDate,
      "complaints": patientModel.complaints,
    };
  }
}
