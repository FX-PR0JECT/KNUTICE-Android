import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/main_screen.dart';
import 'viewModel/news_view_model.dart';
import 'viewModel/main_news_view_model.dart';
import 'api_firebase_auth_fcm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppTestState();
}

class _MyAppTestState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    postIdAndDeviceToken();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KNUTICE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromRGBO(89, 0, 0, 1)),
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<NewsViewModel>(
              create: (context) => NewsViewModel()),
          ChangeNotifierProvider<MainNewsViewModel>(
              create: (context) => MainNewsViewModel()),
        ],
        child: const MainScreen(),
      ),
    );
  }
}

// class MyAppTest extends StatelessWidget {
//   const MyAppTest({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'KNUTICE',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         useMaterial3: true,
//         colorScheme:
//             ColorScheme.fromSeed(seedColor: const Color.fromRGBO(89, 0, 0, 1)),
//       ),
//       home: MultiProvider(
//         providers: [
//           ChangeNotifierProvider<NewsViewModel>(
//               create: (context) => NewsViewModel()),
//           ChangeNotifierProvider<MainNewsViewModel>(
//               create: (context) => MainNewsViewModel()),
//         ],
//         child: const MainScreen(),
//       ),
//     );
//   }
// }
