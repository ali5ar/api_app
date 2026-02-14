import 'package:api_app/core/databases/api/end_points.dart';
import 'package:api_app/features/user/data/models/sub_model/address_model.dart';
import 'package:api_app/features/user/data/models/sub_model/company_model.dart';
import 'package:api_app/features/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity{
  int id;
  final String username;
  final String website;
  final CompanyModel company;
  UserModel({
    required this.id,
    required super.name, 
    required super.email, 
    required super.phone, 
    required super.address, 
    required this.username,
    required this.website,
    required this.company
    });
    factory UserModel.fromJson(Map<String, dynamic>json){
      return UserModel(
        id: json[ApiKey.id],
        name: json[ApiKey.name], 
        phone: json[ApiKey.phone],
        email: json[ApiKey.email],  
        username:json[ApiKey.username],
        website: json[ApiKey.website],
        address:AddressModel.fromJson(json[ApiKey.address]) ,
        company:CompanyModel.fromJson(json[ApiKey.company]) ,
      );
    }

    Map<String, dynamic> toJson(){
      return {
        ApiKey.id: id,
        ApiKey.name: name,
        ApiKey.phone: phone,
        ApiKey.email: email,
        ApiKey.address: address,
        ApiKey.username: username,
        ApiKey.website: website,
        ApiKey.company: company
      };
    }
}


