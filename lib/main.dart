import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart'; // Add this import
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swipezone/screens/export_page.dart';
import 'package:swipezone/screens/home_page.dart';
import 'package:swipezone/screens/import_page.dart';
import 'package:swipezone/screens/planning_page.dart';
import 'package:swipezone/screens/select_page.dart';
import 'package:swipezone/theme/theme.dart';
import 'package:swipezone/theme/theme_provider.dart';
import 'package:swipezone/domains/location_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final pref = await SharedPreferences.getInstance();

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(pref: pref),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Builder(
          builder: (context) {
            final theme = MaterialTheme(Theme.of(context).textTheme);
            return MaterialApp.router(
              routerConfig: _router,
              themeMode: themeProvider.getThemeMode(),
              theme: theme.lightMediumContrast(),
              darkTheme: theme.dark(),
            );
          },
        );
      },
    );
  }
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage(
          title: 'HomePage',
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'planningpage',
          builder: (BuildContext context, GoRouterState state) {
            return const PlanningPage(
              title: "PlanningPage",
            );
          },
        ),
        GoRoute(
          path: 'selectpage',
          builder: (BuildContext context, GoRouterState state) {
            return const SelectPage(
              title: "SelectPage",
            );
          },
        ),
        GoRoute(
            path: '/import_page',
            builder: (BuildContext context, GoRouterState state) {
              return const ImportPage(
                title: "Import Page",
              );
            }),
        GoRoute(
          path: '/export_page',
          builder: (BuildContext context, GoRouterState state) {
            // Récupérer les données de LocationManager
            final locationsData = LocationManager().locations
                .map((location) => [location.nom, location.description, location.schedule,location.contact,location.photoUrl,location.category,location.activities,location.localization])
                .toList();

            return ExportPage(
              title: "Export Page",
              locations: locationsData,
            );
          },
        ),

      ],
    ),
  ],
);
