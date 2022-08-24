class SignIn {
  String? email;
  String? password;

  SignIn({this.email, this.password});

  SignIn.fromJson(Map<String, dynamic> json)
      : email = json["email"],
        password = json["password"];

  Map<String, dynamic> toJson() => { "email": email, "password": password};
}
