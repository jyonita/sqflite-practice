// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
      id: json['id'] as int?,
      address: json['address'] == null
          ? null
          : UserAddress.fromJson(json['address'] as Map<String, dynamic>),
      company: json['company'] == null
          ? null
          : UserCompany.fromJson(json['company'] as Map<String, dynamic>),
      email: json['email'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      username: json['username'] as String?,
      url: json['website'] as String?,
    );

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'address': instance.address?.toJson(),
      'phone': instance.phone,
      'website': instance.url,
      'company': instance.company?.toJson(),
    };

UserAddress _$UserAddressFromJson(Map<String, dynamic> json) => UserAddress(
      city: json['city'] as String?,
      geo: json['geo'] == null
          ? null
          : UserAddressGeo.fromJson(json['geo'] as Map<String, dynamic>),
      street: json['street'] as String?,
      suite: json['suite'] as String?,
      zipcode: json['zipcode'] as String?,
    );

Map<String, dynamic> _$UserAddressToJson(UserAddress instance) =>
    <String, dynamic>{
      'street': instance.street,
      'suite': instance.suite,
      'city': instance.city,
      'zipcode': instance.zipcode,
      'geo': instance.geo?.toJson(),
    };

UserAddressGeo _$UserAddressGeoFromJson(Map<String, dynamic> json) =>
    UserAddressGeo(
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
    );

Map<String, dynamic> _$UserAddressGeoToJson(UserAddressGeo instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

UserCompany _$UserCompanyFromJson(Map<String, dynamic> json) => UserCompany(
      bs: json['bs'] as String?,
      catchPhrase: json['catchPhrase'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$UserCompanyToJson(UserCompany instance) =>
    <String, dynamic>{
      'name': instance.name,
      'catchPhrase': instance.catchPhrase,
      'bs': instance.bs,
    };
