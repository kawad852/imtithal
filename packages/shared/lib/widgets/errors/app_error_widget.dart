import 'package:flutter/material.dart';
import 'package:shared/widgets/errors/server_error_widget.dart';

import '../../network/api_service.dart';
import 'general_error_widget.dart';
import 'internet_error_widget.dart';

class AppErrorWidget extends StatefulWidget {
  final Object? error;
  final Widget? onServerError, onInternetError, onGeneralError;
  final VoidCallback onRetry;

  const AppErrorWidget({
    super.key,
    this.onServerError,
    this.onInternetError,
    required this.error,
    required this.onRetry,
    this.onGeneralError,
  });

  @override
  State<AppErrorWidget> createState() => _AppErrorWidgetState();
}

class _AppErrorWidgetState extends State<AppErrorWidget> {
  Failure? _failure;

  Widget _buildErrorWidget() {
    switch (_failure!.type) {
      case ApiService.firebaseException:
        return widget.onServerError ?? const ServerErrorWidget();
      case ApiService.timeoutException:
      case ApiService.socketException:
        return widget.onInternetError ?? InternetErrorWidget(onRetry: widget.onRetry);
      default:
        return widget.onGeneralError ?? const GeneralErrorWidget();
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.error is Failure) {
      _failure = widget.error as Failure;
    }
    debugPrint("SnapshotError:: ${_failure?.type}");
  }

  @override
  Widget build(BuildContext context) {
    return _failure != null ? _buildErrorWidget() : const GeneralErrorWidget();
  }
}
