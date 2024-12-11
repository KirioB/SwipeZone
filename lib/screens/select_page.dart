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
  Map<Location,bool> plans = {};

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
              onTap: () {
                GoRouter.of(context).go('/import_page');
                Navigator.pop(context); // Ferme le menu
              },
            ),
            ListTile(
              leading: const Icon(Icons.file_download),
              title: const Text("Export Page"),
              onTap: () {
                GoRouter.of(context).go('/export_page');
                Navigator.pop(context); // Ferme le menu
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text("Planning Page"),
              onTap: () {
                GoRouter.of(context).go('/planning_page');
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
    Map<Location,bool> fetchedPlans = LocationManager().filters;
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
          return 
              ListTile(
                //leading: Image.network(plans[index].photoUrl ?? "", width: 50, height: 50),
                title: Text(plans.keys.elementAt(index).nom),
                trailing:  Checkbox(value: isCheck, onChanged: (val){
                setState(() {
                  isCheck = !isCheck;
                  plans[plans.keys.elementAt(index)] = isCheck;
                });
              })
              );
          
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         _showBottomMenu(context);
        },
        tooltip: 'Options',
        child: const Icon(Icons.menu),
      ),
    );
  }
}
