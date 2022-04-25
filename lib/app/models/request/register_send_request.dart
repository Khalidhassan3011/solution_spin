class RegisterSendRequest {
  String phoneNumber;
  String password;
  String email;
  String name;
  String countryCode;

  RegisterSendRequest(
    this.phoneNumber,
    this.password,
    this.email,
    this.name,
    this.countryCode,
  );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "password": password,
        "email": email,
        "name": name,
        "countryCode": countryCode,
      };
}
