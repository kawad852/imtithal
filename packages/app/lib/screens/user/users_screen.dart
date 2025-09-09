import 'package:app/screens/user/user_input_screen.dart';
import 'package:shared/shared.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late Query<UserModel> _query;

  void _initialize() {
    _query = kFirebaseInstant.users.whereMyCompany.orderByCreatedAtDesc;
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.appLocalization.employees),
        actions: [
          IconButton.filledTonal(
            onPressed: () {
              context.navigate((context) {
                return const UserInputScreen();
              });
            },
            icon: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: CustomFirestoreQueryBuilder(
        query: _query,
        onComplete: (context, snapshot) {
          return ListView.separated(
            itemCount: snapshot.docs.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            padding: const EdgeInsets.all(kScreenMargin),
            itemBuilder: (context, index) {
              final user = snapshot.docs[index].data();
              return ListTile(
                onTap: () {
                  context.navigate((context) {
                    return UserInputScreen(user: user);
                  });
                },
                tileColor: context.colorPalette.greyF5F,
                leading: CircleAvatar(
                  backgroundImage:
                      user.profilePhoto != null ? NetworkImage(user.profilePhoto!) : null,
                ),
                title: Text(user.displayName),
                subtitle: Text(user.jobTitle),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              );
            },
          );
        },
      ),
    );
  }
}
