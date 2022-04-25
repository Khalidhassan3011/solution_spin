import 'package:get/get.dart';
import 'package:solution_spin/app/models/request/login_request.dart';
import 'package:solution_spin/app/models/request/register_request.dart';
import 'package:solution_spin/app/models/request/register_send_request.dart';

abstract class ApiHelper {
  Future<Response> registerSend(RegisterSendRequest request);

  Future<Response> register(RegisterRequest register);

  Future<Response> login(LoginRequest login);
}
