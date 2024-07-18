class User {
  final String mobile_number;
  final String name;
  final String faculty;
  final String address;

  const User({
    required this.mobile_number,
    required this.name,
    required this.faculty,
    required this.address,
  });

  static User fromJson(json) => User(
      mobile_number: json['mobile_number'],
      name: json['name'],
      faculty: json['faculty'],
      address: json['address']);
}
