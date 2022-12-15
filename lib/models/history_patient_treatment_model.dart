// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hospital_management_system/models/doctor_model.dart';
import 'package:hospital_management_system/models/patient_model.dart';

class HistoryPatientTreatmentModel {
  final int treatmentId;
  final PatientModel patient;
  final DoctorModel doctor;
  final String schedule;
  final String scheduleDate;
  final String scheduleDateIndo;
  final String scheduleTime;
  final String complaint;
  final int isApproved;
  final String description;
  final String medicine;
  final String allergy;
  final bool isFinish;
  final String finishedAt;
  final String finishedAtIndo;

  HistoryPatientTreatmentModel({
    required this.treatmentId,
    required this.patient,
    required this.doctor,
    required this.schedule,
    required this.scheduleDate,
    required this.scheduleDateIndo,
    required this.scheduleTime,
    required this.complaint,
    required this.isApproved,
    required this.description,
    required this.medicine,
    required this.allergy,
    required this.isFinish,
    required this.finishedAt,
    required this.finishedAtIndo,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'treatmentId': treatmentId,
      'patient': patient.toJson(patient),
      'doctor': doctor.toJson(doctor),
      'schedule': schedule,
      'scheduleDate': scheduleDate,
      'scheduleDateIndo': scheduleDateIndo,
      'scheduleTime': scheduleTime,
      'complaint': complaint,
      'isApproved': isApproved,
      'description': description,
      'medicine': medicine,
      'allergy': allergy,
      'isFinish': isFinish,
      'finishedAt': finishedAt,
      'finishedAtIndo': finishedAtIndo,
    };
  }

  factory HistoryPatientTreatmentModel.fromJson(Map<String, dynamic> json) {
    return HistoryPatientTreatmentModel(
      treatmentId: json['treatment_id'] as int,
      patient: PatientModel.fromJson(json['patient']),
      doctor: DoctorModel.fromJson(json['doctor']),
      schedule: json['schedule'] as String,
      scheduleDate: json['schedule_date'] as String,
      scheduleDateIndo: json['schedule_date_indo'] as String,
      scheduleTime: json['schedule_time'] as String,
      complaint: json['complaint'] as String,
      isApproved: json['is_approved'] as int,
      description: json['description'] as String,
      medicine: json['medicine'] as String,
      allergy: json['allergy'] as String,
      isFinish: json['is_finish'] as bool,
      finishedAt: json['finished_at'] as String,
      finishedAtIndo: json['finished_at_indo'] as String,
    );
  }
}
