import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swipezone/screens/export_page.dart';
import 'package:swipezone/screens/home_page.dart';
import 'package:swipezone/screens/import_page.dart';
import 'package:swipezone/screens/planning_page.dart';
import 'package:swipezone/screens/select_page.dart';

void main() {
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
          } 
        ),
        GoRoute(
          path: '/export_page',
          builder: (BuildContext context, GoRouterState state){ 
            return const ExportPage(
              title: 'Export Page'
              );
              }
          )
      ],
    ),
  ],
);


//test YannDGP
//test KirioB
//test Cel
/*taaaaaaatatatatataaaaaaaa*/
//test add necessaire ou non