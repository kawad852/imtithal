import 'package:shared/models/notification/notification_model.dart';
import 'package:shared/object_box_exports.dart';
import 'package:shared/shared.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;

  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    final id = notification.data?.id;
    final type = notification.data?.type;
    return GestureDetector(
      onTap: () {
        NotificationRouteHandler.toggle(context, id: id, type: type);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          color: context.colorPalette.greyF5F,
          borderRadius: BorderRadius.circular(kRadiusSecondary),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 55,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: context.colorPalette.primary,
                    borderRadius: BorderRadius.circular(kRadiusSecondary),
                  ),
                  child: const CustomSvg(MyIcons.notificationLogo),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification.notification!.title!,
                        style: TextStyle(
                          color: context.colorPalette.black252,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        notification.notification!.body!,
                        style: TextStyle(
                          color: context.colorPalette.grey8B8,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                DateFormat.yMd(context.languageCode).add_jm().format(notification.createdAt!),
                style: TextStyle(
                  color: context.colorPalette.grey8B8,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
