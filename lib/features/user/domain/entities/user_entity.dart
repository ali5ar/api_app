import 'package:api_app/features/user/domain/entities/sub_entities/addres_entitiy.dart';

class UserEntity {
  final String name;
  final String email;
  final String phone;
  final AddressEntitiy address;
  
  UserEntity({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    });
}



