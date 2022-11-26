
class SignUpModel {
  final String email;
  final String password;
  final String confirmPassword;
  final String name;
  final String address;
  final String phone;

  SignUpModel(
      {required this.email,
      required this.phone,
      required this.password,
      required this.confirmPassword,
      required this.address,
      required this.name});

  const SignUpModel.empty(
      {this.email = '',
      this.password = '',
      this.phone = '',
      this.confirmPassword = '',
      this.address = '',
      this.name = ''});

  SignUpModel copyWith({
    String? email,
    String? password,
    String? confirmPassword,
    String? name,
    String? address,
    String? phone,
  }) {
    return SignUpModel(
        phone: phone ?? this.phone,
        address: address ?? this.address,
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        name: name ?? this.name);
  }
}
