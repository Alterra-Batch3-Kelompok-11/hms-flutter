// ignore_for_file: public_member_api_docs, sort_constructors_first

class Historypatiens {
  final String patientName;
  final String schedule;
  final String scheduleDate;
  final String scheduleDateIndo;
  final String scheduleTime;
  final String status;
  Historypatiens({
    required this.patientName,
    required this.schedule,
    required this.scheduleDate,
    required this.scheduleDateIndo,
    required this.scheduleTime,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'patientName': patientName,
      'schedule': schedule,
      'scheduleDate': scheduleDate,
      'scheduleDateIndo': scheduleDateIndo,
      'scheduleTime': scheduleTime,
      'status': status,
    };
  }

  factory Historypatiens.fromJson(Map<String, dynamic> json) {
    return Historypatiens(
      patientName: json['patient_name'] != "" || json['patient_name'] != null
          ? json['patient_name'] as String
          : "",
      schedule: json['schedule'] != "" || json['schedule'] != null
          ? json['schedule'] as String
          : "",
      scheduleDate: json['schedule_date'] != "" || json['schedule_date'] != null
          ? json['schedule_date'] as String
          : "",
      scheduleDateIndo:
          json['schedule_date_indo'] != "" || json['schedule_date_indo'] != null
              ? json['schedule_date_indo'] as String
              : "",
      scheduleTime: json['schedule_time'] != "" || json['schedule_time'] != null
          ? json['schedule_time'] as String
          : "",
      status: json['status'] != "" || json['status'] != null
          ? json['status'] as String
          : "",
    );
  }
}
