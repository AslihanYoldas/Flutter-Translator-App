class TranslatorResult {
  String? status;
  Data? data;

  TranslatorResult({required this.status, required this.data});

  TranslatorResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  String? translatedText;

  Data({required this.translatedText});

  Data.fromJson(Map<String, dynamic> json) {
    translatedText = json['translatedText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['translatedText'] = this.translatedText;
    return data;
  }
}
