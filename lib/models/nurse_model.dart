class NurseModel {
  final int id;
  final int userId;
  final int doctorId;
  final String name;
  final int specialityId;
  final String licenseNumber;
  final String specialityName;
  final String birthDate;
  final String birthDateString;
  final String birthDateStringIndo;
  final String profilePic;
  final String phone;
  final bool maritalStatus;
  final String email;
  final String nira;
  final String sip;
  final String createdAt;
  final String updatedAt;
  final String deletedAt;

  NurseModel({
    required this.id,
    required this.userId,
    required this.doctorId,
    required this.name,
    required this.specialityId,
    required this.licenseNumber,
    required this.specialityName,
    required this.birthDate,
    required this.birthDateString,
    required this.birthDateStringIndo,
    required this.profilePic,
    required this.phone,
    required this.maritalStatus,
    required this.email,
    required this.nira,
    required this.sip,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'doctorId': doctorId,
      'name': name,
      'specialityId': specialityId,
      'licenseNumber': licenseNumber,
      'specialityName': specialityName,
      'birthDate': birthDate,
      'birthDateString': birthDateString,
      'birthDateStringIndo': birthDateStringIndo,
      'profilePic': profilePic,
      'phone': phone,
      'maritalStatus': maritalStatus,
      'email': email,
      'nira': nira,
      'sip': sip,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
    };
  }

  factory NurseModel.fromJson(Map<String, dynamic> json) {
    return NurseModel(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      doctorId: json['doctor_id'] as int,
      name: json['name'] ?? "",
      specialityId: json['speciality_id'] as int,
      licenseNumber: json['license_number'] ?? "",
      specialityName: json['speciality_name'] ?? "",
      birthDate: json['birth_date'] ?? "",
      birthDateString: json['birth_date_string'] ?? "",
      birthDateStringIndo: json['birth_date_string_indo'] ?? "",
      profilePic: json['profile_pic'] ?? "",
      phone: json['phone'] ?? "",
      maritalStatus: json['marital_status'] as bool,
      email: json['email'] ?? "",
      nira: json['nira'] ?? "",
      sip: json['sip'] ?? "",
      createdAt: json['created_at'] ?? "",
      updatedAt: json['updated_at'] ?? "",
      deletedAt: json['deleted_at'] ?? "",
    );
  }
}
