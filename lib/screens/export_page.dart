import 'dart:io';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

class ExportPage extends StatelessWidget {
  final String title;
  final List<List<dynamic>> locations; // Liste des données à exporter

  const ExportPage({
    super.key,
    required this.title,
    required this.locations,
  });

  Future<void> _exportAndShareCSV() async {
    try {
      // Convertir les données en format CSV
      String csvContent = const ListToCsvConverter().convert(locations);

      // Récupérer le répertoire local pour stocker le fichier
      final directory = await getApplicationDocumentsDirectory();

      // Chemin du fichier CSV
      final csvFilePath = '${directory.path}/exportData.csv';

      // Créer et écrire le fichier CSV
      final csvFile = await File(csvFilePath).create(recursive: true);
      await csvFile.writeAsString(csvContent);

      // Préparer le fichier pour le partage
      final files = <XFile>[
        XFile(csvFilePath, name: 'exportData.csv'),
      ];

      // Partager le fichier avec le plugin Share
      await Share.shareXFiles(
        files,
        text: 'Voici les données exportées au format CSV.',
      );
    } catch (e) {
      // Gérer les erreurs
      debugPrint('Erreur lors de l\'exportation ou du partage : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _exportAndShareCSV,
          child: const Text("Exporter les données en CSV"),
        ),
      ),
    );
  }
}
