class UserModel {
  String? firstName;
  String? lastName;
  String? middleName;
  String? pinfl;
  String? birthCountry;

  UserModel({this.firstName, this.lastName, this.middleName, this.pinfl, this.birthCountry});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['first_name'],
      lastName: json['last_name'],
      middleName: json['middle_name'],
      pinfl: json['pinfl'],
      birthCountry: json['birth_country']
    );
  }
}
