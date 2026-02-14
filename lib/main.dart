// import 'package:flutter/material.dart';
// void main() {
//   runApp(const MyApp());
// }
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home:  SafeArea(
//         child: Scaffold(
//           body: Column(
//             // mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//                Container(
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 height: MediaQuery.of(context).size.height * 0.30,
//                 width: double.infinity,
//                 child:const Center(
//                   child: Text(
//                     'Clean Architecture',
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Icon(Icons.person, size: 30, color: Color.fromARGB(255, 159, 57, 57)),
//                   SizedBox(width: 10),
//                   Text(
//                     'ali abbas',
//                     style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 148, 48, 48)),
//                   ),
//                 ],
//               ),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Icon(Icons.email_outlined, size: 30, color: Color.fromARGB(255, 158, 43, 43)),
//                   SizedBox(width: 10),
//                   Text(
//                     'ala@gmail.com',
//                     style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 167, 43, 43)),
//                   ),
//                 ],
//               ),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Icon(Icons.phone, size: 30, color: Color.fromARGB(255, 174, 46, 46)),
//                   SizedBox(width: 10),
//                   Text(
//                     '123-456-7890',
//                     style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 184, 40, 40)),
//                   ),
//                 ],
//               ),
//                Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Container(
//                      color: const Color.fromARGB(26, 196, 18, 5),
//                       height: 40,
//                       width: 40,
//                      child: Icon(
//                       Icons.location_city,
//                        size: 30, color: const Color.fromARGB(255, 169, 46, 46),
//                        )
//                        ),
//                   SizedBox(width: 10),
//                   Text(
//                     'Iraq, Baghdad',
//                     style: TextStyle(fontSize: 18, color: const Color.fromARGB(255, 211, 74, 74)),
//                   ),
//                 ],
//               ),
//              const SizedBox(height: 20),
//              ElevatedButton(onPressed: ()=> {}, child: Text("Change User"))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
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
