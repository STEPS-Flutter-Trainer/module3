class UserModel {
  String? uid;
  String? email;
  String? displayName;
  String? phoneNumber;
  String? dateOfBirth;

  UserModel({
    this.uid,
    this.email,
    this.displayName,
    this.phoneNumber,
    this.dateOfBirth,
  });

  // Create a UserModel from a map
  UserModel.fromMap(Map<String, dynamic> map) {
    uid = map['uid'];
    email = map['email'];
    displayName = map['displayName'];
    phoneNumber = map['phoneNumber'];
    dateOfBirth = map['dateOfBirth'];
  }

  // Convert UserModel to a map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'phoneNumber': phoneNumber,
      'dateOfBirth': dateOfBirth,
    };
  }
}
