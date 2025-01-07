import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:ndef/ndef.dart' as ndef;
import 'dart:io'; // Pour vérifier si c'est Android
import 'package:nfc_manager/nfc_manager.dart';
import 'dart:typed_data';

class ImportPage extends StatefulWidget {
  final String title;

  const ImportPage({super.key, required this.title});

  @override
  State<ImportPage> createState() => _ImportPageState();
}

class _ImportPageState extends State<ImportPage> with WidgetsBindingObserver{
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

   void _startNFCReading() async {
    print("read start");
    try {
      bool isAvailable = await NfcManager.instance.isAvailable();
      print("on try");
      //We first check if NFC is available on the device.
      if (isAvailable) {
        print("nfc available");
      //If NFC is available, start an NFC session and listen for NFC tags to be discovered.
        NfcManager.instance.startSession(
          
          onDiscovered: (NfcTag tag) async {
            // Process NFC tag, When an NFC tag is discovered, print its data to the console.
            print('NFC Tag Detected: ${tag.data}');
          },
          
        );
      } else {
        print('NFC not available.');
      }
    } catch (e) {
      print('Error reading NFC: $e');
    }
    print("sortie du read");
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
            // Bouton de transfert affiché uniquement si le NFC est activé
          if (_isNfcAvailable)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  _startNFCReading();
                  print("Bouton Import - Reception de données appuyé.");
                },
                child: Text("Lancer la reception de données"),
              ),
            ),
          ]
        )
      ),
    );
  }
}
