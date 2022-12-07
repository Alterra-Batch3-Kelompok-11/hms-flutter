import 'package:hospital_management_system/models/schedule_model.dart';

class DoctorModel {
  final int id;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String name;
  final int specialityId;
  final String licenseNumber;
  final String specialityName;
  final List<ScheduleModel> doctorSchedules;

  DoctorModel({
    required this.id,
    this.createdAt = "",
    this.updatedAt = "",
    this.deletedAt = "",
    required this.name,
    required this.specialityId,
    required this.licenseNumber,
    required this.specialityName,
    required this.doctorSchedules,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'],
      name: json['name'],
      specialityId: json['speciality_id'],
      licenseNumber: json['license_number'],
      specialityName: json['speciality_name'],
      doctorSchedules: (json['doctor_schedules']) == null
          ? []
          : (json['doctor_schedules'] as List)
              .map((e) => ScheduleModel.fromJson(e))
              .toList(),
      createdAt: json['created_at'] ?? "",
      updatedAt: json['updated_at'] ?? "",
      deletedAt: json['deleted_at'] ?? "",
    );
  }

  Map<String, dynamic> toJson(DoctorModel doctor) {
    return {
      'id': doctor.id,
      'name': doctor.name,
      'speciality_id': doctor.specialityId,
      'license_number': doctor.licenseNumber,
      'speciality_name': doctor.specialityName,
      'doctor_schedule': doctor.doctorSchedules,
      'created_at': doctor.createdAt,
      'updated_at': doctor.updatedAt,
      'deleted_at': doctor.deletedAt,
    };
  }
}
