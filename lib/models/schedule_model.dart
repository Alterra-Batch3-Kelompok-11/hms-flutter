class ScheduleModel {
  final int id;
  final int doctorId;
  final String date;
  final String dateIndo;
  final int dayInt;
  final String dayString;
  final String startTime;
  final String endTime;

  ScheduleModel({
    required this.id,
    required this.doctorId,
    required this.date,
    required this.dateIndo,
    required this.dayInt,
    required this.dayString,
    required this.startTime,
    required this.endTime,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
      id: json['id'],
      doctorId: json['doctor_id'],
      date: json['date'],
      dateIndo: json['date_indo'],
      dayInt: json['day_int'] as int,
      dayString: json['day_string'],
      startTime: json['start_time'],
      endTime: json['end_time'],
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
      'date': schedule.date,
      'date_indo': schedule.dateIndo,
      'day_int': schedule.dayInt,
      'day_string': schedule.dayString,
      'start_time': schedule.startTime,
      'end_time': schedule.endTime,
    };
  }
}
