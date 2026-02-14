import 'package:api_app/core/databases/api/end_points.dart';
import 'package:api_app/features/user/domain/entities/sub_entities/geo_entitiy.dart';

class GeoModel extends GeoEntitiy{
  GeoModel({
    required super.lat, 
    required super.lng
  });

  factory GeoModel.fromJson (Map<String, dynamic> json) {
    return GeoModel(
      lat: json[ApiKey.lat],
      lng: json[ApiKey.lng],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      ApiKey.lat: lat,
      ApiKey.lng: lng,
    };
  }
}