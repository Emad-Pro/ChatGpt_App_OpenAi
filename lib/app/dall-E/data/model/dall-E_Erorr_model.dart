// ignore_for_file: prefer_void_to_null, unnecessary_question_mark

class DalleErorrModel {
  Error? error;

  DalleErorrModel({this.error});

  DalleErorrModel.fromJson(Map<String, dynamic> json) {
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (error != null) {
      data['error'] = error!.toJson();
    }
    return data;
  }
}

class Error {
  String? code;
  String? message;
  Null? param;
  String? type;

  Error({this.code, this.message, this.param, this.type});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    param = json['param'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    data['param'] = param;
    data['type'] = type;
    return data;
  }
}
