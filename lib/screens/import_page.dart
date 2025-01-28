import 'package:flutter/material.dart';
import 'package:file_selector/file_selector.dart';
import 'package:csv/csv.dart';
import 'package:go_router/go_router.dart';
import 'package:swipezone/domains/location_manager.dart';
import 'package:swipezone/repositories/models/activities.dart';
import 'package:swipezone/repositories/models/categories.dart';
import 'package:swipezone/repositories/models/localization.dart';
import 'package:swipezone/repositories/models/location.dart';

class ImportPage extends StatefulWidget {
  final String title;
  const ImportPage({super.key, required this.title});

  @override
  _ImportPageState createState() => _ImportPageState();
}

class _ImportPageState extends State<ImportPage> {
  // Liste pour afficher un aperçu des données importées
  List<List<dynamic>> importedData = [];

  Future<void> _importCSV() async {
    // Utiliser package:file_selector pour sélectionner un fichier
    final XFile? file = await openFile(acceptedTypeGroups: [
      XTypeGroup(label: 'CSV', extensions: ['csv']),
    ]);

    if (file != null) {
      // Lire le contenu du fichier CSV
      final csvString = await file.readAsString();
      // Convertir le contenu en une liste de données
      List<List<dynamic>> data = CsvToListConverter().convert(csvString);

      // Mettre à jour l'état pour afficher les données importées
      setState(() {
        importedData = data;
      });

      // Ajouter les données importées dans la liste wantedLocations
      _addDataToLocationManager(data, context);
    }
  }

  Localization _parseLocalization(String? localizationData) {
  if (localizationData == null || localizationData.isEmpty) {
    // Retourne une localisation par défaut si les données sont nulles ou vides
    return Localization('', 0.0, 0.0);
  }

  // Sépare les données par des virgules
  List<String> parts = localizationData.split(',');

  // Extraire l'adresse, la latitude et la longitude
  String address = parts.isNotEmpty ? parts[0] : ''; // Première partie : adresse
  double latitude = parts.length > 1 ? double.tryParse(parts[1]) ?? 0.0 : 0.0; // Deuxième partie : latitude
  double longitude = parts.length > 2 ? double.tryParse(parts[2]) ?? 0.0 : 0.0; // Troisième partie : longitude

  return Localization(address, latitude, longitude);
}


  // Ajouter les données importées dans le LocationManager
  void _addDataToLocationManager(List<List<dynamic>> data, BuildContext context) {
    // Assumer que les données sont bien formatées pour correspondre à Location
    for (var item in data) {
      if (item.length >= 8) {
        
      Location newLocation = Location(
        nom: item[0] ?? '',
        description: item[1] ?? '',
        schedule: item[2] != 'null' ? item[2] : null, // Si la valeur peut être null
        contact: item[3] != 'null' ? item[3] : null,
        photoUrl: item[4] ?? '',
        category: Categories.values.firstWhere(
          (c) => c.toString() == item[5],
          orElse: () => Categories.Church,
        ),
        activities: item[6]?.split(',').map((activity) {
          return Activities.values.firstWhere(
            (a) => a.toString().split('.').last == activity, // Comparaison après extraction du nom
            orElse: () => Activities.Boxing,
            );
        }).toList().cast<Activities>() ?? [],

        
        localization: _parseLocalization(item[7]),);

        // Créer une nouvelle instance de Location à partir des données importées
        
        

/*
        for(int i=0;i <item.length; i++){
          if (item[i]=='null'|| item[i] == null){
            item[i] = null;
          }
        Location newLocation = Location(
          nom: item[0] ?? '',
          description: item[1] ?? '',
          schedule: null,
          contact: null,
          photoUrl: item[4] ?? '',
          category: Categories.Church,
          activities: [Activities.Boxing],
          localization: Localization("", 0.0, 0.0),
        );
*/
        // Ajouter la nouvelle location dans le LocationManager
        LocationManager.instance.addLocationToWanted(newLocation);
      }
    }
// Cette ligne redirige vers la SelectPage
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _importCSV,
              child: const Text("Importer fichier CSV"),
            ),
            if (importedData.isNotEmpty) ...[
              const SizedBox(height: 20),
              Text("Données importées :"),
              ListView.builder(
                shrinkWrap: true,
                itemCount: importedData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    //title: Text(importedData[index].toString()),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  // Naviguer vers la page SelectPage
                  GoRouter.of(context).pop('/select_page');
                },
                child: const Text('Retour à la SelectPage'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
