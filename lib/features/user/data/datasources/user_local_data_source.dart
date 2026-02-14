import 'dart:convert';

import 'package:api_app/core/databases/cache/cache_helper.dart';
import 'package:api_app/core/errors/expentions.dart';
import 'package:api_app/features/user/data/models/usre_model.dart';

class UserLocalDataSource {
  final CacheHelper cache;
  final key ="CachedUser";

  // Encodes the UserModel object to JSON string and caches it
  UserLocalDataSource({required this.cache});
  cacheUser (UserModel? userToCache) {
    if (userToCache != null) {
      cache.saveData(
        key:key ,
        value: json.encode(
          userToCache.toJson(),
        ),
      );
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  } 

    // Decodes the cached JSON string back to UserModel object

  Future<UserModel> getLastUser() {
    final jsonString = cache.getDataString(key: key);
    if (jsonString != null) {
      return Future.value(UserModel.fromJson(json.decode(jsonString)));
    } else {
     throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }

}