import 'dart:async';

import 'package:shared/shared.dart';

class EmployeeSelectionScreen extends StatefulWidget {
  final Stream<List<UserModel>> usersStream;

  const EmployeeSelectionScreen({super.key, required this.usersStream});

  @override
  State<EmployeeSelectionScreen> createState() => _EmployeeSelectionScreenState();
}

class _EmployeeSelectionScreenState extends State<EmployeeSelectionScreen> {
  String query = '';
  Timer? _debounce;
  List<String> _selectedIds = [];

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ImpededStreamBuilder(
        stream: widget.usersStream,
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
