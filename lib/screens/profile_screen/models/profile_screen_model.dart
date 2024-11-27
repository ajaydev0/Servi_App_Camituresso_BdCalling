// lib/models/profile_model.dart
class ProfileModel {
  bool? success;
  String? message;
  Data? data;

  ProfileModel({this.success, this.message, this.data});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      success: json['success'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  String? id = "";
  String? name = "";
  String? role = "";
  String? email = "";
  String? contact = "";
  String? dateOfBirth = "";
  String? location = "";
  String? profile = "";
  bool? verified = false;
  String? createdAt = "";
  String? updatedAt = "";

  Data({
    this.id,
    this.name,
    this.role,
    this.email,
    this.contact,
    this.dateOfBirth,
    this.location,
    this.profile,
    this.verified,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['_id'],
      name: json['name'],
      role: json['role'],
      email: json['email'],
      contact: json['contact'] ?? '',
      dateOfBirth: json['dateOfBirth'] ?? '',
      location: json['location'] ?? '',
      profile: json['profile'],
      verified: json['verified'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
