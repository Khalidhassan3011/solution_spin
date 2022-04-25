import 'package:solution_spin/app/models/otp_number.dart';
import 'package:solution_spin/app/models/request/register_send_request.dart';

class RegisterRequest {
  RegisterSendRequest request;
  OtpNumber otpNumber;

  RegisterRequest(this.request, this.otpNumber);

  Map<String, dynamic> toJson() => {}
    ..addAll(request.toJson())
    ..addAll(otpNumber.toJson());
}
