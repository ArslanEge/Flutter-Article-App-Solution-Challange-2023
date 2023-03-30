class RegisterModel {
    RegisterModel({
        required this.email,
        required this.id,
        required this.password,
    });

    final String? email;
    final int? id;
    final String? password;

    factory RegisterModel.fromJson(Map<String, dynamic> json){ 
        return RegisterModel(
            email: json["email"],
            id: json["id"],
            password: json["password"],
        );
    }

}
