class SignInModel {
  final String phone;
  final String password;

  SignInModel({required this.phone, required this.password});

  const SignInModel.empty({this.phone = '', this.password = ''});

  SignInModel copyWith({
    String? email,
    String? password,
  }) {
    return SignInModel(
      phone: email ?? this.phone,
      password: password ?? this.password,
    );
  }

  Map<String,dynamic> toJson() {
    return {
      'email':this.phone,
      'password':this.password,
    };
  }
}
