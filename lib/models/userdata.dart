class LocalUser {
  const LocalUser(
    this.fullName,
    this.email,
    this.age,
    this.phone,
    this.gender,
    this.address,
    this.city,
    this.bloodGroup,
    this.pinCode,
  );

  final String fullName;
  final int age;
  final String email;
  final int phone;
  final String gender;
  final String address;
  final String city;
  final int pinCode;
  final String bloodGroup;

  // fromMap(map) {
  //   return LocalUser(fullName: map[], email, age, phone, gender, address, city, bloodGroup, pinCode)
  // }
}
