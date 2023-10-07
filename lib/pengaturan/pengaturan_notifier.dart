import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PengaturanNotifier extends ChangeNotifier {
  final BuildContext context;

  PengaturanNotifier(this.context);

  bool cameraPermission = false;
  bool folderPermission = false;

  Future<void> toggleCameraPermission(bool newValue) async {
    final status = await Permission.camera.request();
    cameraPermission = status.isGranted;
    notifyListeners();
  }

  Future<void> toggleFolderPermission(bool newValue) async {
    final status = await Permission.storage.request();
    folderPermission = status.isGranted;
    notifyListeners();
  }

  Future<void> openDeviceSettings() async {
    await openAppSettings();
  }
}
