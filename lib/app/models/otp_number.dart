class OtpNumber {
  String email;
  String phone;

  OtpNumber(this.email, this.phone);

  Map<String, dynamic> toJson() => {
        "otpNumberForEmail": email,
        "otpNumberForPhone": phone,
      };
}
