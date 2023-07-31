class ProfileData {
  String name;
  String email;
  int phoneNumber;

  ProfileData(
      {required this.name, required this.email, required this.phoneNumber});

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phoneNumber': phoneNumber,
      };
}
