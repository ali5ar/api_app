import 'package:api_app/core/databases/api/end_points.dart';
import 'package:api_app/features/user/data/models/sub_model/geo_model.dart';
import 'package:api_app/features/user/domain/entities/sub_entities/addres_entitiy.dart';

class AddressModel extends AddressEntitiy{
  AddressModel({
    required super.street, 
    required super.suite, 
    required super.city, 
    required super.zipcode, 
    required super.geo 
    });

    factory AddressModel.fromJson (Map<String, dynamic> json) {
        return AddressModel(
          street: json[ApiKey.street],
          suite: json[ApiKey.suite],
          city: json[ApiKey.city],
          zipcode: json[ApiKey.zipcode],
          geo: GeoModel.fromJson(json[ApiKey.geo]),
        ); 
      }
    Map<String, dynamic> toJson() {
      return {
        ApiKey.street: street,
        ApiKey.suite: suite,
        ApiKey.city: city,
        ApiKey.zipcode: zipcode,
        ApiKey.geo: geo,
      };
    }
}