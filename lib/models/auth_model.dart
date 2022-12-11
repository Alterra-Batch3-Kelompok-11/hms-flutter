import 'package:shared_preferences/shared_preferences.dart';

class AuthModel {
  final int userId;
  final String name;
  final String username;
  final int roleId;
  final String token;
  final int? doctorId;
  final int? nurseId;
  final bool? isRemember;

  AuthModel({
    required this.userId,
    required this.name,
    required this.username,
    required this.roleId,
    required this.token,
    this.doctorId = 0,
    this.nurseId = 0,
    this.isRemember = false,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      userId: json['user_id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      roleId: json['role_id'] as int,
      token: json['token'] as String,
      doctorId: json['doctor_id'],
      nurseId: json['nurse_id'] ?? 0,
    );
  }

  factory AuthModel.fromLocal(SharedPreferences preferences) {
    return AuthModel(
      userId: preferences.getInt("user_id") ?? 0,
      name: preferences.getString("name") ?? "",
      username: preferences.getString("username") ?? "",
      roleId: preferences.getInt("role_id") ?? 0,
      token: preferences.getString("token") ?? "",
      doctorId: preferences.getInt("doctor_id") ?? 0,
      nurseId: preferences.getInt("nurse_id") ?? 0,
      isRemember: preferences.getBool("is_remember") ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user_id': userId,
      'name': name,
      'username': username,
      'role_id': roleId,
      'token': token,
      'doctor_id': doctorId,
      'nurse_id': nurseId,
    };
  }
}
