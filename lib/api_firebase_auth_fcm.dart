import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> initializeFirebase() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  } catch (e) {
    // print('initializeFirebase 에러');
  }
}

Future<String?> getUserUid() async {
  try {
    final userCredential = await FirebaseAuth.instance.signInAnonymously();
    final String? id = userCredential.user?.uid;
    return id;
  } catch (e) {
    // print('getUserUid 에러');
    return null;
  }
}

Future<String?> getDeviceToken() async {
  try {
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    return fcmToken;
  } catch (e) {
    // print('getDeviceToken 에러');
    return null;
  }
}

Future<void> postIdAndDeviceToken() async {
  try {
    await initializeFirebase();

    await dotenv.load();
    final String url = '${dotenv.get('SERVER_URL')}/fcm/sendDeviceToken';

    final String? id = await getUserUid();
    final String? deviceToken = await getDeviceToken();
    final Map<dynamic, dynamic> data = {
      'id': id,
      'deviceToken': deviceToken,
    };
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      // print('Success: ${response.body}');
    } else {
      // print('Failed: ${response.statusCode}');
    }
  } catch (e) {
    // print('post 에러');
  }
}
