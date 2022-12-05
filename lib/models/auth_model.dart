class AuthModel {
  final int id;
  final String name;
  final String username;
  final int roleId;
  final String role;
  final String token;

  AuthModel(
      {required this.id,
      required this.name,
      required this.username,
      required this.roleId,
      required this.role,
      required this.token});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'username': username,
      'role_id': roleId,
      'role': role,
      'token': token,
    };
  }

  factory AuthModel.fromJson(Map<String, dynamic> map) {
    return AuthModel(
      id: map['id'] as int,
      name: map['name'] as String,
      username: map['username'] as String,
      roleId: map['role_id'] as int,
      role: map['role'] as String,
      token: map['token'] as String,
    );
  }
}
