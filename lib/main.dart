import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swipezone/screens/export_page.dart';
import 'package:swipezone/screens/home_page.dart';
import 'package:swipezone/screens/import_page.dart';
import 'package:swipezone/screens/planning_page.dart';
import 'package:swipezone/screens/select_page.dart';
import 'package:swipezone/domains/location_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  

  runApp(
    MaterialApp.router(
      routerConfig: _router,
    ),
  );
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
          path: 'planning_page',
          builder: (BuildContext context, GoRouterState state) {
            return const PlanningPage(
              title: "Planning Page",
            );
          },
        ),
        GoRoute(
          path: 'select_page',
          builder: (BuildContext context, GoRouterState state) {
            return const SelectPage(
              title: "Select Page",
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
            final locationsData = LocationManager()
                .wantedLocations
                .map((location) => [
                      location.nom,
                      location.description,
                      location.schedule,
                      location.contact,
                      location.photoUrl,
                      location.category,
                      location.activities,
                      location.localization
                    ])
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
