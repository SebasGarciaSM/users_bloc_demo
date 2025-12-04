import 'package:users_bloc_demo/domain/entities/address_entity.dart';

class Address {
  String street;
  String suite;
  String city;
  String zipcode;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
  });

  Address copyWith({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
  }) => Address(
    street: street ?? this.street,
    suite: suite ?? this.suite,
    city: city ?? this.city,
    zipcode: zipcode ?? this.zipcode,
  );

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    street: json["street"],
    suite: json["suite"],
    city: json["city"],
    zipcode: json["zipcode"],
  );

  Map<String, dynamic> toJson() => {
    "street": street,
    "suite": suite,
    "city": city,
    "zipcode": zipcode,
  };

  AddressEntity toEntity() => AddressEntity(
    street: street,
    suite: suite,
    city: city,
    zipcode: zipcode,
  );
}
