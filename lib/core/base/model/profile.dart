class Profile {
  final String id;
  final String name;
  final String email;

  Profile({required this.id, required this.name, required this.email});

  const Profile.empty({this.id = '', this.name = 'An', this.email = 'trannhatan@gmail.com'});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        email: json['email'] ?? '');
  }

  Profile copyWith(
    String? id,
    String? name,
    String? email,
  ) {
    return Profile(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
}
