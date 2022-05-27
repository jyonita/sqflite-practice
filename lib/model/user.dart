import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

List<Users> usersFromJson(String json) {
  return List<Users>.from(jsonDecode(json).map((x) {
    return Users.fromJson(x);
  }));
}

@JsonSerializable(explicitToJson: true)
class Users {
  Users({
    this.id,
    this.address,
    this.company,
    this.email,
    this.name,
    this.phone,
    this.username,
    this.url,
  });

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  Map<String, dynamic> toJson() => _$UsersToJson(this);

  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final UserAddress? address;
  final String? phone;
  @JsonKey(name: 'website')
  final String? url;
  final UserCompany? company;
}

@JsonSerializable(explicitToJson: true)
class UserAddress {
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final UserAddressGeo? geo;

  factory UserAddress.fromJson(Map<String, dynamic> json) =>
      _$UserAddressFromJson(json);
  Map<String, dynamic> toJson() => _$UserAddressToJson(this);

  UserAddress({
    this.city,
    this.geo,
    this.street,
    this.suite,
    this.zipcode,
  });
}

@JsonSerializable(explicitToJson: true)
class UserAddressGeo {
  final String? lat;
  final String? lng;

  factory UserAddressGeo.fromJson(Map<String, dynamic> json) =>
      _$UserAddressGeoFromJson(json);

  Map<String, dynamic> toJson() => _$UserAddressGeoToJson(this);

  UserAddressGeo({
    this.lat,
    this.lng,
  });
}

@JsonSerializable(explicitToJson: true)
class UserCompany {
  UserCompany({
    this.bs,
    this.catchPhrase,
    this.name,
  });

  Map<String, dynamic> toJson() => _$UserCompanyToJson(this);

  factory UserCompany.fromJson(Map<String, dynamic> json) =>
      _$UserCompanyFromJson(json);
  final String? name;
  final String? catchPhrase;
  final String? bs;
}
