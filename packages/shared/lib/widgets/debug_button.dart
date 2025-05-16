import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DebugButton extends StatelessWidget {
  final Future Function() future;

  const DebugButton({super.key, required this.future});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: kDebugMode,
      child: FloatingActionButton(
        onPressed: () async {
          try {
            await future();
          } catch (e) {
            print("e::: $e");
          }
        },
      ),
    );
  }
}
