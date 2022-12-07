class ScheduleModel {
  final int id;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final int doctorId;
  final int dayInt;
  final String dayString;
  final String startTime;
  final String endTime;

  ScheduleModel({
    required this.id,
    this.createdAt = "",
    this.updatedAt = "",
    this.deletedAt = "",
    required this.doctorId,
    required this.dayInt,
    required this.dayString,
    required this.startTime,
    required this.endTime,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
      id: json['id'],
      doctorId: json['doctor_id'],
      dayInt: json['day_int'] as int,
      dayString: json['day_string'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      createdAt: json['created_at'] ?? "",
      updatedAt: json['updated_at'] ?? "",
      deletedAt: json['deleted_at'] ?? "",
    );
  }

  // List<ScheduleModel> fromJsonToList(Map<String, dynamic> json) {
  //   ScheduleModel scheduleModel = ScheduleModel.fromJson(json);
  //   List<ScheduleModel> listSchedule  = [];

  //   listSc
  // }

  Map<String, dynamic> toJson(ScheduleModel schedule) {
    return {
      'id': schedule.id,
      'doctor_id': schedule.doctorId,
      'day_int': schedule.dayInt,
      'day_string': schedule.dayString,
      'start_time': schedule.startTime,
      'end_time': schedule.endTime,
      'created_at': schedule.createdAt,
      'updated_at': schedule.updatedAt,
      'deleted_at': schedule.deletedAt,
    };
  }
}
