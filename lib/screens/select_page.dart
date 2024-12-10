import 'package:flutter/material.dart';
import 'package:swipezone/domains/location_manager.dart';
import 'package:swipezone/repositories/models/location.dart';
import 'package:go_router/go_router.dart';

class SelectPage extends StatefulWidget {
  final String title;

  const SelectPage({super.key, required this.title});

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  List<Location> plans = [];

  // Fonction pour ouvrir le menu flottant
  void _showImportExportMenu() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.file_upload),
                title: Text("Import"),
                onTap: () {
                  GoRouter.of(context).go('/import_page');
                  print("Import clicked");
                  Navigator.pop(context); // Ferme le menu
                },
              ),
              ListTile(
                leading: Icon(Icons.file_download),
                title: Text("Export"),
                onTap: () {
                  GoRouter.of(context).go('/export_page');
                  // Logique pour "Export"
                  print("Export clicked");
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
  onPressed: _showImportExportMenu, 
  tooltip: 'Import/export Choices',
  child: const Icon(Icons.add),  // Le "+" sera représenté par l'icône "add"
),

    );
  }
}
