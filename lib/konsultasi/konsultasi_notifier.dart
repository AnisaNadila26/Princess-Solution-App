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
        SnackBar(
          content: Text(
            "Anda tidak memiliki aplikasi WhatsApp",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          backgroundColor: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(50),
          elevation: 30,
        ),
      );
    }
  }
}
