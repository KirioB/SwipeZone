import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

class ImportPage extends StatefulWidget {
  final String title;

  const ImportPage({super.key, required this.title});

  @override
  State<ImportPage> createState() => _ImportPageState();
}

class _ImportPageState extends State<ImportPage> {

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
      body: const Center(
        child: Text('Import Page (NFC check on load)'),
      ),
    );
  }
}
