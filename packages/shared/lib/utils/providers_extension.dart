import 'package:shared/providers/drawer_provider.dart';
import 'package:shared/shared.dart';

extension ProvidersExtension on BuildContext {
  UserProvider get userProvider => read<UserProvider>();
  AppProvider get appProvider => read<AppProvider>();
  PortalProvider get portalProvider => read<PortalProvider>();
  DrawerProvider get drawerProvider => read<DrawerProvider>();
}
