import 'package:shared/models/aps/aps_model.dart';
import 'package:shared/models/notification/notification_model.dart';
import 'package:shared/models/notification_header/notification_header_model.dart';
import 'package:shared/models/payload/payload_model.dart';
import 'package:shared/shared.dart';

class SendNotificationScreen extends StatefulWidget {
  const SendNotificationScreen({super.key});

  @override
  State<SendNotificationScreen> createState() => _SendNotificationScreenState();
}

class _SendNotificationScreenState extends State<SendNotificationScreen> {
  late NotificationModel _notification;
  final _formKey = GlobalKey<FormState>();

  void _send(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      context.unFocusKeyboard();
      ApiService.fetch(
        context,
        callBack: () async {
          await SendNotificationService.send(
            context,
            notificationModel: _notification,
            targetAll: true,
          );
          if (context.mounted) {
            Fluttertoast.showToast(msg: context.appLocalization.sentSuccessfully);
            Navigator.pop(context);
          }
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _notification = NotificationModel(
      apns: PayloadModel(aps: ApsModel(sound: "default")),
      notification: NotificationHeaderModel(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.appLocalization.notifications)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(kScreenMargin),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TitledTextField(
                title: context.appLocalization.title,
                child: TextEditor(onChanged: (value) => _notification.notification!.title = value),
              ),
              TitledTextField(
                title: context.appLocalization.body,
                child: TextEditor(onChanged: (value) => _notification.notification!.body = value),
              ),
              StretchedButton(
                margin: const EdgeInsets.only(top: 50),
                onPressed: () {
                  _send(context);
                },
                child: Text(context.appLocalization.send),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
