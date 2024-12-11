import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'dart:io'; // Pour vérifier si c'est Android

class ExportPage extends StatefulWidget {
  final String title;

  const ExportPage({super.key, required this.title});

  @override
  State<ExportPage> createState() => _ExportPageState();
}

class _ExportPageState extends State<ExportPage> with WidgetsBindingObserver {
  String nfcStatusMessage = "Checking NFC availability...";
  bool _isNfcAvailable = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // Observe le cycle de vie
    checkNfcAvailability();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // Supprime l'observateur
    super.dispose();
  }

  // Fonction de vérification de la disponibilité du NFC
  void checkNfcAvailability() async {
    var availability = await FlutterNfcKit.nfcAvailability;

    if (availability != NFCAvailability.available) {
      setState(() {
        _isNfcAvailable = false; // NFC désactivé
      });
    } else {
      setState(() {
        _isNfcAvailable = true; // NFC activé
      });
    }
  }

  // Détecte les changements dans le cycle de vie de l'application
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      // Vérifie l'état du NFC lorsque l'application revient au premier plan
      checkNfcAvailability();
    }
  }

  void openNfcSettings() {
    final intent = AndroidIntent(
      action: 'android.settings.NFC_SETTINGS',
    );
    intent.launch();
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
            // Afficher le message en fonction de la disponibilité du NFC
            Text(
              _isNfcAvailable
                  ? 'NFC est activé'
                  : 'NFC est désactivé, veuillez l\'activer',
              style: TextStyle(fontSize: 18),
            ),
            // Si NFC est désactivé, afficher le bouton "Activer le NFC"
            if (!_isNfcAvailable)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                  onPressed: openNfcSettings, // Ouvre les paramètres du NFC
                  child: Text('Activer le NFC'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
