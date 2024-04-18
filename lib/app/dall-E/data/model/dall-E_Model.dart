class DallEModel {
  int? created;
  List<Data>? data;

  DallEModel({this.created, this.data});

  DallEModel.fromJson(Map<String, dynamic> json) {
    created = json['created'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['created'] = created;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? url;
  String? revisedPrompt;
  Data({this.url, this.revisedPrompt});

  Data.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    revisedPrompt = json['revised_prompt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['revised_prompt'] = revisedPrompt;
    return data;
  }
}
