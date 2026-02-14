//!data_connection_checker_tv
//يستخدم هذا الباكيج للتحقق من وجود اتصال بالإنترنت قبل محاولة إجراء أي طلبات API
//. هذا يساعد في تحسين تجربة المستخدم عن طريق تجنب محاولات الاتصال عندما لا يكون هناك اتصال بالإنترنت،
// مما يوفر الوقت والموارد.
import 'package:data_connection_checker_tv/data_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool>? get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
