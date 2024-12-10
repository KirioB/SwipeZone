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
  Map<Location, bool> plans = {};

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
  void initState() {
    super.initState();
    _loadPlans();
  }

  Future<void> _loadPlans() async {
    Map<Location, bool> fetchedPlans = LocationManager().filters;
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
          bool isCheck = plans.values.elementAt(index);
          return ListTile(
              //leading: Image.network(plans[index].photoUrl ?? "", width: 50, height: 50),
              title: Text(plans.keys.elementAt(index).nom),
              trailing: Checkbox(
                  value: isCheck,
                  onChanged: (val) {
                    setState(() {
                      isCheck = !isCheck;
                      plans[plans.keys.elementAt(index)] = isCheck;
                    });
                  }));
        },
      ),
      floatingActionButton: FloatingActionButton(
<<<<<<< HEAD
        onPressed: () {
          GoRouter.of(context).push('/planningpage');
        },
        tooltip: 'Add plan',
        child: const Icon(Icons.add),
      ),
=======
  onPressed: _showImportExportMenu, 
  tooltip: 'Import/export Choices',
  child: const Icon(Icons.add),  // Le "+" sera représenté par l'icône "add"
),

>>>>>>> eb89fc1 (bouton import/export)
    );
  }
}
