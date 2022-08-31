import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/blocs/switch_blocs/switch_state.dart';
import 'package:todo_app/screens/tabs_screen.dart';
import 'package:todo_app/services/app_routers.dart';
import 'package:todo_app/services/app_theme.dart';
import 'blocs/bloc_export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  // ignore: deprecated_member_use
  HydratedBlocOverrides.runZoned(
      () => runApp(MyApp(
            appRouter: AppRouter(),
          )),
      storage: storage);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => TasksBloc()),
          BlocProvider(create: (context) => SwitchBloc())
        ],
        child: BlocBuilder<SwitchBloc, SwitchState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter',
              theme: state.switchValue
                  ? AppThemes.appThemeData[AppTheme.darkTheme]
                  : AppThemes.appThemeData[AppTheme.lightTheme],
              home: const TabsScreen(),
              onGenerateRoute: appRouter.onGenerateRoute,
            );
          },
        ));
  }
}
