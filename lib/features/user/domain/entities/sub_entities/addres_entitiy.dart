import 'package:api_app/features/user/domain/entities/sub_entities/geo_entitiy.dart';
class AddressEntitiy {
    final String street;
    final String suite;
    final String city;
    final String zipcode;
    final GeoEntitiy geo;

  AddressEntitiy({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo
    });
}