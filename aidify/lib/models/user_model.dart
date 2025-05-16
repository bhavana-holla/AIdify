/*class UserModel {
  final String uid;
  final String username;
  final String dob;
  final String bloodGroup;
  final String rhFactor;
  final String healthConcerns;
  final String address;

  UserModel({
    required this.uid,
    required this.username,
    required this.dob,
    required this.bloodGroup,
    required this.rhFactor,
    required this.healthConcerns,
    required this.address,
  });

  factory UserModel.fromMap(String uid, Map<String, dynamic> data) {
    return UserModel(
      uid: uid,
      username: data['username'] ?? '',
      dob: data['dob'] ?? '',
      bloodGroup: data['bloodGroup'] ?? '',
      rhFactor: data['rhFactor'] ?? '',
      healthConcerns: data['healthConcerns'] ?? '',
      address: data['address'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'dob': dob,
      'bloodGroup': bloodGroup,
      'rhFactor': rhFactor,
      'healthConcerns': healthConcerns,
      'address': address,
    };
  }
}*/

class UserModel {
  final String uid;
  final String username;
  final String dob;
  final String? bloodGroup;
  final String? rhFactor;
  final String? healthConcerns;
  final String? address;

  UserModel({
    required this.uid,
    required this.username,
    required this.dob,
    this.bloodGroup,
    this.rhFactor,
    this.healthConcerns,
    this.address,
  });

  factory UserModel.fromMap(Map<String, dynamic> map, String uid) {
    return UserModel(
      uid: uid,
      username: map['username'] ?? '',
      dob: map['dob'] ?? '',
      bloodGroup: map['bloodGroup'],
      rhFactor: map['rhFactor'],
      healthConcerns: map['healthConcerns'],
      address: map['address'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'dob': dob,
      'bloodGroup': bloodGroup,
      'rhFactor': rhFactor,
      'healthConcerns': healthConcerns,
      'address': address,
    };
  }
}
