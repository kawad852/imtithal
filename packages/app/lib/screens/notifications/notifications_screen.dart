import 'package:app/screens/notifications/widgets/notification_card.dart';
import 'package:shared/models/notification/notification_model.dart';
import 'package:shared/shared.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late Query<NotificationModel> _notificationsQuery;

  void _initializeQuery() {
    _notificationsQuery =
        kFirebaseInstant.notifications(MySharedPreferences.user!.id!).orderByCreatedAtDesc;
  }

  @override
  void initState() {
    super.initState();
    context.userProvider.userDocRef.update({MyFields.unReadNotificationsCount: 0});
    _initializeQuery();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.appLocalization.notifications)),
      body: CustomFirestoreQueryBuilder(
        query: _notificationsQuery,
        onComplete: (context, snapshot) {
          // if (snapshot.docs.isEmpty) {
          //   return EmptyWidget(
          //     icon: FontAwesomeIcons.bell,
          //     title: context.appLocalization.emptyNotificationsTitle,
          //     body: context.appLocalization.emptyNotificationsBody,
          //   );
          // }

          return ListView.separated(
            itemCount: snapshot.docs.length,
            separatorBuilder: (context, index) => const Divider(height: 0),
            padding: const EdgeInsets.symmetric(vertical: kScreenMargin),
            itemBuilder: (context, index) {
              if (snapshot.isLoadingMore(index)) {
                return const FPLoading();
              }

              final notification = snapshot.docs[index].data();
              return NotificationCard(notification: notification);
            },
          );
        },
      ),
    );
  }
}
