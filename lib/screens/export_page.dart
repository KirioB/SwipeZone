import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ExportPage extends StatelessWidget {
  final String title;
  const ExportPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    // Texte prédéfini à exporter
    final String textToExport = "Voici le texte à exporter depuis la page ExportPage.";

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Fonction pour partager le texte prédéfini
            Share.share(textToExport);
          },
          child: const Text("Exporter le texte"),
        ),
      ),
    );
  }
}
