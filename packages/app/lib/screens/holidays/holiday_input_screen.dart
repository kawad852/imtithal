import 'package:shared/shared.dart';

class HolidayInputScreen extends StatefulWidget {
  const HolidayInputScreen({super.key});

  @override
  State<HolidayInputScreen> createState() => _HolidayInputScreenState();
}

class _HolidayInputScreenState extends State<HolidayInputScreen> {
  final _formKey = GlobalKey<FormState>();
  final _holiday = HolidayModel();

  void _onSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.unFocusKeyboard();
      ApiService.fetch(
        context,
        callBack: () async {
          final docRef = kFirebaseInstant.companyHolidays.doc();
          _holiday.id = docRef.id;
          _holiday.createdAt = kNowDate;
          await docRef.set(_holiday);
          if (context.mounted) {
            Fluttertoast.showToast(msg: context.appLocalization.addedSuccessfully);
            context.back();
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomButton(
        onPressed: () {
          _onSubmit(context);
        },
        text: context.appLocalization.addNewLeave,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.appLocalization.addNewLeave,
                style: TextStyle(
                  color: context.colorPalette.black252,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  context.appLocalization.leaveNote,
                  style: TextStyle(
                    color: context.colorPalette.grey8B8,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              TitledTextField(
                title: context.appLocalization.leaveTitle,
                child: TextEditor(
                  onChanged: (value) => _holiday.title = value!,
                  // hintText: context.appLocalization.taskTitleToComplyWith,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TitledTextField(
                  title: context.appLocalization.leaveDescription,
                  child: TextEditor(
                    onChanged: (value) => _holiday.description = value!,
                    // hintText: context.appLocalization.requiredTaskDescription,
                  ),
                ),
              ),
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: TitledTextField(
                      title: context.appLocalization.fromDate,
                      child: DatePickerEditor(
                        onChanged: (value) => _holiday.startDate = value,
                        value: _holiday.startDate,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TitledTextField(
                      title: context.appLocalization.toDate,
                      child: DatePickerEditor(
                        onChanged: (value) => _holiday.endDate = value,
                        value: _holiday.endDate,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
