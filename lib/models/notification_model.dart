class NotificationModel {
  final int outPatientSessionId;
  final String description;
  final String scheduleDate;
  final String scheduleDateIndo;
  final String scheduleTime;

  NotificationModel({
    required this.outPatientSessionId,
    required this.description,
    required this.scheduleDate,
    required this.scheduleDateIndo,
    required this.scheduleTime,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'outPatientSessionId': outPatientSessionId,
      'description': description,
      'scheduleDate': scheduleDate,
      'scheduleDateIndo': scheduleDateIndo,
      'scheduleTime': scheduleTime,
    };
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      outPatientSessionId: json['outpatient_session_id'] as int,
      description: json['description'] ?? "",
      scheduleDate: json['schedule_date'] as String,
      scheduleDateIndo: json['schedule_date_indo'] as String,
      scheduleTime: json['schedule_time'] as String,
    );
  }
}
