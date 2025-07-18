import 'dart:async';
import 'dart:io';

import 'package:shared/shared.dart';
import 'package:uuid/uuid.dart';

import '../../algolia_exports.dart';

FirebaseFirestore get kFirebaseInstant => FirebaseFirestore.instance;
DateTime get kNowDate => DateTime.now();
String get kUUID => const Uuid().v1().replaceAll('-', '');
UserModel get kUser => MySharedPreferences.user!;
String get kUserId => MySharedPreferences.user!.id!;
String get kCompanyId => kUser.companyId;
SearchClient get kAlgoliaClient =>
    SearchClient(appId: kAlgoliaApplicationId, apiKey: kAlgoliaApiKey);

bool get kIsAdmin => MySharedPreferences.user?.role == RoleEnum.admin.value;
bool get kIsEmployee => MySharedPreferences.user?.role == RoleEnum.employee.value;
bool get kIsDepartmentManager => MySharedPreferences.user?.role == RoleEnum.departmentManager.value;
bool get kIsEmtithalManager => MySharedPreferences.user?.role == RoleEnum.emtithalManager.value;

class ApiService {
  static const String socketException = 'socket-exception';
  static const String timeoutException = 'timeout-exception';
  static const String generalException = 'general-exception';
  static const String firebaseException = 'firebase-exception';

  static void _showError(BuildContext context, Failure failure) {
    switch (failure.type) {
      case ApiService.timeoutException:
      case ApiService.socketException:
        context.showSnackBar(context.appLocalization.networkError);
      default:
        context.showSnackBar(context.appLocalization.generalError);
    }
  }

  static Future<T> build<T>({
    required Future<T> Function() callBack,
    bool throwErrorForTesting = false,
  }) async {
    try {
      if (throwErrorForTesting) {
        // throw FirebaseException(plugin: '');
        throw const SocketException('');
        // throw TimeoutException('');
        // throw Exception();
      }

      final futureCallback = await callBack().timeout(
        const Duration(seconds: 30),
        onTimeout: () => throw TimeoutException(timeoutException),
      );
      return futureCallback;
    } on FirebaseException catch (e) {
      debugPrint("Exception::\nType:: FirebaseException\nmsg:: ${e.message}\nCode:: ${e.code}");
      throw Failure(type: firebaseException, code: e.code);
    } on SocketException catch (e) {
      debugPrint("Exception::\nType:: SocketException\nmsg:: $e");
      throw Failure(type: socketException, code: e.message);
    } on TimeoutException catch (e) {
      debugPrint("Exception::\nType:: TimeoutException\nmsg:: $e");
      throw Failure(type: timeoutException, code: e.message ?? '');
    } catch (e) {
      debugPrint("Exception::\nType:: GeneralException\nmsg:: $e");
      throw Failure(type: generalException, code: e.toString());
    }
  }

  static Future<void> fetch(
    BuildContext context, {
    required Future Function() callBack,
    Function(Failure failure)? onError,
    bool showErrorFeedback = true,
    bool withOverlayLoader = true,
    Widget? indicator,
  }) async {
    Failure? failure;

    try {
      if (withOverlayLoader && !AppOverlayLoader.isShown) {
        AppOverlayLoader.show(indicator: indicator);
      }

      /// Errors Test
      // await Future.delayed(Duration.zero, () {
      // throw FirebaseAuthException(code: '');
      //   // throw FirebaseException(plugin: '');
      // throw TimeoutException('');
      //   // throw SocketException('');
      // throw Exception();
      // });

      ///
      final futureCallback = await callBack()
          .timeout(
            const Duration(seconds: 30),
            onTimeout: () => throw TimeoutException(timeoutException),
          )
          .whenComplete(() {
            if (withOverlayLoader) {
              AppOverlayLoader.hide();
            }
          });
      return futureCallback;
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        if (e.code == 'user-not-found') {
          context.showSnackBar(context.appLocalization.emailNotFound);
        } else if (e.code == 'wrong-password') {
          context.showSnackBar(context.appLocalization.wrongPassword);
        } else if (e.code == 'invalid-credential') {
          context.showSnackBar(context.appLocalization.invalidCredential);
        } else {
          context.showSnackBar(context.appLocalization.generalError);
        }
      }
    } on SocketException catch (e) {
      debugPrint("Exception::\nType:: SocketException\nmsg:: $e");
      failure = Failure(type: socketException, code: e.message);
    } on TimeoutException catch (e) {
      debugPrint("Exception::\nType:: TimeoutException\nmsg:: $e");
      failure = Failure(type: timeoutException, code: e.message ?? '');
    } catch (e) {
      debugPrint("Exception::\nType:: GeneralException\nmsg:: $e");
      failure = Failure(type: generalException, code: e.toString());
    } finally {
      if (withOverlayLoader && AppOverlayLoader.isShown) {
        AppOverlayLoader.hide();
      }
      if (context.mounted && showErrorFeedback && failure != null) {
        onError == null ? _showError(context, failure) : onError(failure);
      }
    }
  }
}

class Failure {
  final String type, code;

  Failure({required this.type, required this.code});
}
