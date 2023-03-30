class LoginModel {
    LoginModel({
        required this.message,
        required this.status,
    });

    final String? message;
    final bool? status;

    factory LoginModel.fromJson(Map<String, dynamic> json){ 
      
        return LoginModel(
            message: json["message"],
            status: json["status"],
        );
    }

}
