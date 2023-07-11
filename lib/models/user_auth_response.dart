class UserAuthResponse {
  bool? isAccountVerified;
  String? username;
  String? email;
  String? userId;
  String? deviceToken;
  String? password;

  UserAuthResponse({
    this.isAccountVerified,
    this.username,
    this.userId,
    this.email,
    this.deviceToken,
    this.password
  });

  UserAuthResponse.fromJson(Map<String, dynamic> json) {
    isAccountVerified = json['isAccountVerified'];
    username = json['username'];
    userId = json['userId'];
    deviceToken = json['deviceToken'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isAccountVerified'] = isAccountVerified;
    data['username'] = username;
    data['userId'] = userId;
    data['deviceToken'] = deviceToken;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
