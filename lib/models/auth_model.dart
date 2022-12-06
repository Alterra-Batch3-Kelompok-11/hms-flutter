import 'package:hospital_management_system/models/doctor_model.dart';

import 'nurse_model.dart';

class AuthModel {
  final int userId;
  final String name;
  final String username;
  final int roleId;
  final String role;
  final String token;
  final DoctorModel doctor;
  final NurseModel nurse;

  AuthModel({
    required this.userId,
    required this.name,
    required this.username,
    required this.roleId,
    required this.role,
    required this.token,
    required this.doctor,
    required this.nurse,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      userId: json['user_id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      roleId: json['role_id'] as int,
      role: json['role'] as String,
      token: json['token'] as String,
      doctor: DoctorModel.fromJson(json['doctor'] ?? {}),
      nurse: NurseModel.fromJson(json['nurse'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user_id': userId,
      'name': name,
      'username': username,
      'role_id': roleId,
      'role': role,
      'token': token,
    };
  }
}
