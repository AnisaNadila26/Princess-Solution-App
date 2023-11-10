import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PengaturanNotifier extends ChangeNotifier {
  final BuildContext context;

  PengaturanNotifier(this.context) {
    loadPermissions();
  }

  bool cameraPermission = false;
  bool folderPermission = false;
  bool isShow = false;

  Future<void> toggleCameraPermission(bool newValue) async {
    final status = await Permission.camera.request();
    cameraPermission = status.isGranted;
    savePermissions();
    notifyListeners();
  }

  Future<void> toggleFolderPermission(bool newValue) async {
    final status = await Permission.storage.request();
    folderPermission = status.isGranted;
    savePermissions();
    notifyListeners();
  }

  Future<void> openDeviceSettings() async {
    await openAppSettings();
  }

  void toggleAbout() {
    isShow = !isShow;
    notifyListeners();
  }

  Future<void> loadPermissions() async {
    final prefs = await SharedPreferences.getInstance();
    cameraPermission = prefs.getBool('cameraPermission') ?? false;
    folderPermission = prefs.getBool('folderPermission') ?? false;
    notifyListeners();
  }

  Future<void> savePermissions() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('cameraPermission', cameraPermission);
    prefs.setBool('folderPermission', folderPermission);
  }
}
