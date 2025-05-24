import 'package:shared/shared.dart';

class DepartmentInputScreen extends StatefulWidget {
  const DepartmentInputScreen({super.key});

  @override
  State<DepartmentInputScreen> createState() => _DepartmentInputScreenState();
}

class _DepartmentInputScreenState extends State<DepartmentInputScreen> {
  late DepartmentModel _department;
  final _formKey = GlobalKey<FormState>();

  void _onAdd(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      ApiService.fetch(
        context,
        callBack: () async {
          final ref = kFirebaseInstant.departments.doc();
          final id = ref.id;
          _department.id = id;
          _department.createdAt = kNowDate;
          await ref.set(_department);
          if (context.mounted) {
            context.showSnackBar(context.appLocalization.addedSuccessfully);
            Navigator.pop(context);
          }
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _department = DepartmentModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.appLocalization.addNewDepartment)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextEditor(
                onChanged: (value) => _department.name = value!,
                hintText: context.appLocalization.name,
              ),
              StretchedButton(
                margin: const EdgeInsets.only(top: 30),
                onPressed: () {
                  _onAdd(context);
                },
                child: Text(context.appLocalization.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
