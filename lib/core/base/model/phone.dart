class Phone {
  final String phone;
  final String dialCode;
  final String country;

  const Phone({
    required this.phone,
    required this.dialCode,
    required this.country,
  });

  const Phone.empty({
    this.phone = '',
    this.dialCode = '',
    this.country = '',
  });

  factory Phone.fromJson(Map<String, dynamic> json) {
    return Phone(
        phone: json['phone'],
        dialCode: json['dial_code'],
        country: json['country']);
  }

  Map<String, dynamic> get toJson {
    return {'dial_code': dialCode, 'country': country, 'phone': phone};
  }
}
