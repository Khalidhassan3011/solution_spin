import 'dart:convert';

class RegisterSendResponse {
  RegisterSendResponse({
    required this.status,
    required this.statusCode,
    this.errors,
  });

  String status;
  int statusCode;
  List<Error>? errors;

  factory RegisterSendResponse.fromRawJson(String str) => RegisterSendResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegisterSendResponse.fromJson(Map<String, dynamic> json) => RegisterSendResponse(
    status: json["status"],
    statusCode: json["statusCode"],
    errors: json["errors"] == null? null : List<Error>.from(json["errors"].map((x) => Error.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "statusCode": statusCode,
    "errors": List<dynamic>.from(errors!.map((x) => x.toJson())),
  };
}

class Error {
  Error({
    required this.value,
    required this.msg,
    required this.param,
    required this.location,
  });

  String value;
  String msg;
  String param;
  String location;

  factory Error.fromRawJson(String str) => Error.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    value: json["value"],
    msg: json["msg"],
    param: json["param"],
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "msg": msg,
    "param": param,
    "location": location,
  };
}
