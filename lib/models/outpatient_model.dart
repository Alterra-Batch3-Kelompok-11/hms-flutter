import 'package:hospital_management_system/models/patient_model.dart';
import 'package:hospital_management_system/models/doctor_model.dart';

class OutpatientModel {
  final int id;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final int doctorId;
  final int patientId;
  final String schedule;
  final String complaint;
  late final int isApproved;
  final bool isFinish;
  final String finishedAt;
  final String scheduleDateIndo;
  final String scheduleDate;
  final String scheduleTime;
  final PatientModel patient;
  final DoctorModel doctor;

  OutpatientModel({
    required this.id,
    this.createdAt = "",
    this.updatedAt = "",
    this.deletedAt = "",
    required this.doctorId,
    required this.patientId,
    required this.schedule,
    required this.complaint,
    required this.isApproved,
    required this.isFinish,
    required this.finishedAt,
    required this.scheduleDateIndo,
    required this.scheduleDate,
    required this.scheduleTime,
    required this.patient,
    required this.doctor,
  });

  factory OutpatientModel.fromJson(Map<String, dynamic> json) {
    return OutpatientModel(
      id: json['id'],
      doctorId: json['doctor_id'],
      patientId: json['patient_id'],
      schedule: json['schedule'],
      complaint: json['complaint'],
      isApproved: json['is_approved'],
      isFinish: json['is_finish'],
      finishedAt: json['finished_at'],
      scheduleDateIndo: json['schedule_date_indo'],
      scheduleDate: json['schedule_date'],
      scheduleTime: json['schedule_time'],
      patient: PatientModel.fromJson(json['patient']),
      doctor: DoctorModel.fromJson(json['doctor']),
      createdAt: json['created_at'] ?? "",
      updatedAt: json['updated_at'] ?? "",
      deletedAt: json['deleted_at'] ?? "",
    );
  }

  Map<String, dynamic> toJson(OutpatientModel outpatient) {
    return {
      'id': outpatient.id,
      'doctor_id': outpatient.doctorId,
      'patient_id': outpatient.patientId,
      'schedule': outpatient.schedule,
      'complaint': outpatient.complaint,
      'is_approved': outpatient.isApproved,
      'is_finish': outpatient.isFinish,
      'finished_at': outpatient.finishedAt,
      'schedule_date_indo': outpatient.scheduleDateIndo,
      'schedule_date': outpatient.scheduleDate,
      'schedule_time': outpatient.scheduleTime,
      'patient': outpatient.patient,
      'doctor': outpatient.doctor,
      'created_at': outpatient.createdAt,
      'updated_at': outpatient.updatedAt,
      'deleted_at': outpatient.deletedAt,
    };
  }
}
