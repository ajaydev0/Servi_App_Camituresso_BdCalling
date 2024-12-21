class ProfileModel {
  AccountInformation? accountInformation;
  String? sId;
  String? name;
  String? role;
  String? email;
  String? contact;
  String? dateOfBirth;
  String? location;
  String? profile;
  bool? verified;
  String? createdAt;
  String? updatedAt;
  dynamic iV;

  ProfileModel(
      {this.accountInformation,
      this.sId,
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
      this.iV});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    accountInformation = json['accountInformation'] != null
        ? new AccountInformation.fromJson(json['accountInformation'])
        : null;
    sId = json['_id'];
    name = json['name'];
    role = json['role'];
    email = json['email'];
    contact = json['contact'];
    dateOfBirth = json['dateOfBirth'];
    location = json['location'];
    profile = json['profile'];
    verified = json['verified'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}

class AccountInformation {
  bool? status;

  AccountInformation({this.status});

  AccountInformation.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }
}
