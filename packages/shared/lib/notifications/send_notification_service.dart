import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:http/http.dart' as http;

import '../../shared.dart';
import '../models/notification/notification_model.dart';
import '../models/notification_data/notification_data_model.dart';
import '../models/notification_header/notification_header_model.dart';

class SendNotificationService {
  static sendToUser(
    BuildContext context, {
    required String userId,
    required String? deviceToken,
    required String? languageCode,
    required String id,
    required String type,
    required String titleEn,
    required String titleAr,
    required String bodyEn,
    required String bodyAr,
    String? userIdForData,
  }) async {
    if (deviceToken == null) {
      return;
    }

    // final filter = Filter(Filter(MyFields.idBranch, isEqualTo: kBranch?.id));
    final docRef = kFirebaseInstant.users.doc(userId);
    // final userDocSnapshot = await docRef.get();
    //
    // final docRef = userDocRef.reference;
    // final user = userDocRef.data()!;
    // final token = user.deviceToken;
    // final languageCode = user.languageCode;
    //
    final title = languageCode == LanguageEnum.english ? titleEn : titleAr;
    final body = languageCode == LanguageEnum.english ? bodyEn : bodyAr;

    final notificationModel = NotificationModel(
      notification: NotificationHeaderModel(title: title, body: body),
      token: deviceToken,
      data: NotificationDataModel(id: id, type: type, userId: userIdForData),
    );

    docRef.update({MyFields.unReadNotificationsCount: FieldValue.increment(1)});

    final notificationDocId = kUUID;
    final json = {
      "id": notificationDocId,
      "notification": notificationModel.notification!.toJson(),
      "data": notificationModel.data!.toJson(),
      "createdAt": FieldValue.serverTimestamp(),
    };
    docRef.collection(MyCollections.notifications).doc(notificationDocId).set(json);

    // ignore: use_build_context_synchronously
    send(context, notificationModel: notificationModel);
  }

  static Future<void> send(
    BuildContext context, {
    required NotificationModel notificationModel,
    bool targetAll = false,
  }) async {
    final accessToken = await _getAccessToken();

    final notification = notificationModel.notification!;
    final data = notificationModel.data;
    var json = <String, dynamic>{
      "notification": notification.toJson(),
      "data": data?.toJson(),
      if (targetAll) "topic": "all",
      if (!targetAll) "token": notificationModel.token!,
    };

    final result = await http.post(
      Uri.parse('https://fcm.googleapis.com/v1/projects/imtithal-app/messages:send'),
      headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $accessToken'},
      body: jsonEncode({
        "message": {
          ...json,
          "apns": {
            "payload": {
              "aps": {"sound": "default"},
            },
          },
        },
      }),
    );
    if (result.statusCode == 200) {
      final documentREF = FirebaseFirestore.instance.collection("notifications").doc();
      json["id"] = documentREF.id;
      json["createdAt"] = FieldValue.serverTimestamp();
      await documentREF.set(json);
      debugPrint("Notification Sent Successfully!!");
    } else {
      debugPrint("NotificationStatus Failed:: ${result.body} ${result.statusCode}");
    }
  }

  static Future<String> _getAccessToken() async {
    // Load the service account JSON from the assets folder
    final String serviceAccountString = await rootBundle.loadString(
      'assets/serviceAccountJsonKey.json',
    );

    // Parse the JSON string into a Map
    final serviceAccountJson = jsonDecode(serviceAccountString);

    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging",
    ];

    http.Client client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
    );

    // Obtain the access token
    auth.AccessCredentials credentials = await auth.obtainAccessCredentialsViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
      client,
    );

    // Close the HTTP client
    client.close();

    // Return the access token
    return credentials.accessToken.data;
  }
}
