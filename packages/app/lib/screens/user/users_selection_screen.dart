import 'dart:async';

import 'package:shared/shared.dart';

class UsersSelectionScreen extends StatefulWidget {
  final List<String> userIds;

  const UsersSelectionScreen({super.key, required this.userIds});

  @override
  State<UsersSelectionScreen> createState() => _UsersSelectionScreenState();
}

class _UsersSelectionScreenState extends State<UsersSelectionScreen> {
  String query = '';
  Timer? _debounce;
  List<UserModel>? _selectedUsers;

  List<String> get _userIds => _selectedUsers?.map((e) => e.id!).toList() ?? [];

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        onChanged: _onSearchChanged,
        hintText: context.appLocalization.searchForEmployee,
      ),
      bottomNavigationBar: BottomButton(
        text: context.appLocalization.save,
        onPressed:
            _selectedUsers?.isNotEmpty ?? false
                ? () {
                  Navigator.pop(context, _selectedUsers);
                }
                : null,
      ),
      body: UsersSelector(
        builder: (context, allUsers) {
          final users =
              allUsers
                  .where((e) => e.companyId == kCompanyId && e.role == RoleEnum.employee.value)
                  .toList();
          _selectedUsers ??= users.where((e) => widget.userIds.contains(e.id)).toList();
          return ListView.builder(
            itemCount: users.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final user = users[index];
              final id = user.id;
              final selected = _userIds.contains(id);
              return CheckboxListTile(
                title: Text(user.displayName),
                value: selected,
                onChanged: (value) {
                  setState(() {
                    if (selected) {
                      _selectedUsers!.remove(user);
                    } else {
                      _selectedUsers!.add(user);
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
