/// Response models for the PDF to Text API.

/// API Response wrapper.
class PdftotextResponse {
  final String status;
  final dynamic error;
  final PdftotextData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  PdftotextResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory PdftotextResponse.fromJson(Map<String, dynamic> json) => PdftotextResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? PdftotextData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the PDF to Text API.

class PdftotextData {
  String? text;
  num? pageCount;
  num? pagesExtracted;
  bool? truncated;
  bool? hasText;
  num? wordCount;
  num? characterCount;
  List<PdftotextDataPagesItem>? pages;
  PdftotextDataMetadata? metadata;

  PdftotextData({
    this.text,
    this.pageCount,
    this.pagesExtracted,
    this.truncated,
    this.hasText,
    this.wordCount,
    this.characterCount,
    this.pages,
    this.metadata,
  });

  factory PdftotextData.fromJson(Map<String, dynamic> json) => PdftotextData(
      text: json['text'],
      pageCount: json['pageCount'],
      pagesExtracted: json['pagesExtracted'],
      truncated: json['truncated'],
      hasText: json['hasText'],
      wordCount: json['wordCount'],
      characterCount: json['characterCount'],
      pages: (json['pages'] as List?)?.map((e) => PdftotextDataPagesItem.fromJson(e)).toList(),
      metadata: json['metadata'] != null ? PdftotextDataMetadata.fromJson(json['metadata']) : null,
    );
}

class PdftotextDataPagesItem {
  num? page;
  String? text;
  num? wordCount;

  PdftotextDataPagesItem({
    this.page,
    this.text,
    this.wordCount,
  });

  factory PdftotextDataPagesItem.fromJson(Map<String, dynamic> json) => PdftotextDataPagesItem(
      page: json['page'],
      text: json['text'],
      wordCount: json['wordCount'],
    );
}

class PdftotextDataMetadata {
  String? title;
  String? author;
  dynamic subject;
  String? creator;
  String? producer;
  String? creationDate;
  String? modificationDate;
  String? pdfVersion;

  PdftotextDataMetadata({
    this.title,
    this.author,
    this.subject,
    this.creator,
    this.producer,
    this.creationDate,
    this.modificationDate,
    this.pdfVersion,
  });

  factory PdftotextDataMetadata.fromJson(Map<String, dynamic> json) => PdftotextDataMetadata(
      title: json['title'],
      author: json['author'],
      subject: json['subject'],
      creator: json['creator'],
      producer: json['producer'],
      creationDate: json['creationDate'],
      modificationDate: json['modificationDate'],
      pdfVersion: json['pdfVersion'],
    );
}

class PdftotextRequest {
  String? pdf;

  PdftotextRequest({
    this.pdf,
  });

  Map<String, dynamic> toJson() => {
      if (pdf != null) 'pdf': pdf,
    };
}
