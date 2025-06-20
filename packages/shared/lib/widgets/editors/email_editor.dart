import 'package:shared/shared.dart';

class EmailEditor extends StatelessWidget {
  final String? initialValue;
  final Function(String?) onChanged;
  final bool readonly;
  final String? labelText;

  const EmailEditor({
    super.key,
    required this.onChanged,
    required this.initialValue,
    this.readonly = false,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return BaseEditor(
      initialValue: initialValue,
      keyboardType: TextInputType.emailAddress,
      required: true,
      labelText: labelText ?? context.appLocalization.email,
      readOnly: readonly,
      prefixIcon: const IconButton(onPressed: null, icon: CustomSvg(MyIcons.sms)),
      onChanged: (value) {
        if (value.isEmpty) {
          onChanged(null);
        } else {
          onChanged(value);
        }
      },
      validator: (value) => ValidationHelper.email(context, value),
    );
  }
}
