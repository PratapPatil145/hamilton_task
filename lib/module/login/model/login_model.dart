class LoginModel {
  String? message;
  User? user;
  String? token;

  LoginModel({this.message, this.user, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  String? clientName;
  String? mail;
  int? country;
  bool? clientStatus;
  String? clientPhone;
  int? clientGender;
  int? clientId;

  User(
      {this.clientName,
      this.mail,
      this.country,
      this.clientStatus,
      this.clientPhone,
      this.clientGender,
      this.clientId});

  User.fromJson(Map<String, dynamic> json) {
    clientName = json['client_name'];
    mail = json['mail'];
    country = json['country'];
    clientStatus = json['client_status'];
    clientPhone = json['client_phone'];
    clientGender = json['client_gender'];
    clientId = json['client_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client_name'] = this.clientName;
    data['mail'] = this.mail;
    data['country'] = this.country;
    data['client_status'] = this.clientStatus;
    data['client_phone'] = this.clientPhone;
    data['client_gender'] = this.clientGender;
    data['client_id'] = this.clientId;
    return data;
  }
}
