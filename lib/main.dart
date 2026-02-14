import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:api_app/core/databases/cache/cache_helper.dart';
import 'package:api_app/features/user/presentation/provider/user_provider.dart';
import 'package:api_app/features/user/presentation/screens/user_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (_) => UserProvider()..fetchUser(), // أول تحميل حسب selectedId الافتراضي
        child: const UserScreen(),
      ),
    );
  }
}
