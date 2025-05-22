import 'dart:async';

import 'package:shared/shared.dart';

class EmployeeSelectionScreen extends StatefulWidget {
  final TaskModel task;

  const EmployeeSelectionScreen({super.key, required this.task});

  @override
  State<EmployeeSelectionScreen> createState() => _EmployeeSelectionScreenState();
}

class _EmployeeSelectionScreenState extends State<EmployeeSelectionScreen> {
  String query = '';
  Timer? _debounce;
  List<UserModel> _selectedUsers = [];
  late Stream<List<UserModel>> _usersStream;

  List<String> get _userIds => _selectedUsers.map((e) => e.id!).toList();

  TaskModel get _task => widget.task;

  void _initialize() {
    _usersStream = kFirebaseInstant.users.whereMyCompany.snapshots().map((e) {
      final users = e.docs.map((e) => e.data()).toList();
      users.removeWhere((e) => e.id == kUser.id);
      return users;
    });
  }

  _onSearchChanged(String query) {
    if (query.isEmpty) {
      setState(() {
        this.query = '';
        // _travelersFuture = Future.value(TravelersModel());
      });
      _debounce?.cancel();
      return;
    }
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.length > 2) {
        setState(() {
          this.query = query;
          // _fetchTravelers(context, query: query);
        });
      }
    });
  }

  void _onSubmit(BuildContext context) {
    ApiService.fetch(
      context,
      callBack: () async {
        final batch = kFirebaseInstant.batch();
        for (var e in _selectedUsers) {
          _task.user = LightUserModel(
            id: e.id!,
            displayName: e.displayName,
            profilePhoto: e.profilePhoto,
            jobTitle: e.jobTitle,
          );
          final taskDocRef = kFirebaseInstant.tasks.doc(_task.id);
          final assignedTaskDocRef = kFirebaseInstant.users
              .doc(e.id)
              .collection(MyCollections.assignedTasks)
              .taskConvertor
              .doc(_task.id);
          batch.set(assignedTaskDocRef, _task);
          batch.update(taskDocRef, {MyFields.totalAssignedUsers: FieldValue.increment(1)});
        }
        await batch.commit();
        if (context.mounted) {
          Navigator.pop(context);
          context.showSnackBar(context.appLocalization.savedSuccessfully);
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomButton(
        text: context.appLocalization.save,
        onPressed:
            _selectedUsers.isNotEmpty
                ? () {
                  _onSubmit(context);
                }
                : null,
      ),
      body: ImpededStreamBuilder(
        stream: _usersStream,
        onComplete: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final user = snapshot.data![index];
              final id = user.id;
              final selected = _userIds.contains(id);
              return CheckboxListTile(
                title: Text(user.displayName),
                value: selected,
                onChanged: (value) {
                  setState(() {
                    if (selected) {
                      _selectedUsers.remove(user);
                    } else {
                      _selectedUsers.add(user);
                    }
                  });
                },
              );
            },
          );
        },
      ),
    );
  }
}
