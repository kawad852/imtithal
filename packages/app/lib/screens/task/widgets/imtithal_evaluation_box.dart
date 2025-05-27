import 'package:flutter/material.dart';
import 'package:shared/extensions/base_extension.dart';
import 'package:shared/helper/translation_extension.dart';
import 'package:shared/widgets/evaluation_box.dart';

class ImtithalEvaluationBox extends StatelessWidget {
  final (int, String) values;

  const ImtithalEvaluationBox({super.key, required this.values});

  @override
  Widget build(BuildContext context) {
    return EvaluationBox(
      title: context.appLocalization.complianceAssessment,
      subTitle: "${context.appLocalization.imtithal} ${values.$2}",
      value: "${values.$1}%",
      color: context.colorPalette.primary,
    );
  }
}
