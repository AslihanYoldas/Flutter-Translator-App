class TranslatorResult {
  int? status;
  String? query;
  String? translateTo;
  String? translation;

  TranslatorResult.fromJson(Map<String, dynamic> json) {
    status = json['status'] as int;
    query = json['query'] as String;
    translateTo = json['translateTo'] as String;
    translation = json['translation'] as String;
  }


  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'query': query,
      'translateTo': translateTo,
      'translation': translation,
    };
  }
}
