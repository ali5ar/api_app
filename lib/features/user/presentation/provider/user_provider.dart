import 'package:flutter/foundation.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:api_app/core/connection/network_info.dart';
import 'package:api_app/core/databases/api/dio_consumer.dart';
import 'package:api_app/core/databases/cache/cache_helper.dart';
import 'package:api_app/core/params/params.dart';
import 'package:api_app/features/user/data/datasources/user_local_data_source.dart';
import 'package:api_app/features/user/data/datasources/user_remote_data_source.dart';
import 'package:api_app/features/user/data/repositories/user_repository_impl.dart';
import 'package:api_app/features/user/domain/entities/user_entity.dart';
import 'package:api_app/features/user/domain/usecases/get_user.dart';

enum UserStatus { initial, loading, success, failure }

class UserProvider extends ChangeNotifier {
  UserProvider() : _getUser = _buildGetUser();


  static GetUser _buildGetUser() {
    return GetUser(
      repository: UserRepositoryImpl(
        remoteDataSource: UserRemoteDataSource(api: DioConsumer(dio: Dio())),
        localDataSource: UserLocalDataSource(cache: CacheHelper()),
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
      ),
    );
  }

  final GetUser _getUser;
  double selectedId = 2;
  UserStatus status = UserStatus.initial;
  UserEntity? user;
  String? errMessage;
  void changeId(double value) {
    selectedId = value;
    notifyListeners(); 
  }
  Future<void> fetchUser() async {
    status = UserStatus.loading;
    user = null;
    errMessage = null;
    notifyListeners();

    final result = await _getUser.call(
      params: UserParams(id: selectedId.toInt().toString()),
    );
    result.fold(
      (failure) {
        status = UserStatus.failure;
        errMessage = failure.errMessage;
        notifyListeners();
      },
      (u) {
        status = UserStatus.success;
        user = u;
        notifyListeners();
      },
    );
  }
  bool get isLoading => status == UserStatus.loading;
  bool get isSuccess => status == UserStatus.success;
  bool get isFailure => status == UserStatus.failure;
}
