class Media {
  final int id;
  final String filePath;
  final String fileName;
  final int fileSize;
  final String type;

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
        id: json['id'] ?? -1,
        filePath: json['filePath'],
        fileName: json['fileName'],
        type: json['type'],
        fileSize: json['size']);
  }

  Map<String, dynamic> get toJson {
    return {
      'id': id,
      'filePath': filePath,
      'fileName': fileName,
      'size': fileSize,
      'type': 'image',
    };
  }

  const Media.empty(
      {this.fileName = '',
      this.filePath = '',
      this.fileSize = 0,
      this.id = -1,
      this.type = ''});

  Media({
    required this.filePath,
    required this.fileName,
    required this.type,
    required this.fileSize,
    required this.id,
  });

  Media copyWith({
    String? filePath,
    String? fileName,
    String? type,
    int? id,
    int? fileSize,
  }) {
    return Media(
      id: id?? this.id,
      filePath: filePath ?? this.filePath,
      type: type ?? this.type,
      fileName: fileName ?? this.fileName,
      fileSize: fileSize ?? this.fileSize,
    );
  }
}
