import 'dart:async';

import 'package:shared/shared.dart';

class EmployeeSelectionScreen extends StatefulWidget {
  final List<UserModel> initialValue;
  final String taskId;

  const EmployeeSelectionScreen({super.key, required this.initialValue, required this.taskId});

  @override
  State<EmployeeSelectionScreen> createState() => _EmployeeSelectionScreenState();
}

class _EmployeeSelectionScreenState extends State<EmployeeSelectionScreen> {
  String query = '';
  Timer? _debounce;
  List<String> _selectedIds = [];
  late Stream<List<UserModel>> _usersStream;

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

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
