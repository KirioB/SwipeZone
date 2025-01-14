import 'package:flutter/material.dart';
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
                  // Logique pour "Import"
                  print("Import clicked");
                  Navigator.pop(context); // Ferme le menu
                },
              ),
              ListTile(
                leading: Icon(Icons.file_download),
                title: Text("Export"),
                onTap: () {
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
        onPressed: _showImportExportMenu, // Appel de la fonction pour ouvrir le menu
        tooltip: 'Add plan',
        child: const Icon(Icons.add),
      ),
    );
  }
}
