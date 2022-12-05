class DoctorModel {
  final int id;
  
  final String name;
  final String photo;
  final String startTime;
  final String endTime;

  DoctorModel({
    required this.id,
    required this.name,
    required this.photo,
    required this.startTime,
    required this.endTime,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> data) {
    return DoctorModel(
      id: data['id'],
      name: data['name'],
      photo: data['photo'],
      startTime: data['start_time'],
      endTime: data['end_time'],
    );
  }

  Map<String, dynamic> toJson(DoctorModel doctorModel) {
    return {
      "id": doctorModel.id,
      "name": doctorModel.name,
      "photo": doctorModel.photo,
      "start_time": doctorModel.startTime,
      "end_time": doctorModel.endTime,
    };
  }
}
