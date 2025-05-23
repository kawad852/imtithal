import 'package:app/screens_exports.dart';
import 'package:shared/providers/task_provider.dart';
import 'package:shared/shared.dart';

import 'firebase_options.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey(debugLabel: "Main Navigator");

// dart pub global activate melos
// melos bootstrap

// khaled@gmail.com
// 123456

Future<void> _logout() async {
  await FirebaseAuth.instance.signOut();
  MySharedPreferences.clearStorage();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MySharedPreferences.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await _logout();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => AppProvider()),
        ChangeNotifierProvider(create: (context) => TaskProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget _toggleScreen(BuildContext context) {
    if (MySharedPreferences.user?.id != null) {
      return const AppNavBar();
    } else {
      return const LoginScreen();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer2<AppProvider, UserProvider>(
      builder: (BuildContext context, appProvider, userProvider, Widget? child) {
        final colorScheme = ColorScheme.fromSeed(
          seedColor: const Color(0xFF708D81),
          surface: Colors.white,
          brightness: appProvider.appTheme == ThemeEnum.light ? Brightness.light : Brightness.dark,
        );
        return MultiProvider(
          // key: ValueKey(userProvider.isAuthenticated),
          providers: [
            StreamProvider<UserModel>.value(
              key: ValueKey(userProvider.isAuthenticated),
              value:
                  userProvider.isAuthenticated
                      ? userProvider.userDocRef.snapshots().map(
                        (event) => event.data() ?? UserModel(createdById: ''),
                      )
                      : Stream.value(UserModel(createdById: '')),
              initialData: MySharedPreferences.user ?? UserModel(createdById: ''),
              updateShouldNotify: (initialValue, value) {
                MySharedPreferences.user = value;
                Future.microtask(() {
                  if (userProvider.isAuthenticated && (value.id == null || value.blocked)) {
                    Fluttertoast.showToast(msg: "Authorization Failed");
                    // ignore: use_build_context_synchronously
                    userProvider.logout(rootNavigatorKey.currentContext!);
                  }
                });
                return true;
              },
            ),
            // StreamProvider<List<ItemModel>>.value(
            //   key: ValueKey(userProvider.isAuthenticated),
            //   value:
            //       userProvider.isAuthenticated && kBranch != null
            //           ? _outOfStockStream
            //           : Stream.value([]),
            //   initialData: const [],
            //   updateShouldNotify: (initialValue, value) {
            //     return true;
            //   },
            // ),
            // StreamProvider<BranchModel>.value(
            //   key: ValueKey(userProvider.isAuthenticated),
            //   value:
            //       userProvider.isAuthenticated && kBranch != null
            //           ? _branchStream
            //           : Stream.value(BranchModel()),
            //   initialData: BranchModel(),
            //   updateShouldNotify: (initialValue, value) {
            //     return true;
            //   },
            // ),
            StreamProvider<bool>.value(value: null, initialData: true),
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            navigatorKey: rootNavigatorKey,
            builder: EasyLoading.init(),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: appProvider.appLocale,
            theme: MyTheme().materialTheme(context, colorScheme),
            // home: const AppNavBar(),
            home: _toggleScreen(context),
          ),
        );
      },
    );
  }
}
