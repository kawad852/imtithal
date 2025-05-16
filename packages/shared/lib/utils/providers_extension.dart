import 'package:shared/providers/task_provider.dart';
import 'package:shared/shared.dart';

extension ProvidersExtension on BuildContext {
  UserProvider get userProvider => read<UserProvider>();
  AppProvider get appProvider => read<AppProvider>();
  TaskProvider get taskProvider => read<TaskProvider>();
}
