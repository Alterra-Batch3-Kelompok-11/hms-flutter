import 'package:hospital_management_system/models/patient_today_model.dart';

class PatientQueueToday {
  final int totalQueueToday;
  final int totalFinishedToday;
  final List<PatientTodayModel> patientsToday;
  PatientQueueToday({
    required this.totalQueueToday,
    required this.totalFinishedToday,
    required this.patientsToday,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'total_queue_today': totalQueueToday,
      'total_finished_today': totalFinishedToday,
      'patient_today': patientsToday.map((x) => x.toJson()).toList(),
    };
  }

  factory PatientQueueToday.fromJson(Map<String, dynamic> json) {
    return PatientQueueToday(
      totalQueueToday: json['total_queuq_today'] ?? 0,
      totalFinishedToday: json['total_finished_today'] ?? 0,
      patientsToday: json['patients_today'] == null
          ? []
          : (json['patients_today'] as List)
              .map((data) => PatientTodayModel.fromJson(data))
              .toList(),
    );
  }
}
