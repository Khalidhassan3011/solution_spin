import 'dart:async';

import 'package:solution_spin/app/models/request/login_request.dart';

import 'package:solution_spin/app/models/request/register_request.dart';

import 'package:solution_spin/app/models/request/register_send_request.dart';

import '../common/util/exports.dart';
import 'interceptor.dart';

class ApiHelperImpl extends GetConnect with ApiHelper {
  @override
  void onInit() {
    httpClient.baseUrl = Constants.baseUrl;
    httpClient.timeout = Constants.timeout;

    addRequestModifier();

    httpClient.addResponseModifier(
      (request, response) => interceptor(
        httpClient,
        request,
        response,
      ),
    );
  }

  void addRequestModifier() {
    httpClient.addRequestModifier<dynamic>((request) {
      printInfo(
        info: 'REQUEST ║ ${request.method.toUpperCase()}\n'
            'url: ${request.url}\n'
            'Headers: ${request.headers}\n'
            'Body: ${request.files?.toString() ?? ''}\n',
      );

      return request;
    });
  }

  @override
  Future<Response> login(LoginRequest login) async {
    return await post("users/login", login.toJson());
  }

  @override
  Future<Response> register(RegisterRequest register) async {
    return await post("users/register", register.toJson());
  }

  @override
  Future<Response> registerSend(RegisterSendRequest request) async {
    return await post("otps/register/send", request.toJson());
  }
}
