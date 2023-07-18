import 'package:flutter/material.dart';
import 'package:princess_solution/network/network.dart';
import 'package:url_launcher/url_launcher.dart';

class KonsultasiNotifier extends ChangeNotifier {
  final BuildContext context;

  KonsultasiNotifier(this.context);
  // launchWhatsapp();

  launchWhatsapp() async {
    if (await canLaunchUrl(Uri.parse(NetworkURL.sendWA()))) {
      await launchUrl(Uri.parse(NetworkURL.sendWA()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Anda tidak memiliki aplikasi WhatsApp"),
        ),
      );
    }
  }
}
