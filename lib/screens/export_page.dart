import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

class ExportPage extends StatefulWidget {
  final String title;

  const ExportPage({super.key, required this.title});

  @override
  State<ExportPage> createState() => _ExportPageState();
}

class _ExportPageState extends State<ExportPage> {

  @override
  void initState() {
    super.initState();
    checkNfcAvailability();
  }

  // Fonction de vérification de la disponibilité du NFC
void checkNfcAvailability() async {
  var availability = await FlutterNfcKit.nfcAvailability;

  if (availability != NFCAvailability.available) {
    // Si le NFC n'est pas disponible, vous pouvez afficher un message d'erreur ou rediriger l'utilisateur.
    print("NFC non disponible sur cet appareil.");
  } else {
    print("NFC est disponible.");
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('Export Page (NFC check on load)'),
      ),
    );
  }
}
