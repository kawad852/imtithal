import 'dart:async';

import 'package:shared/shared.dart';

class EmployeeSelectionScreen extends StatefulWidget {
  final List<UserModel> initialValue;
  final TaskModel task;

  const EmployeeSelectionScreen({super.key, required this.initialValue, required this.task});

  @override
  State<EmployeeSelectionScreen> createState() => _EmployeeSelectionScreenState();
}

class _EmployeeSelectionScreenState extends State<EmployeeSelectionScreen> {
  String query = '';
  Timer? _debounce;
  List<String> _selectedIds = [];
  late Stream<List<UserModel>> _usersStream;

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
        for (var e in _selectedIds) {
          final taskDocRef = kFirebaseInstant.users
              .doc(e)
              .collection(MyCollections.tasks)
              .taskConvertor
              .doc(_task.id);
          final userDocRef = kFirebaseInstant.users.doc(e);
          batch.set(taskDocRef, _task);
          batch.update(userDocRef, {
            MyFields.taskIds: FieldValue.arrayUnion([_task.id]),
          });
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
            _selectedIds.isNotEmpty
                ? () {
                  _onSubmit(context);
                }
                : null,
      ),
      body: ImpededStreamBuilder(
        stream: _usersStream,
        initialData: widget.initialValue,
        onComplete: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final user = snapshot.data![index];
              final id = user.id;
              final selected = _selectedIds.contains(id);
              return CheckboxListTile(
                title: Text(user.displayName),
                value: selected,
                onChanged: (value) {
                  setState(() {
                    if (selected) {
                      _selectedIds.remove(id);
                    } else {
                      _selectedIds.add(id!);
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
