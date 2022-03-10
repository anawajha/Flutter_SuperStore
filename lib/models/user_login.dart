class UserLogin {
  late int id;
  late String fullName;
  late String email;
  late String gender;
  late String? fcmToken;
  late String token;
  late String refreshToken;
  late bool isActive;

  UserLogin.user(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.gender,
      required this.fcmToken,
      required this.token,
      required this.refreshToken,
      required this.isActive});

  UserLogin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    gender = json['gender'];
    fcmToken = json['fcm_token'];
    token = json['token'];
    refreshToken = json['refresh_token'];
    isActive = json['is_active'];
  }
}
