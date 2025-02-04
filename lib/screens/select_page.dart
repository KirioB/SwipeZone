import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swipezone/domains/location_manager.dart';
import 'package:swipezone/repositories/models/location.dart';

class SelectPage extends StatefulWidget {
  final String title;

  const SelectPage({super.key, required this.title});

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  List<Location> plans = [];
  bool shouldShowImportCvs = false;

  @override
  void initState() {
    super.initState();

    _loadPlans();
  }

  Future<void> _loadPlans() async {
    List<Location> fetchedPlans = LocationManager().wantedLocations;
    setState(() {
      plans = fetchedPlans;
    });
  }

  void _showBottomMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.file_upload),
                title: const Text("Import Page"),
                onTap: () async {
                  Navigator.of(context).pop();
                  await GoRouter.of(context).push('/import_page').then(
                    (value) {
                      _loadPlans();
                    },
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.file_download),
                title: const Text("Export Page"),
                onTap: () {
                  GoRouter.of(context).push('/export_page');
                  Navigator.pop(context); // Ferme le menu
                },
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text("Planning Page"),
                onTap: () {
                  GoRouter.of(context).push('/planning_page');
                  Navigator.pop(context); // Ferme le menu
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: plans.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(plans[index].nom),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showBottomMenu(context), // Appel avec le contexte
        tooltip: 'Menu',
        child: const Icon(Icons.add),
      ),
    );
  }
}
