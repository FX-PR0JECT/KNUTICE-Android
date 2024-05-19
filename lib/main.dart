import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/main_screen.dart';
import 'viewModel/news_view_model.dart';
import 'viewModel/main_news_view_model.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KNUTICE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromRGBO(89, 0, 0, 1))
                .copyWith(
          background: Colors.grey[50]!,
        ),
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

// Future<String?> _initializeFirebaseAndRetrieveFCMToken() async {
//   try {
//     // 현재 플랫폼에 맞는 Firebase 옵션 설정
//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );

//     // FCM 토큰 가져오기
//     String? fcmToken = await FirebaseMessaging.instance.getToken();
//     return fcmToken;
//   } catch (e) {
//     // 오류 발생 시 예외 처리
//     // print('Error initializing Firebase: $e');
//     return null;
//   }
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: FutureBuilder(
//         future: _initializeFirebaseAndRetrieveFCMToken(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             // Firebase 초기화 및 FCM 토큰 얻는 중인 경우 로딩 표시
//             return CircularProgressIndicator();
//           } else if (snapshot.hasError) {
//             // 오류 발생 시 오류 메시지 표시
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           } else {
//             // Firebase 초기화 및 FCM 토큰 얻기 완료 후 앱 실행
//             return HomeScreen(fcmToken: snapshot.data);
//           }
//         },
//       ),
//     );
//   }
// }
