class PatientTodayModel {
  final String name;
  final String scheduleDate;
  final String scheduleDateIndo;
  final String scheduleTime;
  final String schedule;
  final String complaint;
  PatientTodayModel({
    required this.name,
    required this.scheduleDate,
    required this.scheduleDateIndo,
    required this.scheduleTime,
    required this.schedule,
    required this.complaint,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'schedule_date': scheduleDate,
      'schedule_date_indo': scheduleDateIndo,
      'schedule_time': scheduleTime,
      'schedule': schedule,
      'complaint': complaint,
    };
  }

  factory PatientTodayModel.fromJson(Map<String, dynamic> json) {
    return PatientTodayModel(
      name: json['name'] as String,
      scheduleDate: json['schedule_date'] as String,
      scheduleDateIndo: json['schedule_date_indo'] as String,
      scheduleTime: json['schedule_time'] as String,
      schedule: json['schedule'] as String,
      complaint: json['complaint'] as String,
    );
  }
}
