import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:ndef/ndef.dart' as ndef;
import 'dart:io'; // Pour vérifier si c'est Android
import 'package:nfc_manager/nfc_manager.dart';
import 'dart:typed_data';

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

  void _startNFCWriting() async {
    try {
// check if NFC is available on the device or not.
      bool isAvailable = await NfcManager.instance.isAvailable();

// If NFC is available, start a session to listen for NFC tags.
      if (isAvailable) { 
 NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {

        try {
//When an NFC tag is discovered, we check if it supports NDEF technology.
          NdefMessage message =
              NdefMessage([NdefRecord.createText('Hello, NFC!')]);
          await Ndef.from(tag)?.write(message);//If it supports NDEF, create an NDEF message and write it to the tag.
          debugPrint('Data emitted successfully');
          Uint8List payload = message.records.first.payload;
          String text = String.fromCharCodes(payload);
          debugPrint("Written data: $text");

//stop the NFC Session
          NfcManager.instance.stopSession();
        } catch (e) {
          debugPrint('Error emitting NFC data: $e');
        }
      });
      } else {
        debugPrint('NFC not available.');
      }
    } catch (e) {
      debugPrint('Error writing to NFC: $e');
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
                  _startNFCWriting();
                  print("Bouton Export - Transfert de données appuyé.");
                },
                child: Text('Lancer le transfere de données'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
