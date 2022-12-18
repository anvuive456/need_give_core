
class Media {
  final String filePath;
  final String fileName;
  final int fileSize;
  final String type;
  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
        filePath: json['filePath'],
        fileName: json['fileName'],
        type: json['type'],
        fileSize: json['size']);
  }
  Map<String, dynamic> get toJson {
    return {'filePath': filePath, 'fileName': fileName, 'filePath': fileSize};
  }

  const Media.empty(
      {this.fileName = '',
        this.filePath = '',
        this.fileSize = 0,
        this.type = ''});
  Media({
    required this.filePath,
    required this.fileName,
    required this.type,
    required this.fileSize,
  });

  Media copyWith({
    String? filePath,
    String? fileName,
    String? type,
    int? fileSize,
  }) {
    return Media(
      filePath: filePath ?? this.filePath,
      type: type ?? this.type,
      fileName: fileName ?? this.fileName,
      fileSize: fileSize ?? this.fileSize,
    );
  }
}